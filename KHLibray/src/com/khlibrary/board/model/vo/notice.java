package com.khlibrary.board.model.vo;

import oracle.sql.DATE;

public class notice {
	
	private int nNo;
	private String nTitle;
	private String nContent;
	private int nCount;
	private DATE c_Date;
	private String status;
	
	public notice() {}

	public notice(int nNo, String nTitle, String nContent, int nCount, DATE c_Date, String status) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.c_Date = c_Date;
		this.status = status;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public DATE getC_Date() {
		return c_Date;
	}

	public void setC_Date(DATE c_Date) {
		this.c_Date = c_Date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nCount=" + nCount
				+ ", c_Date=" + c_Date + ", status=" + status + "]";
	}
	
	
	
}
