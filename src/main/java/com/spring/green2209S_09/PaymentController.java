package com.spring.green2209S_09;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.green2209S_09.service.CartService;
import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.OrderService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.CartVO;
import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.OrderVO;
import com.spring.green2209S_09.vo.PaymentVO;
import com.spring.green2209S_09.vo.Payment_inputVO;
import com.spring.green2209S_09.vo.ProductAllVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	OrderService orderService;
	
	// 결제창 호출하기
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String merchantGet(Model model, HttpSession session, String member_cart_idx) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		CartVO cart_vo = new CartVO();
		ArrayList<CartVO> cart_vos = new ArrayList<>();
		String member_cart_idx_arr[] = member_cart_idx.split("/");
		
		for(int i=0; i<member_cart_idx_arr.length; i++) {
			cart_vo = cartService.get_cart_search(member_cart_idx_arr[i]);
			cart_vos.add(cart_vo);
		}
		
		String member_tel[] = new String[3]; 
		member_tel = member_vo.getMember_phone().split("-");
		for(int i=0; i<member_tel.length; i++) {
			model.addAttribute("member_phone"+(i+1),member_tel[i]);
		}
		String member_email[] = new String[2];
		member_email = member_vo.getMember_email().split("@");
		for(int i=0; i<member_email.length; i++) {
			model.addAttribute("member_email"+(i+1),member_email[i]);
		}
		
		model.addAttribute("member_vo", member_vo);
		model.addAttribute("cart_vos", cart_vos);
		model.addAttribute("cart_vos_size", cart_vos.size());
		
		return "payment/payment";
	}
	
	// 결제창 호출하기
	@Transactional
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String merchantPost(Payment_inputVO inputVO, Model model, HttpSession session) {
		String paymethod = inputVO.getAddr_paymethod();
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		OrderVO vo = new OrderVO();
		vo.setOrder_address(inputVO.getPostcode()+"/"+inputVO.getRoadAddress()+"/"+inputVO.getDetailAddress()+"/"+inputVO.getExtraAddress()+"/");
		vo.setOrder_phone(inputVO.getBuyer_tel1()+"-"+inputVO.getBuyer_tel2()+"-"+inputVO.getBuyer_tel3());
		vo.setOrder_email(inputVO.getBuyer_email1()+"@"+inputVO.getBuyer_email2());
		vo.setCashreceipt_personal_number(inputVO.getCashreceipt_personal_number1()+"-"+inputVO.getCashreceipt_personal_number2()+"-"+inputVO.getCashreceipt_personal_number3());
		vo.setMember_idx(member_vo.getMember_idx());
		
		// 무통장입금 결제시
		if(paymethod.equals("cash")) {
			int res = 0;
			// 주문 DB에 주문내역 저장.
			res = orderService.set_cash_order(vo, inputVO);
			// 문의사항 내용이 있을시 문의 내용을 저장.
			if(!inputVO.getQuestion().equals("") && !inputVO.getQuestion_pwd().equals("")) {
				orderService.set_question(member_vo, inputVO, inputVO.getQuestion().substring(0,10));
			}
			// 주문 DB에 저장된 상품은 cart에서 제거.
			if(res == 1) {
				String[] cart_idx_arr = inputVO.getMember_cart_idx().split("/");
				for(int i=0; i<cart_idx_arr.length; i++) {
					cartService.set_cart_product_delete(cart_idx_arr[i]);
				}
			}
			// 구입한 상품의 가장 앞에 있는 상품의 자료를 가져오기 위함.
			String[] cart_idx_arr = inputVO.getMember_cart_idx().split("/");
			// 총 구매 수량 더하기
			int order_count = 0;
			String[] order_count_arr = inputVO.getOrder_count().split("/");
			for(int i=0; i<order_count_arr.length; i++) {
				order_count += Integer.parseInt(order_count_arr[i]);
			}
			ProductAllVO product_vo = productService.get_product_search(cart_idx_arr[0]);
			int basket = cartService.get_member_cart_count(member_vo.getMember_idx());
			session.setAttribute("basket", basket);
			model.addAttribute("product_name",product_vo.getProduct_name());
			model.addAttribute("inputVO",inputVO);
			model.addAttribute("order_count",order_count);
			
			// 포인트 사용액만큼 포인트 차감
			memberService.set_member_point_update(member_vo.getMember_idx(), inputVO.getOrder_point());
			return "payment/cashView";
		}
		// 신용카드 결제시
		else if(paymethod.equals("card")) {
			PaymentVO payVO = new PaymentVO();
			// 총 구매 수량 더하기
			int order_count = 0;
			String[] order_count_arr = inputVO.getOrder_count().split("/");
			for(int i=0; i<order_count_arr.length; i++) {
				order_count += Integer.parseInt(order_count_arr[i]);
			}
			int size = inputVO.getProduct_idx().split("/").length;
			String idx_arr[] = inputVO.getProduct_idx().split("/");
			ProductAllVO product_vo = productService.get_product_search(idx_arr[0]);
			payVO.setName(product_vo.getProduct_name()+"등 "+order_count+"개");
			payVO.setAmount(inputVO.getOrder_tot_price());
			payVO.setBuyer_email(inputVO.getBuyer_email1()+"@"+inputVO.getBuyer_email2());
			payVO.setBuyer_name(inputVO.getBuyer_name());
			payVO.setBuyer_tel(inputVO.getBuyer_tel1()+"-"+inputVO.getBuyer_tel2()+"-"+inputVO.getBuyer_tel3());
			payVO.setBuyer_addr(inputVO.getRoadAddress()+" "+inputVO.getDetailAddress()+" "+inputVO.getExtraAddress());
			payVO.setBuyer_postcode(inputVO.getPostcode());
			session.setAttribute("sPayMentVO",payVO);
			session.setAttribute("inputVO", inputVO);
		}
		return "payment/paymentView";
	}
	
	// 결제창 호출하기
	@Transactional
	@RequestMapping(value = "/paymentOk", method = RequestMethod.GET)
	public String merchantOkGet(Model model, HttpSession session) {
		PaymentVO vo = (PaymentVO) session.getAttribute("sPayMentVO");
		Payment_inputVO inputVO = (Payment_inputVO) session.getAttribute("inputVO");
		
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		OrderVO order_vo = new OrderVO();
		order_vo.setOrder_address(inputVO.getPostcode()+"/"+inputVO.getRoadAddress()+"/"+inputVO.getDetailAddress()+"/"+inputVO.getExtraAddress()+"/");
		order_vo.setOrder_phone(inputVO.getBuyer_tel1()+"-"+inputVO.getBuyer_tel2()+"-"+inputVO.getBuyer_tel3());
		order_vo.setOrder_email(inputVO.getBuyer_email1()+"@"+inputVO.getBuyer_email2());
		order_vo.setCashreceipt_personal_number(inputVO.getCashreceipt_personal_number1()+"-"+inputVO.getCashreceipt_personal_number2()+"-"+inputVO.getCashreceipt_personal_number3());
		order_vo.setMember_idx(member_vo.getMember_idx());
		
		// 주문 DB에 주문내역 저장.
		int res = 0;
		res = orderService.set_card_order(order_vo, inputVO);
		// 문의사항 내용이 있을시 문의 내용을 저장.
		if(!inputVO.getQuestion().equals("") && !inputVO.getQuestion_pwd().equals("")) {
			orderService.set_question(member_vo, inputVO, inputVO.getQuestion().substring(0,10));
		}
		// 주문 DB에 저장된 상품은 cart에서 제거.
		if(res == 1) {
			String[] cart_idx_arr = inputVO.getMember_cart_idx().split("/");
			for(int i=0; i<cart_idx_arr.length; i++) {
				cartService.set_cart_product_delete(cart_idx_arr[i]);
			}
		}
		
		int basket = cartService.get_member_cart_count(member_vo.getMember_idx());
		session.setAttribute("basket", basket);
		model.addAttribute("vo", vo);
		session.removeAttribute("sPayMentVO");
		session.removeAttribute("inputVO");
		
		// 포인트 사용액만큼 포인트 차감
		memberService.set_member_point_update(member_vo.getMember_idx(), inputVO.getOrder_point());
		return "payment/cardView";
	}
	
}
