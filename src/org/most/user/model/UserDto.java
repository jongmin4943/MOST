package org.most.user.model;

public class UserDto {
	private String userID;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String joinedDate;
	
	public UserDto() {
		this("","","","","");
	}
	public UserDto(String userID) {
		this(userID,"","","","");
	}
	public UserDto(String userID, String userPassword, String userName, String useEmail, String joinedDate) {
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = useEmail;
		this.joinedDate = joinedDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getJoinedDate() {
		return joinedDate;
	}
	public void setJoinedDate(String joinedDate) {
		this.joinedDate = joinedDate;
	}
	@Override
	public String toString() {
		return "UserDto [userID=" + userID + ", userPassword=" + userPassword + ", useName=" + userName + ", useEmail="
				+ userEmail + ", joinedDate=" + joinedDate + "]";
	}
}
