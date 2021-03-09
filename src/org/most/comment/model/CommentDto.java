package org.most.comment.model;

public class CommentDto {
	private String no;
	private String writer;
	private String ostNumber;
	private String content;
	private String date;
	
	public CommentDto() {
		this("","","","","");
	}
	public CommentDto(String no, String writer, String ostNumber, String content, String date) {
		super();
		this.no = no;
		this.writer = writer;
		this.ostNumber = ostNumber;
		this.content = content;
		this.date = date;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getOstNumber() {
		return ostNumber;
	}
	public void setOstNumber(String ostNumber) {
		this.ostNumber = ostNumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "CommentDto [no=" + no + ", writer=" + writer + ", ostNumber=" + ostNumber + ", content=" + content
				+ ", date=" + date + "]";
	}
}
