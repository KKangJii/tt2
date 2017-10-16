package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.kaka.vo.KakaoVO;
import kr.co.bit.sign.dao.SignDAO;

public class MyPageKakaoController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		KakaoVO kakaoVO = (KakaoVO)session.getAttribute("kakaoVO");
		System.out.println(kakaoVO.getName());
		SignDAO dao = new SignDAO();
		KakaoVO mykakaoVO = dao.MypageKakao(kakaoVO);
		
		session.setAttribute("mykakaoVO", mykakaoVO);
		
		return "/sign/MyPageKakao.jsp";
	}

}
