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
	
	// 작가순
	public List<Book> searchWriterSortList(PageInfo pi, String searchSelect, String search) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().searchWriterSortList(conn,  pi, searchSelect, search);
		
		close(conn);
		
		return list;
	}
	
	// 최신순
	public List<Book> searchLatestSortList(PageInfo pi, String searchSelect, String search) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().searchLatestSortList(conn,  pi, searchSelect, search);
		
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
	public int getSearchListCount(Book bk, String isbn, String tDate, String fDate) {
		Connection conn = getConnection();
		
		int result = new BookDao().getSearchListCount(conn, isbn, bk, tDate, fDate);
		
		close(conn);
		
		return result;
	}

	// 상세 검색 리스트
	public List<Book> selectSearchList(PageInfo pi, String isbn, Book bk, String tDate, String fDate) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().selectSearchList(conn,  pi, isbn, bk, tDate, fDate);
		
		close(conn);
		
		return list;
		
	}

	// 작가순
	public List<Book> searchWriterSortList(PageInfo pi, String isbn, Book bk, String tDate, String fDate) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().searchWriterSortList(conn,  pi, isbn, bk, tDate, fDate);
		
		close(conn);
		
		return list;
		
	}

	// 최신순
	public List<Book> searchLatestSortList(PageInfo pi, String isbn, Book bk, String tDate, String fDate) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().searchLatestSortList(conn,  pi, isbn, bk, tDate, fDate);
		
		close(conn);
		
		return list;
	}
	
	// 자동 완성
	public List<String> autoBookNameSearch(String val) {
		Connection conn = getConnection();
		
		List<String> list = new BookDao().autoBookNameSearch(conn,  val);
		
		close(conn);
		
		return list;
	}
	
	// 재검색 리스트 카운트
	public int getReSearchListCount(String preSearchSelect, String preSearch, String searchSelect, String search) {
		Connection conn = getConnection();
		
		int result = new BookDao().getReSearchListCount(conn, preSearchSelect, preSearch, searchSelect, search);
		
		close(conn);
		
		return result;
	}

	// 재검색 리스트 목록
	public List<Book> selectReSearchList(PageInfo pi, String preSearchSelect, String preSearch, String searchSelect,
			String search) {
		Connection conn = getConnection();
		
		List<Book> list = new BookDao().selectReSearchList(conn, pi, preSearchSelect, preSearch, searchSelect, search);
		
		close(conn);
		
		return list;
	}

	
	
	
	
	
	// 도서 등록 
	
	public int insertBook(Book book) {		
		Connection conn = getConnection();
		
		BookDao bDao = new BookDao();
		
		int result1 = bDao.insertBook(conn, book);
		int result2 = bDao.insertBdetail(conn, book);
		
		int result = 0;
		
		if(result1 > 0 && result2 > 0) {
			result = 1;
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	
	}



	
	
	

}
