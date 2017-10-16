package kr.co.bit.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.co.bit.dao.DAO;
import kr.co.bit.sign.vo.SignVO;
import kr.co.bit.util.BitFileNamePolicy;
import kr.co.bit.vo.fileVO;
import kr.co.bit.vo.replyVO;
import kr.co.bit.vo.reviewVO;

public class ReplyWriteController implements Controller{
	private String url;
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		
		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");
		String writer =  request.getParameter("writer");
		String content = request.getParameter("content");
		String board_no = request.getParameter("board_no");
		String msg = "";
		try {
		SignVO userVO = (SignVO)session.getAttribute("userVO");
		if(userVO!=null) {
			writer = userVO.getId();
		}
		// 파라미터 추출
		// VO객체 생성 및 초기화
		replyVO reply = new replyVO();
		reply.setBoard_no(Integer.parseInt(board_no));
		reply.setContent(content);
		reply.setWriter(writer);
		
		// 등록할 게시글 번호 추출
		DAO dao = new DAO();

		// DB접속
		dao.insertReply(reply);
		
		//session.setAttribute("review", review);
		
		System.out.println(reply.toString());
		}catch(Exception e) {
			e.printStackTrace();
			msg = "댓글을 등록 중에 오류가 발생했습니다. 잠시 후 다시 시도해주세요.";
		}
		
		if("".equals(msg))
			msg = "댓글을 등록했습니다.";
		
		String url = request.getContextPath()+"/detail.do?no="+board_no;
		System.out.println(url);
		
		
		// 공유영역 등록
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("no", board_no);
		
		

		
		return "/AfterBoard/replyWrite.jsp";
		
	}
	
}
