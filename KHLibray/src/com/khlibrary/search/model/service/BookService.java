package com.khlibrary.search.model.service;

import java.sql.Connection;
import java.util.List;

import com.khlibrary.search.model.dao.BookDao;
import com.khlibrary.search.model.vo.Book;
import com.khlibrary.search.model.vo.PageInfo;

import static com.khlibrary.common.JDBCTemplate.*;

public class BookService {
	
	// 검색 리스트 카운트
	public int getSearchListCount(String searchSelect, String search) {
		Connection conn = getConnection();
		
		int result = new BookDao().getSearchListCount(conn, searchSelect, search);
		
		close(conn);
		
		return result;
	}
	
	// 검색 결과 리스트 
	public List<Book> selectSearchList(PageInfo pi, String searchSelect, String search) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().selectSearchList(conn, pi, searchSelect, search);
		
		close(conn);
		
		return list;
	}
	
	
	// 대출
	public int loanBook(String[] chk, String userId) {
		Connection conn = getConnection();
		
		BookDao bDao = new BookDao();
		
		int result1 = bDao.insertLoanInfo(conn, userId);	// 대출 정보 입력(Loan 테이블 - 대출일, 반납일)
		int result2 = bDao.insertLoanCallNum(conn, chk);	// 대출 상세 정보 입력(Ldetail테이블 - call_num)
		int result3 = bDao.updateLoanCallNum(conn, chk);	// Bdetail테이블  status update
		
		int result = 0;
		
		if(result1 > 0 && result2 == chk.length && result3 == chk.length) {
			result = 1;
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	
	

}
