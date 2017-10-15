package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller{
	String msg = "";
	String url = "";
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		msg = "로그아웃 완료!";
		url = request.getContextPath();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/login/logout.jsp";
	}

}
