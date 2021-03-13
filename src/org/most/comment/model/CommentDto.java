package org.most.comment.model;

public class CommentDto {
	private String no;
	private String writer;
	private String ostNum;
	private String content;
	private String date;
	
	public String getOstNum() {
		return ostNum;
	}
	public void setOstNum(String ostNum) {
		this.ostNum = ostNum;
	}
	public CommentDto() {
		this("","","","","");
	}
	public CommentDto(String no) {
		this(no,"","","","");
	}
	public CommentDto(String no, String writer, String ostNumber, String content, String date) {
		this.no = no;
		this.writer = writer;
		this.ostNum = ostNumber;
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
		return "CommentDto [no=" + no + ", writer=" + writer + ", ostNumber=" + ostNum + ", content=" + content
				+ ", date=" + date + "]";
	}
}
