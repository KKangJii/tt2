package kr.co.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.fileVO;
import kr.co.bit.vo.replyVO;
import kr.co.bit.vo.reviewVO;

public class DetailController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		DAO dao = new DAO();
		reviewVO board = dao.selectBoardByNo(no);
		List<fileVO> fileList = dao.selectFileByNo(no);
		
		request.setAttribute("board", board);
		request.setAttribute("fileList", fileList);
		
		
		//리플 시작

		// 현재 페이지 번호 저장 변수
				int pageNo = 1;
				try {
					// 페이지 파라미터가 있는 경우 현재 페이지 번호를 설정
					pageNo = Integer.parseInt(request.getParameter("pageNo"));
				} catch(Exception e) {
				}
				
				DAO bDao = new DAO();
				// 해당 페이지의 게시글 목록
				List<replyVO> listpaging = bDao.selectReplyList(no, pageNo);
				// 전체 게시글 카운트
				int totalCount = bDao.selectReplyCount(no);

				// 한페이지에 보여질 목록 수
				int listSize = 5;
				// 마지막 페이지 구하기
				int lastPage = (totalCount % listSize == 0) ? totalCount / listSize 
						                                    : totalCount / listSize + 1;	
				
				request.setAttribute("replyPageNo"  , pageNo);
				request.setAttribute("replyLastPage", lastPage);
				request.setAttribute("replyListpaging"    , listpaging);
				
				for(replyVO vo : listpaging) {
					System.out.println(vo);
				}

				// ======================================================================
				// 탭 관련 작업 추가 파트
				// ======================================================================
				// 목록에 보여질 탭 사이즈
				int tabSize  = 3;
				// 현재 페이지에 해당하는 탭 위치 
				int currTab   = (pageNo  -1) / tabSize + 1;
				int beginPage = (currTab -1) * tabSize + 1;
				int endPage   = (currTab * tabSize < lastPage) ? currTab * tabSize 
						                                       : lastPage;
				
				request.setAttribute("beginPage", beginPage);
				request.setAttribute("endPage"  , endPage);
				// ======================================================================
				
		//리플 종료
		
		return "/AfterBoard/detail.jsp";
	}
	
	

}
