package com.khlibrary.admin.model.dao;

import static com.khlibrary.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.khlibrary.admin.model.vo.ReturnBook;
import com.khlibrary.common.model.vo.PageInfo;

public class ReturnBookDao {
	private Properties query = new Properties();

	public ReturnBookDao() {
		String fileName = ReturnBookDao.class.getResource("/com/khlibrary/sql/return/return-query.xml").getPath();

		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String sql = query.getProperty("getListCount");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public List<ReturnBook> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReturnBook> list = new ArrayList<>();
		String sql = query.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ReturnBook(rset.getInt("lid"), 
										rset.getString("user_id"), 
										rset.getString("bk_name"),
										rset.getDate("loan_date"), 
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

	public List<ReturnBook> selectSortList(Connection conn, PageInfo pi, String viewCondition, String rank) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<ReturnBook> list = new ArrayList<>();
		String sql = "";

		if (viewCondition.equals("lid") && rank.equals("asc")) {
			sql = query.getProperty("selectLidAsc");
		} else if (viewCondition.equals("lid") && rank.equals("desc")) {
			sql = query.getProperty("selectLidDesc");
		} else if (viewCondition.equals("ldate") && rank.equals("asc")) {
			sql = query.getProperty("selectLdateAsc");
		} else {
			sql = query.getProperty("selectLdateDesc");
		}

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ReturnBook(rset.getInt("lid"), 
										rset.getString("user_id"), 
										rset.getString("bk_name"),
										rset.getDate("loan_date"), 
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

	public int changeBstatus(Connection conn, String lid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("changeBstatus");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(lid));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int changeLstatus(Connection conn, String lid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("changeLstatus");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(lid));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int increaseOverdue(Connection conn, String lid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("increaseOverdue");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(lid));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
