package kr.co.bit.vo;

/*
 * 댓글 VO
 * */

public class replyVO {
	private int reply_no;
	private int board_no;
	private String writer;
	private String content;
	private String reg_date;
	public replyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public replyVO(int reply_no, int board_no, String writer, String content, String reg_date) {
		super();
		this.reply_no = reply_no;
		this.board_no = board_no;
		this.writer = writer;
		this.content = content;
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "replyVO [reply_no=" + reply_no + ", board_no=" + board_no + ", writer=" + writer + ", content="
				+ content + ", reg_date=" + reg_date + "]";
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
