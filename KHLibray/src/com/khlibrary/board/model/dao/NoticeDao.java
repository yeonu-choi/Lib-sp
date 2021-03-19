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
import com.khlibrary.board.model.vo.Notice;

public class NoticeDao {
	private Properties query = new Properties();
	
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/com/khlibrary/sql/notice/notice-query.xml").getPath();
		
		try {
			query.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public List<Notice> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Notice> list = new ArrayList<>();
		String sql = query.getProperty("selectList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("nNo"),
									rset.getString("nTitle"),
									rset.getString("nContent"),
									rset.getInt("nCount"),
									rset.getDate("c_Date"),
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

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int increaseCount(Connection conn, int nno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Notice selectNotice(Connection conn, int nno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		String sql = query.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("nNo"),
									rset.getString("nTitle"),
									rset.getString("nContent"),
									rset.getInt("nCount"),
									rset.getDate("c_Date"),
									rset.getString("status"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

}
