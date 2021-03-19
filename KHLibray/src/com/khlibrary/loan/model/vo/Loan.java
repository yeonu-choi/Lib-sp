package com.khlibrary.loan.model.vo;

import java.sql.Date;

public class Loan {
	private int lid;
	private String bk_name;
	private String writer;
	private String publisher;
	private Date loan_date;
	private Date return_date;
	private String status;
	
	public Loan() {}

	public Loan(int lid, String bk_name, String writer, String publisher, Date loan_date, Date return_date,
			String status) {
		super();
		this.lid = lid;
		this.bk_name = bk_name;
		this.writer = writer;
		this.publisher = publisher;
		this.loan_date = loan_date;
		this.return_date = return_date;
		this.status = status;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getBk_name() {
		return bk_name;
	}

	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Date getLoan_date() {
		return loan_date;
	}

	public void setLoan_date(Date loan_date) {
		this.loan_date = loan_date;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Loan [lid=" + lid + ", bk_name=" + bk_name + ", writer=" + writer + ", publisher=" + publisher
				+ ", loan_date=" + loan_date + ", return_date=" + return_date + ", status=" + status + "]";
	}
	
	
}
