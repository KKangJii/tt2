package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;

public class DeleteReplyController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "";
		
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		DAO dao = new DAO();
		dao.deleteReply(no);
		
		url = request.getContextPath() + "/detail.do?no=" + board_no;
		
		request.setAttribute("url", url);
		return "/AfterBoard/deleteReply.jsp";
	}

}
