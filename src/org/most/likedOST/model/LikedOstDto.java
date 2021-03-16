package org.most.likedOST.model;

public class LikedOstDto {
	private String userID;
	private String ostNum;
	public LikedOstDto() {
		this("","");
	}
	public LikedOstDto(String userID, String ostNum) {
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
	@Override
	public String toString() {
		return "LikedOstDto [userID=" + userID + ", ostNum=" + ostNum + "]";
	}
	
}
