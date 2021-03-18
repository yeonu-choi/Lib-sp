package com.khlibrary.wishBook.model.dao;

import static com.khlibrary.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.khlibrary.search.model.dao.BookDao;
import com.khlibrary.wishBook.model.vo.WishBook;

public class WishBookDao {
	private Properties query = new Properties();

	public WishBookDao() {
		String fileName = BookDao.class.getResource("/com/khlibrary/sql/wishBook/wishBook-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 희망 도서 신청 Dao
	public int applyWishBook(Connection conn, WishBook wb) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("applyWishBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, wb.getWbName());
			pstmt.setString(2, wb.getWbWriter());
			pstmt.setString(3, wb.getWbPublisher());
			pstmt.setInt(4, wb.getIssueYear());
			pstmt.setString(5, wb.getUserId());
			pstmt.setString(6, wb.getPhone());
			pstmt.setString(7, wb.getEmail());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 희망 도서 중복 체크
	public int wishBookCheck(Connection conn, String bName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = query.getProperty("wishBookCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	// 희망 도서 리스트
	public List<WishBook> selectWishBookList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<WishBook> list = new ArrayList<>();
		String sql = query.getProperty("selectWishBookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new WishBook(rset.getInt("wb_id")
									, rset.getString("wb_name")
									, rset.getString("wb_writer")
									, rset.getString("wb_publisher")
									, rset.getInt("issue_year")
									, rset.getDate("request_date")
									, rset.getString("status")
									, rset.getString("user_id")
									, rset.getString("phone")
									, rset.getString("email")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 희망 도서 입고 완료 
	public int insertWishBook(Connection conn, int[] wbId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertWishBook");
		
		try {
			
			for(int w : wbId) {
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setInt(1, w);
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	////////////////////////// 이하 yw /////////////////////////////////////////////////////////
	public int getMyListCount(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = query.getProperty("getMyListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public List<WishBook> selectMyList(Connection conn, PageInfo pi, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<WishBook> list = new ArrayList<>();
		String sql = query.getProperty("selectMyList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new WishBook(rset.getInt("wb_id"), 
										rset.getString("wb_name"), 
										rset.getString("wb_writer"),
										rset.getDate("request_date"), 
										rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public List<WishBook> selectMySortList(Connection conn, PageInfo pi, String user_id, String wstatus, String smonth1,
			String emonth1) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<WishBook> list = new ArrayList<>();
		String sql = query.getProperty("selectMySortList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setString(1, smonth1);
			pstmt.setString(2, emonth1);
			pstmt.setString(3, wstatus);
			pstmt.setString(4, user_id);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new WishBook(rset.getInt("wb_id"), 
										rset.getString("wb_name"), 
										rset.getString("wb_writer"),
										rset.getDate("request_date"), 
										rset.getString("status")));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int getMySortListCount(Connection conn, String user_id, String wstatus, String smonth1, String emonth1) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = query.getProperty("getMySortListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, smonth1);
			pstmt.setString(2, emonth1);
			pstmt.setString(3, wstatus);
			pstmt.setString(4, user_id);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}
	
}
