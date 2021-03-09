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
	public UserDto(String userID, String userPassword, String useName, String useEmail, String joinedDate) {
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = useName;
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
	public String getUseName() {
		return userName;
	}
	public void setUseName(String useName) {
		this.userName = useName;
	}
	public String getUseEmail() {
		return userEmail;
	}
	public void setUseEmail(String useEmail) {
		this.userEmail = useEmail;
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
