package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.qnaVO;

public class ReplyProcessController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String url = "";
		String msg = "";
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		System.out.println("title : " + title + " writer : " + writer + " content : " + content + " no : " + no);
		
		
		// VO객체 생성 및 초기화
		qnaVO qna = new qnaVO();
		qna.setBoard_no(no);
		qna.setTitle(title);
		qna.setWriter(writer);
		qna.setContent(content);
		
		//review.setReg_date(reg_date);
		
		System.out.println(qna.toString());		
		// DB접속
		DAO dao = new DAO();
		dao.Reply(qna);
		
		msg = "답글등록 완료!";
		url = request.getContextPath()+"/qnaList.do";
		
		// 공유영역 등록
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "CSBoard/ReplyProcess.jsp";
	}

}
