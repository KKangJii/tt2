package kr.co.bit.vo;
/*
 * QnA VO
 * */
public class qnaVO {
	private int board_no;
	private String writer;
	private String title;
	private String content;
	private int reply;
	private String reg_date;
	
	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public qnaVO() {
		super();
	}

	public qnaVO(int board_no, String writer, String title, String content, String reg_date) {
		super();
		this.board_no = board_no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		return "qnaVO [board_no=" + board_no + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", reg_date=" + reg_date + "]";
	}

	
}
