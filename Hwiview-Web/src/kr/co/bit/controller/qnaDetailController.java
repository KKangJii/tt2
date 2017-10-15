package kr.co.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.fileVO;
import kr.co.bit.vo.qnaVO;

public class qnaDetailController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		DAO dao = new DAO();
		qnaVO qnaboard = dao.selectQnABoardByNo(no);
		List<fileVO> qnafileList = dao.selectFileByNo(no);
		
		request.setAttribute("qnaboard", qnaboard);
		request.setAttribute("qnafileList", qnafileList);
		return "/CSBoard/qnadetail.jsp";
	}

}
