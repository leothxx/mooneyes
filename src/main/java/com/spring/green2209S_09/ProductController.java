package com.spring.green2209S_09;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.ProductAllVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	
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
}
