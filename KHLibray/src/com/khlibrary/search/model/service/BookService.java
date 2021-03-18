package com.khlibrary.search.model.service;

import java.sql.Connection;
import java.util.List;

import com.khlibrary.search.model.dao.BookDao;
import com.khlibrary.search.model.vo.Book;
import com.khlibrary.search.model.vo.PageInfo;

import static com.khlibrary.common.JDBCTemplate.*;

public class BookService {
	
	// 전체 목록 카운트
	public int getBookListCount() {
		Connection conn = getConnection();
		
		int result = new BookDao().getBookListCount(conn);
		
		close(conn);
		
		return result;
	}
	

	// 전체 목록 결과
	public List<Book> selectBookList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().selectBookList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	
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
	
	// 상세 검색 리스트 카운트
	public int getSearchListCount(Book bk, String isbn, int tDate, int fDate) {
		Connection conn = getConnection();
		
		int result = new BookDao().getSearchListCount(conn, isbn, bk, tDate, fDate);
		
		close(conn);
		
		return result;
	}

	// 상세 검색 리스트

	public List<Book> selectSearchList(PageInfo pi, String isbn, Book bk, int tDate, int fDate) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().selectSearchList(conn,  pi, isbn, bk, tDate, fDate);
		
		close(conn);
		
		return list;
		
	}

	// 도서 등록 
	
	public int insertBook(Book book) {
		
		Connection conn = getConnection();
		int result = new BookDao().insertBook(conn, book);
		
		if(result> 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	
	}


}
