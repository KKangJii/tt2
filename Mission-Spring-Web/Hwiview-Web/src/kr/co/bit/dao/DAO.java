package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import kr.co.bit.util.ConnectionFactory;
import kr.co.bit.vo.buyVO;
import kr.co.bit.vo.fileVO;
import kr.co.bit.vo.qnaVO;
import kr.co.bit.vo.replyVO;
import kr.co.bit.vo.reviewVO;

public class DAO {
	
	private static final int LIST_SIZE = 5;
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER = "phy";
	private static final String PASS = "1234";
	
	
	public void deleteReplyAll(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM reply ");
		sql.append("where board_no = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} 
	}
	public void deleteReply(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM reply where reply_no = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setInt(1,no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} 
	}
	
	public void Checkdelete(String str) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM buy_info where id = ?");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			pstmt.setString(1,str);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} 
	}
	 public void insertBuyInfo(buyVO buy) {
	      StringBuilder sql = new StringBuilder();
	      sql.append("insert into buy_info(buy_no, id, name, product_name, tel1, tel2, tel3, basic_addr, detail_addr, prot) ");
	      sql.append("values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");

	      try (
	         Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	      ) {
	         int loc = 1;
	         pstmt.setInt(loc++, buy.getBuy_no());
	         pstmt.setString(loc++, buy.getId());
	         pstmt.setString(loc++, buy.getName());
	         pstmt.setString(loc++, buy.getProduct_name());
	         pstmt.setString(loc++, buy.getTel1());
	         pstmt.setString(loc++, buy.getTel2());
	         pstmt.setString(loc++, buy.getTel3());
	         pstmt.setString(loc++, buy.getBasic_addr());
	         pstmt.setString(loc++, buy.getDetail_addr());
	         pstmt.setString(loc++, buy.getProt());

	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 
	   } 
  
  public List<buyVO> selectBuyInfoByName(String name) {
	   
	   List<buyVO> list = null;
	   /*List<fileVO> list = new LinkedList<>();*/
	   
	      StringBuilder sql = new StringBuilder();
	      list = new ArrayList<>();
	      
	      sql.append("select id, name, product_name, tel1, tel2, tel3, basic_addr, detail_addr, prot, ");
	      sql.append("to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	      sql.append("from buy_info where id = ? ");
	      
	      buyVO buy = null;
	      
	      try (
	         Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	      ) {
	         int loc=1;
	         
	         pstmt.setString(loc++, name);
	         
	         ResultSet rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	         
	         
	         buy = new buyVO();
	         buy.setId(rs.getString("id"));
	         buy.setName(rs.getString("name"));
	         buy.setProduct_name(rs.getString("product_name"));
	         buy.setTel1(rs.getString("tel1"));
	         buy.setTel2(rs.getString("tel2"));
	         buy.setTel3(rs.getString("tel3"));
	         buy.setBasic_addr(rs.getString("basic_addr"));
	         buy.setDetail_addr(rs.getString("detail_addr"));
	         buy.setProt(rs.getString("prot"));
	         buy.setReg_date(rs.getString("reg_date"));
	         list.add(buy);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return list;
	   }
	public void Reply(qnaVO qna) {
		try {
			int ref = 0;
			int indent = 0;
			int step = 0;
			int reply = 1;
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "SELECT REF, INDENT, STEP,reply FROM qna_board WHERE board_no=" + qna.getBoard_no();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				ref = rs.getInt(1);
				indent = rs.getInt(2);
				step = rs.getInt(3);
				reply = rs.getInt(4);
			}
			
			sql = "UPDATE qna_board SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
			stmt.executeUpdate(sql);
			
			sql = "INSERT INTO qna_board(writer,  TITLE, Content, reply, REF, INDENT, STEP) "+
					"values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int loc = 1;
			pstmt.setString(loc++, qna.getWriter());
			pstmt.setString(loc++, qna.getTitle());
			pstmt.setString(loc++, qna.getContent());
			pstmt.setInt(loc++, reply+1);
			pstmt.setInt(loc++, ref);
			pstmt.setInt(loc++, indent+1);
			pstmt.setInt(loc++, step+1);
			
			qna.setReply(reply);
			
			pstmt.execute(); 
			rs.close();
			stmt.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			
		}
		
	}

	public List<qnaVO> selectQNA(int pageNo) {
		int start = (pageNo - 1) * LIST_SIZE + 1;
		int end = pageNo * LIST_SIZE;

		List<qnaVO> qnaList = new ArrayList<qnaVO>();
		String sql = "select board_no, writer, title, content,reply, to_char(reg_date, 'yyyy-mm-dd') reg_date  "
				+ "  from ( select rownum rnum, b.*                 "
				+ "		   from ( select a.*                      "
				+ "		 		    from qna_board a                "
				+ "				   order by REF DESC, STEP ASC ) b )         "
				+ " where rnum >= ?                                 "
				+ "   and rnum <= ?                                 ";

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASS);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				qnaVO bVO = new qnaVO();
				bVO.setBoard_no(rs.getInt("board_no"));
				bVO.setWriter(rs.getString("writer"));
				bVO.setTitle(rs.getString("title"));
				bVO.setContent(rs.getString("content"));
				bVO.setReply(rs.getInt("reply"));
				bVO.setReg_date(rs.getString("reg_date"));
				qnaList.add(bVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return qnaList;
	}

	/**
	 * ��ü �Խñ� ī��Ʈ
	 * 
	 * @return
	 */
	
	public void UpdateqnaBoard(qnaVO qna) {
		StringBuilder sql = new StringBuilder();
		sql.append("update qna_board");
		sql.append(" set title = ?,content = ?");
		sql.append(" where board_no = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			int loc = 1;
			pstmt.setString(loc++, qna.getTitle());
			pstmt.setString(loc++, qna.getContent());
			pstmt.setInt(loc++, qna.getBoard_no());
			

			pstmt.executeUpdate();

		} catch (Exception e) {

		}
	}
	public int selectQNACount() {
		int totalCount = 0;
		ResultSet rs = null;
		String sql = "select count(*) cnt from qna_board";

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASS);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalCount = rs.getInt("cnt");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return totalCount;
	}

	public List<reviewVO> selectBoard(int pageNo) {
		int start = (pageNo - 1) * LIST_SIZE + 1;
		int end = pageNo * LIST_SIZE;

		List<reviewVO> boardList = new ArrayList<reviewVO>();
		String sql = "select board_no, writer, title, content, to_char(reg_date, 'yyyy-mm-dd') reg_date  "
				+ "  from ( select rownum rnum, b.*                 "
				+ "		   from ( select a.*                      " + "		 		    from board a                "
				+ "				   order by board_no desc ) b )         "
				+ " where rnum >= ?                                 "
				+ "   and rnum <= ?                                 ";

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASS);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				reviewVO bVO = new reviewVO();
				bVO.setBoard_no(rs.getInt("board_no"));
				bVO.setWriter(rs.getString("writer"));
				bVO.setTitle(rs.getString("title"));
				bVO.setContent(rs.getString("content"));
				bVO.setReg_date(rs.getString("reg_date"));
				boardList.add(bVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return boardList;
	}

	/**
	 * ��ü �Խñ� ī��Ʈ
	 * 
	 * @return
	 */
	public int selectBoardCount() {
		int totalCount = 0;
		ResultSet rs = null;
		String sql = "select count(*) cnt from board";

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASS);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalCount = rs.getInt("cnt");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return totalCount;
	}

	public int selectNo() {
		System.out.println("selectNO 실행 됨");

		String sql = "select board_seq.nextval from dual ";
		int no = 0;

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			no = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return no;
	}

	/*
	 * 새로운 리뷰 등록
	 * 
	 * @param : reviewVO
	 */
	public void UpdateBoard(reviewVO review) {
		StringBuilder sql = new StringBuilder();
		sql.append("update board");
		sql.append(" set title = ?,content = ?");
		sql.append(" where board_no = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			) {
			int loc = 1;
			pstmt.setString(loc++, review.getTitle());
			pstmt.setString(loc++, review.getContent());
			pstmt.setInt(loc++, review.getBoard_no());
			

			pstmt.executeUpdate();

		} catch (Exception e) {

		}
	}
	public void insertBoard(reviewVO review) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into board(board_no, title, writer, content) ");
		sql.append("values(?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setInt(loc++, review.getBoard_no());
			pstmt.setString(loc++, review.getTitle());
			pstmt.setString(loc++, review.getWriter());
			pstmt.setString(loc++, review.getContent());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/*
	 * 해당번호의 게시글 조회
	 * 
	 * @param : 특정 보드의 No
	 * 
	 * @return : 해당 번호의 게시 글
	 */
	public reviewVO selectBoardByNo(int no) {
		StringBuilder sql = new StringBuilder();

		sql.append("select board_no, title, writer, content, ");
		sql.append("to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("from board where board_no=? ");

		reviewVO review = null;

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;

			pstmt.setInt(loc++, no);

			ResultSet rs = pstmt.executeQuery();
			rs.next();

			review = new reviewVO();
			review.setBoard_no(rs.getInt("board_no"));
			review.setTitle(rs.getString("title"));
			review.setWriter(rs.getString("writer"));
			review.setContent(rs.getString("content"));
			review.setReg_date(rs.getString("reg_date"));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return review;
	}

	/*
	 * 모든 게시글 조회
	 * 
	 * @return : LinkedList<reviewVO> reviewList: 모든 게시 글
	 */
	public List<reviewVO> selectAllBoard() {
		StringBuilder sql = new StringBuilder();

		sql.append("select board_no, title, writer, content, ");
		sql.append("to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("from board ");
		sql.append("order by board_no desc ");

		List<reviewVO> reviewList = null;

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();

			reviewList = new LinkedList<>();

			while (rs.next()) {
				reviewVO review = new reviewVO();

				review.setBoard_no(rs.getInt("board_no"));
				review.setTitle(rs.getString("title"));
				review.setWriter(rs.getString("writer"));
				review.setContent(rs.getString("content"));
				review.setReg_date(rs.getString("reg_date"));

				reviewList.add(review);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reviewList;
	}

	public void deleteReviewByNo(int board_no) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from board ");
		sql.append("where board_no=? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, board_no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ===============================================================================

	/*
	 * 새로운 QnA 등록
	 * 
	 * @param : qnaVO
	 */
	public void insertQnABoard(qnaVO qna) {
		int max = 0;
		String sql = new String();
		
		try  {
			Connection conn = new ConnectionFactory().getConnection();
			Statement stmt = conn.createStatement();
			sql="SELECT MAX(board_no) FROM qna_board";
			ResultSet rs = stmt.executeQuery(sql); 
			if(rs.next()){ 
				max=rs.getInt(1); 
			}

			
			sql="insert into qna_board(board_no, title, writer, content, REF) " + " values(?, ?, ?, ?, ?) ";
			int loc = 1;
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(loc++, qna.getBoard_no());
			pstmt.setString(loc++, qna.getTitle());
			pstmt.setString(loc++, qna.getWriter());
			pstmt.setString(loc++, qna.getContent());
			pstmt.setInt(loc++, max+1);

			pstmt.execute();
			
			rs.close();
			stmt.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/*
	 * 해당번호의 QnA 조회
	 * 
	 * @param : 특정 QnA의 No
	 * 
	 * @return : 해당 번호의 QnA 글 정보
	 */
	public qnaVO selectQnABoardByNo(int board_no) {
		StringBuilder sql = new StringBuilder();

		sql.append("select title, writer, content, ");
		sql.append("to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("from qna_board where board_no=? ");

		qnaVO qna = null;

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;

			pstmt.setInt(loc++, board_no);

			ResultSet rs = pstmt.executeQuery();
			rs.next();

			qna = new qnaVO();
			qna.setBoard_no(board_no);
			qna.setTitle(rs.getString("title"));
			qna.setWriter(rs.getString("writer"));
			qna.setContent(rs.getString("content"));
			qna.setReg_date(rs.getString("reg_date"));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return qna;
	}

	/*
	 * 모든 QnA 조회
	 * 
	 * @return : LinkedList<qnaVO> qnaList: 모든 게시 글
	 */
	public List<qnaVO> selectAllQnABoard() {
		StringBuilder sql = new StringBuilder();

		sql.append("select board_no, title, writer, content, ");
		sql.append("to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("from qna_board ");
		sql.append("order by board_no desc ");

		List<qnaVO> qnaList = null;

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();

			qnaList = new LinkedList<>();

			while (rs.next()) {
				qnaVO qna = new qnaVO();

				qna.setBoard_no(rs.getInt("board_no"));
				qna.setTitle(rs.getString("title"));
				qna.setWriter(rs.getString("writer"));
				qna.setContent(rs.getString("content"));
				qna.setReg_date(rs.getString("reg_date"));

				qnaList.add(qna);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return qnaList;
	}

	public void deleteQnAByNo(int board_no) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from qna_board ");
		sql.append("where board_no=? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, board_no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ==============================================================================================

	// 첨부파일 관련
	public void insertFile(fileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into file_info(file_no, board_no, file_ori_name, file_save_name, file_size) ");
		sql.append("values(file_info_seq.nextval, ?, ?, ?, ?) ");

		System.out.println(fileVO.toString());

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setInt(loc++, fileVO.getBoard_no());
			pstmt.setString(loc++, fileVO.getFile_ori_name());
			pstmt.setString(loc++, fileVO.getFile_save_name());
			pstmt.setInt(loc++, fileVO.getFile_size());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<fileVO> selectFileByNo(int board_no) {

		List<fileVO> fileList = new LinkedList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select file_no, file_ori_name, ");
		sql.append("file_save_name, file_size ");
		sql.append("from file_info ");
		sql.append("where board_no=? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setInt(loc++, board_no);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				fileVO fileVO = new fileVO();

				fileVO.setBoard_no(board_no);
				fileVO.setNo(rs.getInt("file_no"));
				fileVO.setFile_ori_name(rs.getString("file_ori_name"));
				fileVO.setFile_save_name(rs.getString("file_save_name"));
				fileVO.setFile_size(rs.getInt("file_size"));

				fileList.add(fileVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(board_no + " file size : " + fileList.size());
		return fileList;
	}

	public void deleteFile(int boardNo) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from file_info ");
		sql.append("where board_no=? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<replyVO> selectReplyList(int board_no, int pageNo) {

		int start = (pageNo - 1) * LIST_SIZE + 1;
		int end = pageNo * LIST_SIZE;
		List<replyVO> replyList = new LinkedList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select * from (");
		sql.append("select row_number() over(order by reg_date asc) rNum, reply_no, board_no, ");
		sql.append("writer, content, reg_date ");
		sql.append("from reply ");
		sql.append("where board_no=? ");
		sql.append(") where rNum>=? and rNum<=?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setInt(loc++, board_no);
			pstmt.setInt(loc++, start);
			pstmt.setInt(loc++, end);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				replyVO replyVO = new replyVO();

				replyVO.setBoard_no(board_no);
				replyVO.setReply_no(rs.getInt("reply_no"));
				replyVO.setContent(rs.getString("content"));
				replyVO.setReg_date(rs.getString("reg_date"));
				replyVO.setWriter(rs.getString("writer"));

				replyList.add(replyVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return replyList;
	}

	public int selectReplyCount(int board_no) {
		int totalCount = 0;
		ResultSet rs = null;
		String sql = "select count(*) cnt from reply where board_no = ?";

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASS);
			pstmt = con.prepareStatement(sql);
			int loc = 1;
			pstmt.setInt(loc++, board_no);
			rs = pstmt.executeQuery();
			rs.next();
			totalCount = rs.getInt("cnt");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return totalCount;
	}

	/*
	 * 새로운 리뷰 등록
	 * 
	 * @param : reviewVO
	 */
	public void insertReply(replyVO reply) {
		int reply_no = 1;
		StringBuilder sql = new StringBuilder();
		sql.append("insert into reply(reply_no, board_no, writer, content, reg_date) ");
		sql.append("select reply_seq.nextval, ?, ?, ?, sysdate from dual ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setInt(loc++, reply.getBoard_no());
			if ("".equals(reply.getWriter()))
				pstmt.setString(loc++, "anony");
			else
				pstmt.setString(loc++, reply.getWriter());
			pstmt.setString(loc++, reply.getContent());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}