package org.most.notice.model;

public class NoticeDto {
	String no;
	String title;
	String content;
	String date;
	String hit;
	public NoticeDto() {
	}
	public NoticeDto(String no, String title, String content, String date, String hit) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "NoticeDto [no=" + no + ", title=" + title + ", content=" + content + ", date=" + date + ", hit=" + hit
				+ "]";
	}
}
