package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.sign.dao.SignDAO;
import kr.co.bit.sign.vo.SignVO;

public class MyPageController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		SignVO userVO = (SignVO)session.getAttribute("userVO");
		SignDAO signd = new SignDAO();
		SignVO sign = signd.Mypage(userVO);
		
		session.setAttribute("sign", sign);
		return "/sign/MyPage.jsp";
	}

}
