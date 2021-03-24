package com.khlibrary.board.model.vo;

import java.util.Date;

public class QNA {
	private int qna_No;
	private String qna_Qtitle;
	private String qna_Qcontent;
	private String qna_Acontent;
	private int q_Count;
	private Date c_Date;
	private Date m_Date;
	private String status;
	private String secret;
	private String user_Id;
	
	public QNA() {}

	public QNA(int qna_No, String qna_Qtitle, String qna_Qcontent, String qna_Acontent, int q_Count, Date c_Date,
			Date m_Date, String status, String secret, String user_Id) {
		super();
		this.qna_No = qna_No;
		this.qna_Qtitle = qna_Qtitle;
		this.qna_Qcontent = qna_Qcontent;
		this.qna_Acontent = qna_Acontent;
		this.q_Count = q_Count;
		this.c_Date = c_Date;
		this.m_Date = m_Date;
		this.status = status;
		this.secret = secret;
		this.user_Id = user_Id;
	}
	
	


	public QNA(String qna_Qtitle, String qna_Qcontent, String secret, String user_Id) {
		super();
		this.qna_Qtitle = qna_Qtitle;
		this.qna_Qcontent = qna_Qcontent;
		this.secret = secret;
		this.user_Id = user_Id;
	}

	public int getQna_No() {
		return qna_No;
	}

	public void setQna_No(int qna_No) {
		this.qna_No = qna_No;
	}

	public String getQna_Qtitle() {
		return qna_Qtitle;
	}

	public void setQna_Qtitle(String qna_Qtitle) {
		this.qna_Qtitle = qna_Qtitle;
	}

	public String getQna_Qcontent() {
		return qna_Qcontent;
	}

	public void setQna_Qcontent(String qna_Qcontent) {
		this.qna_Qcontent = qna_Qcontent;
	}

	public String getQna_Acontent() {
		return qna_Acontent;
	}

	public void setQna_Acontent(String qna_Acontent) {
		this.qna_Acontent = qna_Acontent;
	}

	public int getQ_Count() {
		return q_Count;
	}

	public void setQ_Count(int q_Count) {
		this.q_Count = q_Count;
	}

	public Date getC_Date() {
		return c_Date;
	}

	public void setC_Date(Date c_Date) {
		this.c_Date = c_Date;
	}

	public Date getM_Date() {
		return m_Date;
	}

	public void setM_Date(Date m_Date) {
		this.m_Date = m_Date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "QNA [qna_No=" + qna_No + ", qna_Qtitle=" + qna_Qtitle + ", qna_Qcontent=" + qna_Qcontent
				+ ", qna_Acontent=" + qna_Acontent + ", q_Count=" + q_Count + ", c_Date=" + c_Date + ", m_Date="
				+ m_Date + ", status=" + status + ", secret=" + secret + ", user_Id=" + user_Id + "]";
	}
	
	
	

}
