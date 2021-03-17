package com.khlibrary.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.khlibrary.common.JDBCTemplate.*;
import com.khlibrary.member.model.vo.Member;

public class MemberDao {
   private Properties query = new Properties();
   
   public MemberDao() {
      String fileName = MemberDao.class.getResource("/com/khlibrary/sql/member/member-query.xml").getPath();
      
      try {
         query.loadFromXML(new FileInputStream(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   public Member loginMember(Connection conn, Member member) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Member loginUser = null;
      String sql = query.getProperty("loginMember");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, member.getUser_id());
         pstmt.setString(2, member.getUser_pwd());
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            loginUser = new Member(rset.getString("user_id"),
                              rset.getString("user_pwd"),
                              rset.getString("user_name"),
                              rset.getString("birth_date"),
                              rset.getString("phone"),
                              rset.getString("email"),
                              rset.getString("address"),
                              rset.getString("grade"),
                              rset.getDate("enroll_date"),
                              rset.getInt("user_no"),
                              rset.getInt("overdue"));
                           
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return loginUser;
   }

   // 2. 회원 가입용 DAO 메소드
   public int insertMember(Connection conn, Member m) {
      PreparedStatement pstmt = null;
      int result = 0;
      String sql = query.getProperty("insertMember");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, m.getUser_id());
         pstmt.setString(2, m.getUser_pwd());
         pstmt.setString(3, m.getUser_name());
         pstmt.setString(4, m.getBirth_date());
         pstmt.setString(5, m.getPhone());
         pstmt.setString(6, m.getEmail());
         pstmt.setString(7, m.getAddress());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public int deleteMember(Connection conn, String user_id) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql = query.getProperty("deleteMember");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user_id);
		result = pstmt.executeUpdate();
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}	   
	   return result;
   }
   
   //4. 회원 정보 수정용 dao 메소드
   public int updateMember(Connection conn, Member m) {
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String sql = query.getProperty("updateMember");
	
	   try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, m.getUser_name());
		pstmt.setString(2, m.getPhone());
		pstmt.setString(3, m.getEmail());
		pstmt.setString(4, m.getAddress());
		pstmt.setString(5, m.getBirth_date());
		pstmt.setString(6, m.getUser_id());
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}	  
	return result;	
   }
   
   public Member selectMember(Connection conn, String user_id) {
	   Member member = null;
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String sql = query.getProperty("selectMember");   
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user_id);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			member =new Member(rset.getString("user_id"),
                    rset.getString("user_pwd"),
                    rset.getString("user_name"),
                    rset.getString("birth_date"),
                    rset.getString("phone"),
                    rset.getString("email"),
                    rset.getString("address"),
                    rset.getString("grade"),
                    rset.getDate("enroll_date"),
                    rset.getInt("user_no"),
                    rset.getInt("overdue"));
		}	
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);		
	}
	return member;
   }

   // 비밀번호 수정 dao 메소드
   public int updatePwd(Connection conn, String user_id, String user_pwd, String new_pwd) {
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String sql = query.getProperty("updatePwd");
	   
	   try {
		   pstmt = conn.prepareStatement(sql);
		
		   pstmt.setString(1, new_pwd);
		   pstmt.setString(2, user_id);
		   pstmt.setString(3, user_pwd);
		
		   result = pstmt.executeUpdate();
		
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   close(pstmt);
	   }
	   
	   return result;
   }

public int idCheck(Connection conn, String user_id) {
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	int result = 0;
	String sql = query.getProperty("idCheck");
	
	try {
		pstmt=conn.prepareStatement(sql);		
		pstmt.setString(1, user_id);
		
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

	}
