package com.spring.green2209S_09;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.green2209S_09.pagination.PageProcess;
import com.spring.green2209S_09.pagination.PageVO;
import com.spring.green2209S_09.service.CartService;
import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.OrderService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.CartVO;
import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.OrderVO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value="/order_list",method=RequestMethod.GET)
	public String order_listGet(HttpSession session, Model model,
			@RequestParam(name="pag", defaultValue="1", required = false)int pag,
			@RequestParam(name="pageSize", defaultValue="5", required = false)int pageSize,
			@RequestParam(name="payment", defaultValue="", required = false)String payment) {
		
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		String member_idx = "";
		if(member_vo != null) {
			member_idx = member_vo.getMember_idx()+"";
		}
		
		PageVO pageVo = new PageVO();
		pageVo = pageProcess.totRecCnt(pag, pageSize, "payment", payment, member_idx);
		
		if(member_vo != null) {
			ArrayList<OrderVO> vos = orderService.get_mooneyes_order_list(pageVo.getStartIndexNo(), pageSize, member_vo.getMember_idx(), payment);
			ArrayList<OrderVO> vos_image = new ArrayList<OrderVO>();
			String[] product_idx_arr;
			String product_idx = "";
			String order_idx = "";
			if(vos != null) {
				for(int i=0; i<vos.size(); i++) {
					OrderVO order_vo = vos.get(i);
					product_idx_arr = order_vo.getProduct_idx().split("/");
					product_idx += product_idx_arr[0] + "/";
					
					order_idx += order_vo.getOrder_idx() + "/";
				}
			}
			String[] product_idx_image = product_idx.split("/");
			String[] order_idx_arr = order_idx.split("/");
			
			for(int i=0; i<product_idx_image.length; i++) {
				OrderVO order_vo = orderService.get_mooneyes_order_image_list(member_vo.getMember_idx(), product_idx_image[i], order_idx_arr[i]);
				vos_image.add(i,order_vo);
			}
			if(vos_image != null) {
				model.addAttribute("vos",vos_image);
			}
			model.addAttribute("member_vo",member_vo);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("payment",payment);
		}
		return "order/mooneyes_order_list";
	}
	
	@RequestMapping(value="/order_list_view",method=RequestMethod.GET)
	public String order_viewGet(HttpSession session, Model model,int order_idx,
			@RequestParam(name="membert_cart_idx", defaultValue="", required = false) String member_cart_idx) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		OrderVO vo = orderService.get_mooneyes_order(order_idx);
		String[] address_arr = vo.getOrder_address().split("/");
		String[] phone_arr = vo.getOrder_phone().split("-");
		String[] email_arr = vo.getOrder_email().split("@");
		String[] cashreceipt_personal_number_arr; 
		if(vo.getCashreceipt_personal_number() != null && !vo.getCashreceipt_personal_number().equals("010--") && !vo.getCashreceipt_personal_number().equals("")) {
			cashreceipt_personal_number_arr = vo.getCashreceipt_personal_number().split("-");
			model.addAttribute("cashreceipt_personal_number1", cashreceipt_personal_number_arr[0]);
			model.addAttribute("cashreceipt_personal_number2", cashreceipt_personal_number_arr[1]);
			model.addAttribute("cashreceipt_personal_number3", cashreceipt_personal_number_arr[2]);
		}
		else {
			model.addAttribute("cashreceipt_personal_number1", "");
			model.addAttribute("cashreceipt_personal_number2", "");
			model.addAttribute("cashreceipt_personal_number3", "");
		}
		model.addAttribute("postCode",address_arr[0]);
		model.addAttribute("roadAddress",address_arr[1]);
		model.addAttribute("detailAddress",address_arr[2]);
		model.addAttribute("member_phone1",phone_arr[0]);
		model.addAttribute("member_phone2",phone_arr[1]);
		model.addAttribute("member_phone3",phone_arr[2]);
		model.addAttribute("member_email1",email_arr[0]);
		model.addAttribute("member_email2",email_arr[1]);
		if(address_arr.length > 3) {
			model.addAttribute("extraAddress",address_arr[3]);
		}
		else {
			model.addAttribute("extraAddress"," ");
		}
		model.addAttribute("vo",vo);
		model.addAttribute("member_vo",member_vo);
		
		// 주문한 상품 정보 모두 가져오기
		CartVO cart_vo = new CartVO();
		ArrayList<CartVO> cart_vos = new ArrayList<>();
		String product_idx_arr[] = vo.getProduct_idx().split("/");
		String order_count_arr[] = vo.getOrder_count().split("/");
		String order_option_arr[] = vo.getOrder_option().split(":");
		
		for(int i=0; i<product_idx_arr.length; i++) {
			cart_vo = productService.get_product_info_search(product_idx_arr[i]);
			cart_vo.setProduct_count(Integer.parseInt(order_count_arr[i]));
			String order_option[] = order_option_arr[i].split("/");
			cart_vo.setProduct_color(order_option[0]);
			cart_vo.setProduct_size(order_option[1]);
			cart_vos.add(cart_vo);
		}
		
		model.addAttribute("cart_vos",cart_vos);
		model.addAttribute("cart_vos_size", cart_vos.size());
		return "order/mooneyes_order_view";
	}
	
	// 주문 취소 신청시
	@ResponseBody
	@RequestMapping(value="/order_cancel",method=RequestMethod.POST)
	public String order_cancelPost(int order_idx) {
		int res = 0;
		res = orderService.set_mooneyes_order_cancel(order_idx);
		return res+"";
	}
	
	
}
