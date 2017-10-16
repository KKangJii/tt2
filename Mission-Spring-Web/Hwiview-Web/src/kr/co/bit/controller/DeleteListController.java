package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.dao.DAO;

public class DeleteListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "";
		String url = "";
		
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		DAO dao = new DAO();
		dao.deleteFile(no);
		dao.deleteReplyAll(no);
		dao.deleteReviewByNo(no);
		
		msg = "게시글 삭제 완료!!";
		url = request.getContextPath() + "/List.do";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		
		return "/AfterBoard/deleteList.jsp";
	}

}
