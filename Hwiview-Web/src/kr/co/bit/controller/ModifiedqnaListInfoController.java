package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.qnaVO;
import kr.co.bit.vo.reviewVO;

public class ModifiedqnaListInfoController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String msg = "";
		String url = "";
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		qnaVO board = new qnaVO();
		board.setTitle(title);
		board.setContent(content);
		board.setBoard_no(no);
		
		DAO dao = new DAO();
		dao.UpdateqnaBoard(board);
		
		msg = "수정 완료!";
		url = request.getContextPath()+ "/qnaList.do";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/CSBoard/ModifiedqnaListInfo.jsp";
	}

}
