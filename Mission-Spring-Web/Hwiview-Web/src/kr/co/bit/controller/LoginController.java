package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.sign.dao.SignDAO;
import kr.co.bit.sign.vo.SignVO;

public class LoginController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		SignVO loginVO = new SignVO();
		loginVO.setId(id);
		loginVO.setPassword(password);
		SignDAO dao = new SignDAO();
		SignVO userVO = dao.LogInfo(loginVO);
		
		String msg = "";
		String url = "";
		if(userVO != null) {
			msg = "로그인 성공!";
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			if(userVO.getType().equalsIgnoreCase("s")) {
				msg += "관리자님 환영합니다.";
			}else {
				msg +=userVO.getId() + "님 환영합니다.";
			}
			url = request.getContextPath();
		}else {
			msg = "아이디 또는 패스워드가 잘못됬습니다.";
			url = request.getContextPath();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/login/login.jsp";
	}
	
}
