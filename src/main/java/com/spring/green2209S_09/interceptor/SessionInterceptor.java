package com.spring.green2209S_09.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String menu = session.getAttribute("menu")==null? "" : (String) session.getAttribute("menu");
		
		if(menu.equals("")) { // 세션 만료시 다시 홈컨트롤러로 보내기.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/msg/sessionNo");
			dispatcher.forward(request, response);
			return false;
		}
		
		return true;
	}
}
