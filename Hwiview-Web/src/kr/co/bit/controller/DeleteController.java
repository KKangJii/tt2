package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.sign.dao.SignDAO;
import kr.co.bit.sign.vo.SignVO;

public class DeleteController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "";
		String url = "";
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		SignVO userVO = (SignVO)session.getAttribute("userVO");
		SignDAO dao = new SignDAO();
		dao.delete(userVO);
		session.invalidate();
		
		msg = "회원탈퇴 완료!!";
		url = request.getContextPath();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
				
		return "/sign/delete.jsp";
	}

}
