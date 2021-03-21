package com.khlibrary.board.model.dao;

import static com.khlibrary.common.JDBCTemplate.close;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.khlibrary.search.model.vo.Book;

public class NewBooksDao {
	private Properties query = new Properties();
	
	public NewBooksDao() {
		String fileName = NoticeDao.class.getResource("/com/khlibrary/sql/newBooks/newBooks-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	

	public List<Book> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> list = new ArrayList<>();
		String sql = query.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Book(rset.getLong("isbn"),
						 		  rset.getString("bk_name"),
						 		  rset.getDate("r_date"),
						 		  rset.getString("imgname"),
						 		  rset.getString("imgpath")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	public List<Book> selectMainList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> list = new ArrayList<>();
		String sql = query.getProperty("selectMainList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Book(rset.getString("bk_name"),
						 		  rset.getString("imgname"),
						 		  rset.getString("imgpath")));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
