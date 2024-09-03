package com.wonPick.model;

public class Member {
	
	private String userId;
	private String email;
	private String userPw;
	private String phone;
	private String gender;
	private String birth;
	private String userName;
	private String nickName;
	
	public Member() {
		super();
	}
	
	public Member(String userId, String userPw, String email, String phone, String gender, String birth, String userName,
			String nickName) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birth = birth;
		this.userName = userName;
		this.nickName = nickName;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPw=" + userPw + ", email=" + email + ", phone=" + phone + ", gender="
				+ gender + ", birth=" + birth + ", userName=" + userName + ", nickName=" + nickName + "]";
	}
	
	
	
	
	
}
