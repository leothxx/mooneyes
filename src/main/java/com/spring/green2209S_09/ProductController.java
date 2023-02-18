package com.spring.green2209S_09;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.green2209S_09.pagination.PageProcess;
import com.spring.green2209S_09.pagination.PageVO;
import com.spring.green2209S_09.service.CartService;
import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.MiniCategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;
import com.spring.green2209S_09.vo.SubCategoryVO;
import com.spring.green2209S_09.vo.WishListVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	PageProcess pageProcess;
	
	
	@RequestMapping(value="/product_view",method=RequestMethod.GET)
	public String product_viewGet(Model model, String product_idx) {
		ProductAllVO vo = productService.get_product_search(product_idx);
		int product_point;
		if(vo.getProduct_sale_price() == 0) {
			product_point = (int) (vo.getProduct_price()*0.01);
		}
		else {
			product_point = (int) (vo.getProduct_sale_price()*0.01);
		}
		vo.setProduct_name(vo.getProduct_name().replaceAll("\"", "&quot;"));
		model.addAttribute("vo",vo);
		model.addAttribute("product_point",product_point);
		model.addAttribute("product_vat",product_point*10);
		return "product/mooneyes_product_view";
	}
	
	@RequestMapping(value="/main_category_view",method=RequestMethod.GET)
	public String main_category_viewGet(Model model,
			@RequestParam(name="category_main", defaultValue="0", required = false)int category_main,
			@RequestParam(name="category_sub", defaultValue="0", required = false)int category_sub,
			@RequestParam(name="category_mini", defaultValue="0", required = false)int category_mini,
			@RequestParam(name="pag", defaultValue="1", required = false )int pag,
			@RequestParam(name="pageSize", defaultValue="10", required = false )int pageSize) {
		ArrayList<ProductAllVO> vos = new ArrayList<ProductAllVO>();
		PageVO pageVo = new PageVO();
		
		if(category_main == 0 && category_sub == 0 && category_mini == 0) {
			pageVo = pageProcess.totRecCnt(pag, pageSize, "product", "", "");
			vos = productService.get_product_all(pageVo.getStartIndexNo(), pageSize);
		}
		
		else if(category_main != 0 && category_sub == 0 && category_mini == 0) {
			pageVo = pageProcess.totRecCnt(pag, pageSize, "product", category_main+"", "");
			vos = productService.get_product_main_search(pageVo.getStartIndexNo(), pageSize, category_main+"");
			MainCategoryVO main_vo = productService.get_what_main_category(category_main+"");
			model.addAttribute("category_vo",main_vo);
			model.addAttribute("category_name",main_vo.getCategory_main_name());
			
			// 서브,세부 카테고리 메뉴를 위한 작업
			ArrayList<SubCategoryVO> sub_vos = productService.get_sub_category(category_main);
			model.addAttribute("sub_vos",sub_vos);
		}
		
		else if(category_main != 0 && category_sub != 0 && category_mini == 0) {
			pageVo = pageProcess.totRecCnt(pag, pageSize, "product", category_sub+"", "");
			vos = productService.get_product_sub_search(pageVo.getStartIndexNo(), pageSize, category_sub+"");
			SubCategoryVO sub_vo = productService.get_what_sub_category(category_sub+"");
			model.addAttribute("category_vo",sub_vo);
			model.addAttribute("category_name",sub_vo.getCategory_sub_name());
			
			// 서브,세부 카테고리 메뉴를 위한 작업
			ArrayList<SubCategoryVO> sub_vos = productService.get_sub_category(category_main);
			model.addAttribute("sub_vos",sub_vos);
			ArrayList<MiniCategoryVO> mini_vos = productService.get_mini_category(category_sub);
			model.addAttribute("mini_vos",mini_vos);
		}
		
		else if(category_main != 0 && category_sub != 0 && category_mini != 0) {
			pageVo = pageProcess.totRecCnt(pag, pageSize, "product", category_mini+"", "");
			vos = productService.get_product_mini_search(pageVo.getStartIndexNo(), pageSize, category_mini+"");
			MiniCategoryVO mini_vo = productService.get_what_mini_category(category_mini+"");
			model.addAttribute("category_vo",mini_vo);
			model.addAttribute("category_name",mini_vo.getCategory_mini_name());
			
			// 서브,세부 카테고리 메뉴를 위한 작업
			ArrayList<SubCategoryVO> sub_vos = productService.get_sub_category(category_main);
			model.addAttribute("sub_vos",sub_vos);
			ArrayList<MiniCategoryVO> mini_vos = productService.get_mini_category(category_sub);
			model.addAttribute("mini_vos",mini_vos);
		}
		
		model.addAttribute("vos",vos);
		model.addAttribute("pageVo",pageVo);
		return "product/mooneyes_product_list";
	}
	
	// AJAX 장바구니에서 상품의 컬러 및 사이즈 변경
	@ResponseBody
	@RequestMapping(value="/cart_opt_change",method=RequestMethod.POST)
	public String cart_opt_changePost(String size, String color , String member_cart_idx) {
		int res = 0;
		// 해당 장바구니에 있는 사이즈 및 컬러 업데이트
		res = cartService.set_cart_update(member_cart_idx, size, color);
		
		return res+"";
	}
	
	// AJAX 장바구니에서 상품 삭제
	@ResponseBody
	@RequestMapping(value="/cart_product_delete",method=RequestMethod.POST)
	public String cart_product_deletePost(HttpSession session, String member_cart_idx) {
		int res = 0;
		// 해당 장바구니 상품 삭제
		res = cartService.set_cart_product_delete(member_cart_idx);
		
		// 장바구니 수량 세션에 다시 담기
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		int basket = cartService.get_member_cart_count(vo.getMember_idx());
		session.setAttribute("basket", basket);
		
		return res+"";
	}
	
	// AJAX 장바구니에서 상품 선택 삭제
	@Transactional
	@ResponseBody
	@RequestMapping(value="/select_basket_del",method=RequestMethod.POST)
	public String select_basket_delPost(HttpSession session, String member_cart_idx) {
		int res = 0;
		
		// 해당 장바구니 상품 삭제
		String idx[] = member_cart_idx.split("/");
		for(int i=0; i<idx.length; i++) {
			res = cartService.set_cart_product_delete(idx[i]);
			if(res == 0) break;
		}
		
		// 장바구니 수량 세션에 다시 담기
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		int basket = cartService.get_member_cart_count(vo.getMember_idx());
		session.setAttribute("basket", basket);
		
		return res+"";
	}
	
	// 위시 리스트 이동 폼
	@RequestMapping(value="/wish_list",method=RequestMethod.GET)
	public String wish_listGet(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		ArrayList<WishListVO> vos = productService.get_wish_list(vo.getMember_idx());
		model.addAttribute("vos",vos);
		return "product/mooneyes_product_wishlist";
	}
	
	// 위시 리스트 저장 처리
	@Transactional
	@ResponseBody
	@RequestMapping(value="/wishlist-input",method=RequestMethod.POST)
	public String wishlist_inputPost(HttpSession session, int product_idx, String product_size, String product_color) {
		int res = 0;
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		ProductAllVO productVO = productService.get_product_search(product_idx+"");
		
		if(product_size.equals("") && product_color.equals("")) {
			res = productService.set_wishList(vo.getMember_idx(), productVO,product_size,product_color);
		}
		else {
			System.out.println(product_size);
			System.out.println(product_color);
			String product_size_arr[] = product_size.split("/");
			String product_color_arr[] = product_color.split("/");
			for(int i=0; i<product_size_arr.length; i++) {
				res = productService.set_wishList(vo.getMember_idx(), productVO,product_size_arr[i],product_color_arr[i]);
			}
		}
		return res+"";
	}
	
}
