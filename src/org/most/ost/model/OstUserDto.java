package org.most.ost.model;

public class OstUserDto extends OstDto {
	String userID;
	String ostNum;
	String likedDate;
	public OstUserDto(String no, String ostName, String movieTitle, String artist, String imgSrc, String userID, String ostNum, String likedDate) {
		super(no, ostName, movieTitle, artist, "");
		this.userID = userID;
		this.ostNum = ostNum;
		this.likedDate = likedDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getOstNum() {
		return ostNum;
	}
	public void setOstNum(String ostNum) {
		this.ostNum = ostNum;
	}
	public String getLikedDate() {
		return likedDate;
	}
	public void setLikedDate(String likedDate) {
		this.likedDate = likedDate;
	}
	@Override
	public String toString() {
		return "OstUserDto [userID=" + userID + ", ostNum=" + ostNum + ", likedDate=" + likedDate + "]";
	}
}
