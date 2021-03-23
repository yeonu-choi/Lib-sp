package com.khlibrary.board.model.vo;

public class FAQ {
	private int fNo;
	private String f_Qcontent;
	private String f_Acontent;
	private String category;
	private String status;
	
	public FAQ() {}
	
	

	public FAQ(String f_Qcontent) {
		super();
		this.f_Qcontent = f_Qcontent;
	}



	public FAQ(int fNo, String f_Qcontent, String f_Acontent, String category, String status) {
		super();
		this.fNo = fNo;
		this.f_Qcontent = f_Qcontent;
		this.f_Acontent = f_Acontent;
		this.category = category;
		this.status = status;
	}
	

	public FAQ(String f_Qcontent, String f_Acontent, String category) {
		super();
		this.f_Qcontent = f_Qcontent;
		this.f_Acontent = f_Acontent;
		this.category = category;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getF_Qcontent() {
		return f_Qcontent;
	}

	public void setF_Qcontent(String f_Qcontent) {
		this.f_Qcontent = f_Qcontent;
	}

	public String getF_Acontent() {
		return f_Acontent;
	}

	public void setF_Acontent(String f_Acontent) {
		this.f_Acontent = f_Acontent;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "FAQ [fNo=" + fNo + ", f_Qcontent=" + f_Qcontent + ", f_Acontent=" + f_Acontent + ", category="
				+ category + ", status=" + status + "]";
	}
	
	
	
	
	
	
}
