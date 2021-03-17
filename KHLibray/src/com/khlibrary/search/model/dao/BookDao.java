package com.khlibrary.search.model.dao;

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
import com.khlibrary.search.model.vo.PageInfo;


public class BookDao {
	
	private Properties query = new Properties();

	public BookDao() {
		String fileName = BookDao.class.getResource("/com/khlibrary/sql/search/book-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 검색 리스트 카운트
	public int getSearchListCount(Connection conn, String searchSelect, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql ="";
		
		if(searchSelect.equals("total")) {
			sql = query.getProperty("getSearchTotalListCount");
		} else if(searchSelect.equals("name")) {
			sql = query.getProperty("getSearchNameListCount");
		} else if(searchSelect.equals("writer")) {
			sql = query.getProperty("getSearchWriterListCount");
		} else {
			sql = query.getProperty("getSearchPublisherListCount");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search);
			
			if(searchSelect.equals("total")) {
				pstmt.setString(2, search);
				pstmt.setString(3, search);
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}
	
	// 검색 결과 리스트 
	public List<Book> selectSearchList(Connection conn, PageInfo pi, String searchSelect, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Book> list = new ArrayList<>();
		String sql = "";
		
		if(searchSelect.equals("total")) {
			sql = query.getProperty("selectSearchTotalList");
		} else if(searchSelect.equals("name")) {
			sql = query.getProperty("selectSearchNameList");
		} else if(searchSelect.equals("writer")) {
			sql = query.getProperty("selectSearchWriterList");
		} else {
			sql = query.getProperty("selectSearchPublisherList");
		}
		
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;
				
				pstmt.setString(1, search);
				
				if(searchSelect.equals("total")) {
					pstmt.setString(2, search);
					pstmt.setString(3, search);
					pstmt.setInt(4, startRow);
					pstmt.setInt(5, endRow);
				} else {
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
				}
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Book(rset.getInt("isbn")
									, rset.getString("bk_name")
									, rset.getString("writer")
									, rset.getString("publisher")
									, rset.getInt("issue_year")
									, rset.getDate("r_date")
									, rset.getString("imgname")
									, rset.getString("imgpath")
									, rset.getString("call_num")
									, rset.getString("status")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

		return list;
	}

	// 대출 정보 입력
	public int insertLoanInfo(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0; 
		String sql = query.getProperty("insertLoanInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 대출 상세 정보 입력
	public int insertLoanCallNum(Connection conn, String[] chk) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertLoanCallNum");	// Ldetail insert
		
		try {
			
			for(String c : chk) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, c);
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateLoanCallNum(Connection conn, String[] chk) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("updateLoanCallNum");	// bdetail status update
		
		try {
			
			for(String c : chk) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, c);
				
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
}
