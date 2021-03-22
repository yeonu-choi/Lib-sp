package com.khlibrary.search.model.vo;

import java.sql.Date;

public class Book {
	private long isbn;							// 도서 ISBN
	private String bName;						// 도서명
	private String bWriter;						// 도서 작가
	private String bPublisher;					// 도서 출판사
	private int issueDate;						// 도서 발행년도
	private Date registDate;					// 도서 등록일
	private String imgName;						// 이미지 명
	private String imgPath;						// 이미지 경로
	private String callNum;						// 청구기호
	private String status;						// 도서 상태 (대출 가능, 대출 불가능)
	
	public Book() {}
	
	

	public Book(String bName) {
		super();
		this.bName = bName;
	}


	public Book(String bName, String bWriter, String bPublisher) {
		super();
		this.bName = bName;
		this.bWriter = bWriter;
		this.bPublisher = bPublisher;
	}

	public Book(String bName, String bWriter, String imgName, String imgPath) {
		super();
		this.bName = bName;
		this.bWriter = bWriter;
		this.imgName = imgName;
		this.imgPath = imgPath;
	}

	public Book(long isbn, String bName, Date registDate, String imgName, String imgPath) {
		super();
		this.isbn = isbn;
		this.bName = bName;
		this.registDate = registDate;
		this.imgName = imgName;
		this.imgPath = imgPath;
	}



	public Book(long isbn, String bName, String bWriter, String bPublisher) {
		super();
		this.isbn = isbn;
		this.bName = bName;
		this.bWriter = bWriter;
		this.bPublisher = bPublisher;
	}



	public Book(long isbn, String bName, String bWriter, String bPublisher, int issueDate, Date registDate,
			String imgName, String imgPath, String callNum, String status) {
		super();
		this.isbn = isbn;
		this.bName = bName;
		this.bWriter = bWriter;
		this.bPublisher = bPublisher;
		this.issueDate = issueDate;
		this.registDate = registDate;
		this.imgName = imgName;
		this.imgPath = imgPath;
		this.callNum = callNum;
		this.status = status;
	}

	public long getIsbn() {
		return isbn;
	}

	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbPublisher() {
		return bPublisher;
	}

	public void setbPublisher(String bPublisher) {
		this.bPublisher = bPublisher;
	}

	public int getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(int issueDate) {
		this.issueDate = issueDate;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getCallNum() {
		return callNum;
	}

	public void setCallNum(String callNum) {
		this.callNum = callNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", bName=" + bName + ", bWriter=" + bWriter + ", bPublisher=" + bPublisher
				+ ", issueDate=" + issueDate + ", registDate=" + registDate + ", imgName=" + imgName + ", imgPath="
				+ imgPath + ", callNum=" + callNum + ", status=" + status + "]";
	}
	
	
	
}
