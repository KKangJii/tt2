package kr.co.bit.controller;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.bit.dao.DAO;
import kr.co.bit.util.BitFileNamePolicy;
import kr.co.bit.vo.fileVO;
import kr.co.bit.vo.reviewVO;

public class writeProcessController implements Controller{
	private String url;
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String saveFolder = "E:\\Lecture\\web-workspace\\Hwiview-Web\\WebContent\\upload";
		
		MultipartRequest multi = new MultipartRequest(
				request, saveFolder, 1024 * 1024 * 3, "utf-8", new BitFileNamePolicy()
				);
		
		//HttpSession session = request.getSession();
		// 파라미터 추출
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String reg_date = multi.getParameter("reg_date");
		System.out.println("title : " + title);
		System.out.println("writer : " + writer);
		System.out.println("content : " + content);
		System.out.println("reg_date : " + reg_date);
		// VO객체 생성 및 초기화
		reviewVO review = new reviewVO();
		review.setTitle(title);
		review.setWriter(writer);
		review.setContent(content);
		review.setReg_date(reg_date);
		
		// 등록할 게시글 번호 추출
		DAO dao = new DAO();
		int board_no = dao.selectNo(); // 여기바꿔야댐

		reviewVO board = new reviewVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		board.setBoard_no(board_no);

		// DB접속
		dao.insertBoard(board);
		
		//session.setAttribute("review", review);
		
		System.out.println(board.toString());
		
		
		
		//첨부파일 저장
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()){
			String fileName = (String)files.nextElement();
			
			File f = multi.getFile(fileName);
			if(f != null){
				String fileOriName = multi.getOriginalFileName(fileName);
				String fileSaveName = multi.getFilesystemName(fileName);
				int fileSize = (int)f.length();
				
				// 첨부파일 객체 생성 및 초기화
				fileVO file = new fileVO();
				file.setFile_ori_name(fileOriName);
				file.setFile_save_name(fileSaveName);
				file.setFile_size(fileSize);
				file.setBoard_no(board_no);
				
				dao.insertFile(file);
				
				System.out.println(file.toString());
			}
		}
		
		
		url = request.getContextPath() + "/List.do";
		
		// 공유영역 등록
//		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		

		
		return "/AfterBoard/writeProcess.jsp";
		
	}
	
}
