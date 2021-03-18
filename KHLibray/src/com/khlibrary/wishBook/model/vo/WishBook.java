package com.khlibrary.wishBook.model.vo;

import java.sql.Date;

public class WishBook {
	private int wbId;
	private String wbName;
	private String wbWriter;
	private String wbPublisher;
	private int issueYear;
	private Date requestDate;
	private String status;
	private String userId;
	private String phone;
	private String email;
	
	public WishBook() {}

	
	
	public WishBook(String wbName, String wbWriter, String wbPublisher, int issueYear, String userId, String phone,
			String email) {
		super();
		this.wbName = wbName;
		this.wbWriter = wbWriter;
		this.wbPublisher = wbPublisher;
		this.issueYear = issueYear;
		this.userId = userId;
		this.phone = phone;
		this.email = email;
	}



	public WishBook(int wbId, String wbName, String wbWriter, String wbPublisher, int issueYear, Date requestDate,
			String status, String userId, String phone, String email) {
		super();
		this.wbId = wbId;
		this.wbName = wbName;
		this.wbWriter = wbWriter;
		this.wbPublisher = wbPublisher;
		this.issueYear = issueYear;
		this.requestDate = requestDate;
		this.status = status;
		this.userId = userId;
		this.phone = phone;
		this.email = email;
	}

	public int getWbId() {
		return wbId;
	}

	public void setWbId(int wbId) {
		this.wbId = wbId;
	}

	public String getWbName() {
		return wbName;
	}

	public void setWbName(String wbName) {
		this.wbName = wbName;
	}

	public String getWbWriter() {
		return wbWriter;
	}

	public void setWbWriter(String wbWriter) {
		this.wbWriter = wbWriter;
	}

	public String getWbPublisher() {
		return wbPublisher;
	}

	public void setWbPublisher(String wbPublisher) {
		this.wbPublisher = wbPublisher;
	}

	public int getIssueYear() {
		return issueYear;
	}

	public void setIssueYear(int issueYear) {
		this.issueYear = issueYear;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	@Override
	public String toString() {
		return "WishBook [wbId=" + wbId + ", wbName=" + wbName + ", wbWriter=" + wbWriter + ", wbPublisher="
				+ wbPublisher + ", issueYear=" + issueYear + ", requestDate=" + requestDate + ", status=" + status
				+ ", userId=" + userId + ", phone=" + phone + ", email=" + email + "]";
	}

	
	
}
