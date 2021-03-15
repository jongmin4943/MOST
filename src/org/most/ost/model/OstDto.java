package org.most.ost.model;

public class OstDto {
	private String no;
	private String ostName;
	private String movieTitle;
	private String artist;
	
	public OstDto() {}
	public OstDto(String no, String ostName, String movieTitle, String artist) {
		this.no = no;
		this.ostName = ostName;
		this.movieTitle = movieTitle;
		this.artist = artist;
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
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	@Override
	public String toString() {
		return "OstDto [no=" + no + ", ostName=" + ostName + ", movieTitle=" + movieTitle + ", artist=" + artist + "]";
	}
	
}
