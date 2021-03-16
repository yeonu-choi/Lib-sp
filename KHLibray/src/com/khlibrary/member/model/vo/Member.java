package com.khlibrary.member.model.vo;

import java.sql.Date;

public class Member {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String birth_date;
	private String phone;
	private String email;
	private String address;
	private String grade;
	private Date enroll_date;
	private int user_no;
	private int overdue;
	
	public Member() {}

	public Member(String user_id, String user_name, String birth_date, String grade, Date enroll_date, int overdue) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.birth_date = birth_date;
		this.grade = grade;
		this.enroll_date = enroll_date;
		this.overdue = overdue;
	}

	public Member(String user_id, String user_pwd, String user_name, String birth_date, String phone, String email,
			String address, String grade, Date enroll_date, int user_no, int overdue) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.birth_date = birth_date;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.grade = grade;
		this.enroll_date = enroll_date;
		this.user_no = user_no;
		this.overdue = overdue;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getOverdue() {
		return overdue;
	}

	public void setOverdue(int overdue) {
		this.overdue = overdue;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", birth_date="
				+ birth_date + ", phone=" + phone + ", email=" + email + ", address=" + address + ", grade=" + grade
				+ ", enroll_date=" + enroll_date + ", user_no=" + user_no + ", overdue=" + overdue + "]";
	}
	
	
}
