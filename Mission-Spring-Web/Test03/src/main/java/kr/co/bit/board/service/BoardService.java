package kr.co.bit.board.service;

import java.util.List;

import kr.co.bit.board.vo.BoardVO;

public interface BoardService {
	List<BoardVO> selectAllBoard();
	BoardVO selectOne(int no);
	void insertBoard(BoardVO board);
	void modifyBoard(BoardVO board);
	void deleteBoard(int no);
}
