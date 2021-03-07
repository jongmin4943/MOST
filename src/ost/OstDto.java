package ost;

public class OstDto {
	private String no;
	private String ostName;
	private String artist;
	public OstDto() {
		this("","","");
	}
	public OstDto(String no, String ostName, String artist) {
		this.no = no;
		this.ostName = ostName;
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
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	@Override
	public String toString() {
		return "OstDto [no=" + no + ", ostName=" + ostName + ", artist=" + artist + "]";
	}
}
