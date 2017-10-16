package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.qnaVO;

public class qnaProcessController implements Controller{

	private String url;
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		//HttpSession session = request.getSession();
		// 파라미터 추출
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		System.out.println("title : " + title + " writer : " + writer + " content : " + content );
		
		// VO객체 생성 및 초기화
		qnaVO qna = new qnaVO();
		qna.setTitle(title);
		qna.setWriter(writer);
		qna.setContent(content);
		
		//review.setReg_date(reg_date);
		
		System.out.println(qna.toString());		
		// DB접속
		DAO dao = new DAO();
		int board_no = dao.selectNo();
		dao.insertQnABoard(qna);
		qna.setBoard_no(board_no);
		//session.setAttribute("qna", qna);
		
		
		url = request.getContextPath()+"/qnaList.do";
		
		// 공유영역 등록
//		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
				
		return "/CSBoard/qnaProcess.jsp";
	}
	
}
