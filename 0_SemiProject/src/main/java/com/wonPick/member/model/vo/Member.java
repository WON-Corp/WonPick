package com.wonPick.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String userId;
	private String password;
	private String userName;
	private String nickName;
	private String email;
	private String phone;
	private String gender;
	private Date birth;
	private String introduce;
	private String pImg;
	
	public Member() {
		super();
	}
	
	public Member(String userId, String password, String userName, String nickName, String email, String phone,
			String gender, Date birth) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birth = birth;
	}
	
	public Member(String userId, String password, String userName, String nickName, String email, String phone,
			String gender, Date birth, String introduce, String pImg) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birth = birth;
		this.introduce = introduce;
		this.pImg = pImg;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", userName=" + userName + ", nickName=" + nickName
				+ ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", birth=" + birth + ", introduce="
				+ introduce + ", pImg=" + pImg + "]";
	}

}

