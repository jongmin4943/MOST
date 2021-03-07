package user;

public class UserDto {
	private String userID;
	private String userPassword;
	private String useName;
	private String useEmail;
	private String joinedDate;
	
	public UserDto() {
		this("","","","","");
	}
	public UserDto(String userID, String userPassword, String useName, String useEmail, String joinedDate) {
		this.userID = userID;
		this.userPassword = userPassword;
		this.useName = useName;
		this.useEmail = useEmail;
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
		return useName;
	}
	public void setUseName(String useName) {
		this.useName = useName;
	}
	public String getUseEmail() {
		return useEmail;
	}
	public void setUseEmail(String useEmail) {
		this.useEmail = useEmail;
	}
	
	public String getJoinedDate() {
		return joinedDate;
	}
	public void setJoinedDate(String joinedDate) {
		this.joinedDate = joinedDate;
	}
	@Override
	public String toString() {
		return "UserDto [userID=" + userID + ", userPassword=" + userPassword + ", useName=" + useName + ", useEmail="
				+ useEmail + ", joinedDate=" + joinedDate + "]";
	}
}
