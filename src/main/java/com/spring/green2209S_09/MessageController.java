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
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("mooneyes_login_no")) {
			model.addAttribute("msg", "존재하지 않는 아이디거나, 비밀번호가 올바르지 않습니다.");
			model.addAttribute("url", "member/login");
		}
		else if(msgFlag.equals("mooneyes_logout")) {
			model.addAttribute("msg", mid+"님 로그아웃 되었습니다.");
			model.addAttribute("url", "/");
		}
		
		return "include/message";
	}
}
