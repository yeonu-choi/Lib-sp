package com.khlibrary.admin.model.vo;

import java.sql.Date;

public class ReturnBook {
	private int lid;
	private String user_id;
	private String bk_name;
	private Date loan_date;
	private String status;
	
	public ReturnBook() {}

	public ReturnBook(int lid, String user_id, String bk_name, Date loan_date, String status) {
		super();
		this.lid = lid;
		this.user_id = user_id;
		this.bk_name = bk_name;
		this.loan_date = loan_date;
		this.status = status;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBk_name() {
		return bk_name;
	}

	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}

	public Date getLoan_date() {
		return loan_date;
	}

	public void setLoan_date(Date loan_date) {
		this.loan_date = loan_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "returnBook [lid=" + lid + ", user_id=" + user_id + ", bk_name=" + bk_name + ", loan_date=" + loan_date
				+ ", status=" + status + "]";
	}
	
	
}
