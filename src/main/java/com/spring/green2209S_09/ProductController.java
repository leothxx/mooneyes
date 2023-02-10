package com.spring.green2209S_09;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.green2209S_09.pagination.PageProcess;
import com.spring.green2209S_09.pagination.PageVO;
import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
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
			@RequestParam(name="pag", defaultValue="1", required = false )int pag,
			@RequestParam(name="pageSize", defaultValue="10", required = false )int pageSize) {
		ArrayList<ProductAllVO> vos = new ArrayList<ProductAllVO>();
		PageVO pageVo = new PageVO();
		if(category_main == 0) {
			pageVo = pageProcess.totRecCnt(pag, pageSize, "product", "", "");
			vos = productService.get_product_all(pageVo.getStartIndexNo(), pageSize);
		}
		else if(category_main != 0) {
			pageVo = pageProcess.totRecCnt(pag, pageSize, "product", category_main+"", "");
			vos = productService.get_product_main_search(pageVo.getStartIndexNo(), pageSize, category_main+"");
		}
		MainCategoryVO category_main_vo = productService.get_what_main_category(category_main+"");
		model.addAttribute("category_main_vo",category_main_vo);
		model.addAttribute("vos",vos);
		model.addAttribute("pageVo",pageVo);
		return "product/mooneyes_product_list";
	}
}
