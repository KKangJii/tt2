package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.kaka.vo.KakaoVO;
import kr.co.bit.sign.dao.SignDAO;

public class SearchkakaoInfoController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "";
		String url = "";
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String kakao = request.getParameter("kakaoName");
		SignDAO dao = new SignDAO();
		KakaoVO kakaoVO = (KakaoVO)dao.KakaoInfo(id,kakao);
		if(kakaoVO != null) {
			msg = "확인 성공!";
			HttpSession session = request.getSession();
			session.setAttribute("kakaoVO", kakaoVO);
			msg +=kakaoVO.getName() + "님 환영합니다.";
			url = request.getContextPath();
		}else {
			msg = "등록된 정보가 없습니다.";
			url = request.getContextPath();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/sign/SearchkakaoInfo.jsp";
	}

}
