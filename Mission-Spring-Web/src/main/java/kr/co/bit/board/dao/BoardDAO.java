package kr.co.bit.board.dao;

import java.util.List;

import kr.co.bit.board.vo.BoardVO;

public interface BoardDAO {

	List<BoardVO> selectAll();
	BoardVO selectOne(int no);
	void insert(BoardVO board);
	void update(BoardVO board);
	void delete(int no);
}
