package com.khlibrary.loan.model.dao;

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

import com.khlibrary.common.model.vo.PageInfo;
import com.khlibrary.loan.model.vo.Loan;

public class LoanDao {
	private Properties query = new Properties();

	public LoanDao() {
		String fileName = LoanDao.class.getResource("/com/khlibrary/sql/loan/loan-query.xml").getPath();

		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn, String user_id) {
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

	public List<Loan> selectMyList(Connection conn, PageInfo pi, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Loan> list = new ArrayList<>();
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
				list.add(new Loan(rset.getInt("lid"), 
								  rset.getString("bk_name"), 
								  rset.getString("writer"),
								  rset.getString("publisher"),
								  rset.getDate("loan_date"), 
								  rset.getDate("return_date"),
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

	public List<Loan> selectMySortList(Connection conn, PageInfo pi, String user_id, String viewCondition,
			String rank) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Loan> list = new ArrayList<>();
		String sql = "";
		
		if (viewCondition.equals("rdate") && rank.equals("asc")) {
			sql = query.getProperty("selectRdateAsc");
		} else if (viewCondition.equals("rdate") && rank.equals("desc")) {
			sql = query.getProperty("selectRdateDesc");
		} else if (viewCondition.equals("lid") && rank.equals("asc")) {
			sql = query.getProperty("selectLidAsc");
		} else if (viewCondition.equals("lid") && rank.equals("desc")) {
			sql = query.getProperty("selectLidDesc");
		} else if (viewCondition.equals("ldate") && rank.equals("asc")) {
			sql = query.getProperty("selectLdateAsc");
		} else if (viewCondition.equals("ldate") && rank.equals("desc")) {
			sql = query.getProperty("selectLdateDesc");
		} else if (viewCondition.equals("status") && rank.equals("asc")) {
			sql = query.getProperty("selectStatusAsc");
		} else {
			sql = query.getProperty("selectStatusDesc");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Loan(rset.getInt("lid"), 
								  rset.getString("bk_name"), 
								  rset.getString("writer"),
								  rset.getString("publisher"),
								  rset.getDate("loan_date"), 
								  rset.getDate("return_date"),
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

	public int returnRequest(Connection conn, String lid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("returnRequest");
		
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

	public int onLoanCount(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int lCount = 0;
		String sql = query.getProperty("onLoanCount");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				lCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return lCount;
	}

}
