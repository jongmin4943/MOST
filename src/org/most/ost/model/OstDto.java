package org.most.ost.model;

public class OstDto {
	private String no;
	private String ostName;
	private String artist;
	private String likes;
	
	public OstDto() {
		this("","","","");
	}
	public OstDto(String no, String ostName, String artist, String likes) {
		this.no = no;
		this.ostName = ostName;
		this.artist = artist;
		this.likes = likes;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getOstName() {
		return ostName;
	}
	public void setOstName(String ostName) {
		this.ostName = ostName;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getLikes() {
		return likes;
	}
	public void setLikes(String likes) {
		this.likes = likes;
	}
	@Override
	public String toString() {
		return "OstDto [no=" + no + ", ostName=" + ostName + ", artist=" + artist + ", likes=" + likes + "]";
	}
}
