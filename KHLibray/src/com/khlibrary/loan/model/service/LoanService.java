package com.khlibrary.loan.model.service;

import static com.khlibrary.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.khlibrary.common.model.vo.PageInfo;
import com.khlibrary.loan.model.dao.LoanDao;
import com.khlibrary.loan.model.vo.Loan;

public class LoanService {
	public int getMyListCount(String user_id) {
		Connection conn = getConnection();
		
		int listCount = new LoanDao().getListCount(conn, user_id);
		
		close(conn);
		
		return listCount;
	}
	
	public List<Loan> selectMyList(PageInfo pi, String user_id) {
		Connection conn = getConnection();
		
		List<Loan> list = new LoanDao().selectMyList(conn, pi, user_id);
		
		close(conn);
		
		return list;
		
	}

	public List<Loan> selectMySortList(PageInfo pi, String user_id, String viewCondition, String rank) {
		Connection conn = getConnection();
		
		List<Loan> list = new LoanDao().selectMySortList(conn, pi, user_id, viewCondition, rank);
		
		close(conn);
		
		return list;
	}

	public int returnRequest(String lid) {
		Connection conn = getConnection();
		
		int result = new LoanDao().returnRequest(conn, lid);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int onLoanCount(String user_id) {
		Connection conn = getConnection();
		
		int lcount = new LoanDao().onLoanCount(conn, user_id);
		
		close(conn);
		
		return lcount;
	}

}
