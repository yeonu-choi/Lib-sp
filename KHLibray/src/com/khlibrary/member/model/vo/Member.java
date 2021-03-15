package com.khlibrary.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String birth_date;
	private String phone;
	private String email;
	private String address;
	private Date enroll_date;
	private Date modify_date;
	private String status;
	
	public Member() {
		super();
	}
	
	public Member(String user_id, String user_name, String birth_date, String phone, String email, String address) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.birth_date = birth_date;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	public Member(int userNo, String user_id, String user_pwd, String user_name, String birth_date, String phone,
			String email, String address, Date enroll_date, Date modify_date, String status) {
		super();
		this.userNo = userNo;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.birth_date = birth_date;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enroll_date = enroll_date;
		this.modify_date = modify_date;
		this.status = status;
	}

	public Member(String user_id, String user_pwd, String user_name, String birth_date, String phone, String email,
			String address) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.birth_date = birth_date;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	
	
	public Member(String user_id, String user_pwd) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", birth_date=" + birth_date + ", phone=" + phone + ", email=" + email + ", address="
				+ address + ", enroll_date=" + enroll_date + ", modify_date=" + modify_date + ", status=" + status
				+ "]";
	}

	
}