package kr.co.bit.vo;

/*
 * 제품 후기 VO
 * */

public class reviewVO {
	
	private int board_no;
	private String title;
	private String writer;
	private String content;
	private String reg_date;
	
	public reviewVO() {
		super();
	}
	
	public reviewVO(int board_no, String title, String writer, String content, String reg_date) {
		super();
		this.board_no = board_no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.reg_date = reg_date;
	}

	public int getBoard_no() {
		return board_no;
	}
	
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	@Override
	public String toString() {
		return "reviewVO [board_no=" + board_no + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", reg_date=" + reg_date + "]";
	}

	
}
