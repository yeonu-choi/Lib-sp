package com.khlibrary.admin.model.service;

import static com.khlibrary.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.khlibrary.admin.model.dao.ReturnBookDao;
import com.khlibrary.admin.model.vo.ReturnBook;
import com.khlibrary.common.model.vo.PageInfo;

public class ReturnBookService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new ReturnBookDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}

	public List<ReturnBook> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<ReturnBook> list = new ReturnBookDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public List<ReturnBook> selectSortList(PageInfo pi, String viewCondition, String rank) {
		Connection conn = getConnection();
		
		List<ReturnBook> list = new ReturnBookDao().selectSortList(conn, pi, viewCondition, rank);
		
		close(conn);
		
		return list;
	}

	public int returnBook(String lid) {
		Connection conn = getConnection();
		int result = 0;
		
		int result1 = new ReturnBookDao().changeBstatus(conn,lid);
		int result2 = new ReturnBookDao().changeLstatus(conn,lid);
		int result3 = new ReturnBookDao().increaseOverdue(conn,lid);
		
		if(result1 + result2 + result3 > 2) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
			result = 0;
		}
		
		return result;
	}

}
