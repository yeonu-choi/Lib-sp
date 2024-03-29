package com.khlibrary.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.khlibrary.common.JDBCTemplate.close;
import com.khlibrary.board.model.vo.FAQ;

public class FAQDao {
	private Properties query = new Properties();
	
	public FAQDao() {
		String fileName = NoticeDao.class.getResource("/com/khlibrary/sql/FAQ/FAQ-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public List<FAQ> selectCommonList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<FAQ> list = new ArrayList<>();
		String sql = query.getProperty("selectCommonList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("fno"),
						  	 	 rset.getString("f_qcontent"),
						  	 	 rset.getString("f_acontent"),
						  	 	 rset.getString("category"),
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

	public List<FAQ> selectAccountList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<FAQ> list = new ArrayList<>();
		String sql = query.getProperty("selectAccountList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("fno"),
						  	 	 rset.getString("f_qcontent"),
						  	 	 rset.getString("f_acontent"),
						  	 	 rset.getString("category"),
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

	public List<FAQ> selectBookList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<FAQ> list = new ArrayList<>();
		String sql = query.getProperty("selectBookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("fno"),
						  	 	 rset.getString("f_qcontent"),
						  	 	 rset.getString("f_acontent"),
						  	 	 rset.getString("category"),
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

	public List<FAQ> selectFacilityList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<FAQ> list = new ArrayList<>();
		String sql = query.getProperty("selectFacilityList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("fno"),
						  	 	 rset.getString("f_qcontent"),
						  	 	 rset.getString("f_acontent"),
						  	 	 rset.getString("category"),
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


	public int insertFAQ(Connection conn, FAQ faq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, faq.getF_Qcontent());
			pstmt.setString(2, faq.getF_Acontent());
			pstmt.setString(3, faq.getCategory());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int deleteFAQ(Connection conn, FAQ faq) {
		PreparedStatement pstmt= null;
		int result = 0;
		String sql = query.getProperty("deleteFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, faq.getF_Qcontent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);			
		}		
		return result;
	}

}
