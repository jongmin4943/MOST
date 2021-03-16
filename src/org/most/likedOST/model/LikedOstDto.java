package org.most.likedOST.model;

public class LikedOstDto {
	private String userID;
	private String ostNum;
	private String likedDate;
	public LikedOstDto() {
		this("","","");
	}
	public LikedOstDto(String userID, String ostNum, String likedDate) {
		this.userID = userID;
		this.ostNum = ostNum;
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
		return "LikedOstDto [userID=" + userID + ", ostNum=" + ostNum + ", likedDate=" + likedDate + "]";
	}
	
}
