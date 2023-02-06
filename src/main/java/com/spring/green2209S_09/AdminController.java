package com.spring.green2209S_09;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.green2209S_09.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	MemberService memberService;
	
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
	public String product_inputGet() {
		return "product/mooneyes_product_input";
	}
}
