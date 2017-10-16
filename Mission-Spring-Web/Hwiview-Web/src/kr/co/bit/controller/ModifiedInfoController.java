package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.sign.dao.SignDAO;
import kr.co.bit.sign.vo.SignVO;

public class ModifiedInfoController implements Controller{


	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String msg = "";
		String url = "";
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String post = request.getParameter("post");
		String basic_addr = request.getParameter("basic_addr");
		String detail_addr = request.getParameter("detail_addr");
		SignVO sign = new SignVO();
		sign.setName(name);
		sign.setEmail_id(email_id);
		sign.setEmail_domain(email_domain);
		sign.setTel1(tel1);
		sign.setTel2(tel2);
		sign.setTel3(tel3);
		sign.setPost(post);
		sign.setBasic_addr(basic_addr);
		sign.setDetail_addr(detail_addr);
		
		SignVO userVO = (SignVO)session.getAttribute("userVO");
		
		
		SignDAO dao = new SignDAO();
		dao.Update(sign,userVO);
		
		msg = "수정완료!";
		url = request.getContextPath() + "/Modified.jsp";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/sign/ModifiedInfo.jsp";
	}
}
