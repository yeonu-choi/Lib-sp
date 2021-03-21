package com.khlibrary.board.model.service;

import java.sql.Connection;
import java.util.List;
import static com.khlibrary.common.JDBCTemplate.*;

import com.khlibrary.board.model.dao.NewBooksDao;
import com.khlibrary.search.model.vo.Book;

public class NewBooksService {

	public List<Book> selectList() {
		Connection conn = getConnection();
		
		List<Book> list = new NewBooksDao().selectList(conn);
		
		close(conn);
		
		return list;
		
	}

	
	
	//////////////// yw 메인용 /////////////////////////////////////////
	public List<Book> selectMainList() {
		Connection conn = getConnection();
		
		List<Book> list = new NewBooksDao().selectMainList(conn);
		
		close(conn);
		
		return list;
	}

}
