package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.qnaVO;

public class ModifiedqnaListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		
		DAO dao = new DAO();
		qnaVO board = dao.selectQnABoardByNo(no);
		
		request.setAttribute("board", board);
		return "/CSBoard/ModifiedqnaList.jsp";
	}

}
