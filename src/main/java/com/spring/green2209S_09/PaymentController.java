package com.spring.green2209S_09;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.green2209S_09.service.CartService;
import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.CartVO;
import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.PaymentVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	// 결제창 호출하기
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String merchantGet(Model model, HttpSession session, int member_cart_idx) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		CartVO cart_vo = cartService.get_cart_search(member_cart_idx);
		
		model.addAttribute("member_vo", member_vo);
		model.addAttribute("cart_vo", cart_vo);

		return "payment/payment";
	}
	
	// 결제창 호출하기
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String merchantPost(Model model, HttpSession session) {
		return "payment/paymentView";
	}
	
	// 결제창 호출하기
	@RequestMapping(value = "/paymentOK", method = RequestMethod.GET)
	public String merchantOkGet(Model model, HttpSession session) {
		PaymentVO vo = (PaymentVO) session.getAttribute("sPayMentVO");
		model.addAttribute("vo", vo);
		session.removeAttribute("sPayMentVO");
		return "payment/paymentOK";
	}
}
