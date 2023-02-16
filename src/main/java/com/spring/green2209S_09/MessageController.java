package com.spring.green2209S_09;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	
	@RequestMapping(value="/msg/{msgFlag}", method=RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model,
			@RequestParam(value="mid", defaultValue = "", required = false) String mid,
			@RequestParam(value="flag", defaultValue = "", required = false) String flag) {
		if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("msg", mid + "님 로그인 되었습니다.");
			model.addAttribute("url", "member/memberMain");
		}
		else if(msgFlag.equals("mailError")) {
			model.addAttribute("msg", mid + "님 이메일 전송에 에러가 발생하였습니다. 다시 회원가입 해주세요.");
			model.addAttribute("url", "member/join");
		}
		else if(msgFlag.equals("mooneyes_login_ok")) {
			model.addAttribute("msg", mid + "님 어서오세요.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("mooneyes_login_no")) {
			model.addAttribute("msg", "존재하지 않는 아이디거나, 비밀번호가 올바르지 않습니다.");
			model.addAttribute("url", "member/login");
		}
		else if(msgFlag.equals("mooneyes_logout")) {
			model.addAttribute("msg", mid+"님 로그아웃 되었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("member_update_ok")) {
			model.addAttribute("msg", mid+"님 회원 정보 수정이 완료되었습니다.");
			model.addAttribute("url", "member/my_info?mid="+mid);
		}
		else if(msgFlag.equals("member_update_no")) {
			model.addAttribute("msg", mid+"님 회원 정보 수정에 실패하였습니다. 다시 시도해주세요.");
			model.addAttribute("url", "member/my_info?mid="+mid);
		}
		else if(msgFlag.equals("email_certification_no")) {
			model.addAttribute("msg", mid+"님 이미 이메일 인증이 완료되었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("email_certification_ok")) {
			model.addAttribute("msg", mid+"님 이메일 인증이 완료되었습니다. <br/> 적립금 1000원 지급 후 정회원으로 등업되었습니다.");
			model.addAttribute("url", "");
		}
		else if(msgFlag.equals("email_certification_x")) {
			model.addAttribute("msg", "올바르지 않은 인증코드 입니다.");
			model.addAttribute("url", "member/email_certification");
		}
		else if(msgFlag.equals("product_input_ok")) {
			model.addAttribute("msg", "관리자님 상품 등록이 완료되었습니다!");
			model.addAttribute("url", "admin/product_input");
		}
		else if(msgFlag.equals("adminNo")) {
			model.addAttribute("msg", "관리자만 입장 가능합니다.<br/>다시 시도해주세요.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("sessionNo")) {
			model.addAttribute("msg", "세션이 만료되었습니다.<br/>다시 시도해주세요.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("emailCheck")) {
			model.addAttribute("msg", "회원 이메일 인증 처리 후 다시 이용해주세요.");
			model.addAttribute("url", "member/email_certification");
		}
		else if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("url", "member/login");
		}
		else if(msgFlag.equals("cart_ok")) {
			model.addAttribute("msg", "장바구니에 상품을 담으셨습니다.");
			model.addAttribute("url", "product/product_view?product_idx="+mid);
		}
		
		return "include/message";
	}
}
