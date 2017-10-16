package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginkakaoController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getContextPath();
		String name = request.getParameter("name");
		
		HttpSession session = request.getSession();
		session.setAttribute("kakao", name);
		request.setAttribute("url", url);
		
		
		return "/login/Loginkakao.jsp";
	}

}
