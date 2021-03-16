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
	
	

}
