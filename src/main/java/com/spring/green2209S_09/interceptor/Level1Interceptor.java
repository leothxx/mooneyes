package com.spring.green2209S_09.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Level1Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null? 99 : (int) session.getAttribute("sLevel");
		String menu = session.getAttribute("menu")==null? "" : (String) session.getAttribute("menu");
		
		if(menu.equals("")) { // 세션 만료시 다시 홈컨트롤러로 보내기.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/msg/sessionNo");
			dispatcher.forward(request, response);
			return false;
		}
		if(level == 0) {	// 정회원이 아닌경우는 메세지를 통해서 무조건 이메일 인증창으로 보내준다. (준회원)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/msg/emailCheck");
			dispatcher.forward(request, response);
			return false;
		}
		else if(level == 99) { // 회원이 아닐경우 가입창으로 보내기.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/msg/memberNo");
			dispatcher.forward(request, response);
			return false;
		}
		
		return true;
	}
}
