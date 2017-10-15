package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.reviewVO;

public class ModifiedListController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		
		DAO dao = new DAO();
		reviewVO board = dao.selectBoardByNo(no);
		
		request.setAttribute("board", board);
		return "/AfterBoard/ModifiedList.jsp";
	}

}
