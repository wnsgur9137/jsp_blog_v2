package jspProject_final.domain.user;

import java.sql.Timestamp;

public class User {
	private String userName;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userCreated;
	
	public User() {}
	
	public User(String userName, String userId, String userPassword, String userEmail, String userCreated) {
		this.userName = userName;
		this.userId = userId;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userCreated = userCreated;
	}
	
	//게터 세터
	public String getUserName() { return userName; }
	public void setUserName(String userName) { this.userName = userName; }
	
	public String getUserId() { return userId; }
	public void setUserId(String userId) { this.userId = userId; }
	
	public String getUserPassword() { return userPassword; }
	public void setUserPassword(String userPassword) { this.userPassword = userPassword; }
	
	public String getUserEmail() { return userEmail; }
	public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
	
	public String getUserCreated() { return userCreated; }
	public void setUserCreated(String userCreated) { this.userCreated = userCreated; }
}
