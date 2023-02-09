package com.spring.green2209S_09;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.MiniCategoryVO;
import com.spring.green2209S_09.vo.ProductUploadVO;
import com.spring.green2209S_09.vo.SubCategoryVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String mainGet() {
		return "admin/mooneyes_admin_main";
	}
	
	@RequestMapping(value="/mooneyes_admin_left",method=RequestMethod.GET)
	public String mooneyes_admin_leftGet() {
		return "admin/mooneyes_admin_left";
	}
	
	@RequestMapping(value="/mooneyes_admin_content",method=RequestMethod.GET)
	public String mooneyes_admin_contentGet() {
		return "admin/mooneyes_admin_content";
	}
	
	// 상품 등록 폼
	@RequestMapping(value="/product_input",method=RequestMethod.GET)
	public String product_inputGet(Model model) {
		// 모든 메인 카테고리 가져오기
		ArrayList<MainCategoryVO> main_vos = productService.get_main_category();
		model.addAttribute("main_vos",main_vos);
		return "product/mooneyes_product_input";
	}
	
	// 상품 등록 처리
	@RequestMapping(value="/product_input",method=RequestMethod.POST)
	public String product_inputPost(ProductUploadVO vo, MultipartHttpServletRequest product_images) {
		// 멀티파일을 서버에 저장시키고, 파일의 정보를 vo에 담아서 DB에 저장시킨다.
		productService.set_product_input(product_images, vo);
		return "redirect:/msg/product_input_ok";
	}
	
	// 메인 카테고리에 따른 서브 카테고리 가져오기
	@ResponseBody
	@RequestMapping(value="/product_sub_category", method=RequestMethod.POST)
	public ArrayList<SubCategoryVO> product_sub_categoryPost(int mainCategory) {
		ArrayList<SubCategoryVO> sub_vos = productService.get_sub_category(mainCategory);
		return sub_vos;
	}
	
	// 서브 카테고리에 따른 세부 카테고리 가져오기
	@ResponseBody
	@RequestMapping(value="/product_mini_category", method=RequestMethod.POST)
	public ArrayList<MiniCategoryVO> product_mini_categoryPost(int subCategory) {
		ArrayList<MiniCategoryVO> mini_vos = productService.get_mini_category(subCategory);
		return mini_vos;
	}
}
