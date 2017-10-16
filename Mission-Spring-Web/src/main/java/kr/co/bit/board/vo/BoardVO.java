package kr.co.bit.board.vo;

import org.hibernate.validator.constraints.NotEmpty;

public class BoardVO {

	private int no;
	//@Pattern(regexp="")  정규식패턴 공부하기! 알아둬야한대 많이쓰여서
	
//	밑처럼 하나에 여러갤 쓸수있다 !!
//	@Length(min=2, max=10 ,message="ssss")       // 최소2글자 이상 최대 10글자까지
	@NotEmpty(message="필수항목입니다")                 //절대 빌수 없다란 의미   massage는 비게 해놓고 등록을 누를 시 옆에 필수항목이라고 뜨게 해줌!!
	private String title;
	
	@NotEmpty(message="필수항목입니다")
	private String writer;
	
	@NotEmpty(message="필수항목입니다")
	private String content;
	private int viewCnt;
	private String regDate;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + "]";
	}
	

	
	
}
	