package kr.co.bit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.board.dao.BoardDAO;
import kr.co.bit.board.vo.BoardVO;

@Service
public class BoardServiceimpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public List<BoardVO> selectAllBoard() {
		List<BoardVO> list = dao.selectAll();
		return list;
	}

	@Override
	public BoardVO selectOne(int no) {
		return dao.selectOne(no);
	}

	@Override
	public void insertBoard(BoardVO board) {
		dao.insert(board);
	}

	@Override
	public void modifyBoard(BoardVO board) {
		dao.modify(board);
		
	}

	@Override
	public void deleteBoard(int no) {
		dao.delete(no);
	}

}
