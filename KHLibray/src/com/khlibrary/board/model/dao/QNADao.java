package com.khlibrary.board.model.dao;

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

import com.khlibrary.board.model.vo.PageInfo;
import com.khlibrary.board.model.vo.QNA;

import static com.khlibrary.common.JDBCTemplate.close;

public class QNADao {
	private Properties query = new Properties();
	
	public QNADao() {
		String fileName = QNADao.class.getResource("/com/khlibrary/sql/QNA/QNA-query.xml").getPath();
		
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
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
				
		return listCount;
	}

	public List<QNA> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<QNA> list = new ArrayList<>();
		String sql = query.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getNoticeLimit() + 1;
			int endRow = startRow + pi.getNoticeLimit();
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QNA(rset.getInt("qna_no"),
								 rset.getString("qna_qtitle"),
								 rset.getString("qna_qcontent"),
								 rset.getString("qna_acontent"),
								 rset.getInt("q_count"),
								 rset.getDate("c_date"),
								 rset.getDate("m_date"),
								 rset.getString("status"),
								 rset.getString("secret"),
								 rset.getString("user_id")));
				
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int insertQNA(Connection conn, QNA q) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertQNA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getQna_Qtitle());
			pstmt.setString(2, q.getQna_Qcontent());
			pstmt.setString(3, q.getSecret());
			pstmt.setString(4, q.getUser_Id());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
