package kr.co.bit.board.service;

import java.util.List;

import kr.co.bit.board.vo.BoardVO;

/**
 * 
 * @author bit-user
 *
 */
public interface BoardService {
	
	/**
	 *  
	 * @return
	 */
	List<BoardVO> selectAllBoard();
	
	/**
	 * 
	 * @param no
	 * @return
	 */
	BoardVO selectBoardByNo(int no);
	void insertBoard(BoardVO board);
	void modifyBoard(BoardVO board);
	void removeBoard(int no);
}
