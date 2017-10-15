package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.kaka.vo.KakaoVO;
import kr.co.bit.sign.dao.SignDAO;

public class UpdateKakaoInfoController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "";
		String url = "";
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("kakaoid");
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String post = request.getParameter("post");
		String basic_addr = request.getParameter("basic_addr");
		String detail_addr = request.getParameter("detail_addr");
		KakaoVO kakao = new KakaoVO();
		kakao.setId(id);
		kakao.setEmail_id(email_id);
		kakao.setEmail_domain(email_domain);
		kakao.setTel1(tel1);
		kakao.setTel2(tel2);
		kakao.setTel3(tel3);
		kakao.setPost(post);
		kakao.setBasic_addr(basic_addr);
		kakao.setDetail_addr(detail_addr);
		
		KakaoVO userVO = (KakaoVO)session.getAttribute("kakaoVO");
		
		
		SignDAO dao = new SignDAO();
		dao.UpdateKakao(kakao,userVO);
		
		msg = "수정완료!";
		url = request.getContextPath();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/sign/UpdateKakaoInfo.jsp";
	}

}
