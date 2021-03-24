package com.khlibrary.member.model.dao;

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

import com.khlibrary.common.model.vo.PageInfo;
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
	
	public Member idSearch(Connection conn, Member member) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Member idSearch = null;
	      String sql = query.getProperty("idSearch");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, member.getUser_name());
	         pstmt.setString(2, member.getEmail());
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            idSearch = new Member(rset.getString("user_id"),
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
	      
	      return idSearch;
	   }
	
	public Member pwdSearch(Connection conn, Member member) {
		 PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Member pwdSearch = null;
	      String sql = query.getProperty("pwdSearch");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, member.getUser_id());
	         pstmt.setString(2, member.getEmail());
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            pwdSearch = new Member(rset.getString("user_id"),
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
	      
	      return pwdSearch;
	}

	
	 public int pwdUpdate(Connection conn, String user_id, String user_pwd) {
		   int result = 0;
		   PreparedStatement pstmt = null;
		   String sql = query.getProperty("pwdUpdate");
		   
		   try {
			   pstmt = conn.prepareStatement(sql);
						 
			   pstmt.setString(1, user_id);
			   pstmt.setString(2, user_pwd);
			
			   result = pstmt.executeUpdate();
			
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } finally {
			   close(pstmt);
		   }
		   
		   return result;
	   }
	
	
	
	
	/////////////////아래부터 yw //////////////////////////////////////////////////////
	
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

	public List<Member> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Member> list = new ArrayList<>();
		String sql = query.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getString("user_id"), 
								rset.getString("user_name"), 
								rset.getString("grade"), 
								rset.getDate("enroll_date"), 
								rset.getInt("overdue")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public List<Member> selectSortList(Connection conn, PageInfo pi, String viewCondition, String rank) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Member> list = new ArrayList<>();
		String sql = "";
		
		if(viewCondition.equals("overdue")&&rank.equals("asc")) {
			sql = query.getProperty("selectOverdueAsc");
		} else if(viewCondition.equals("overdue")&&rank.equals("desc")) {
			sql = query.getProperty("selectOverdueDesc");
		} else if(viewCondition.equals("edate")&&rank.equals("asc")) {
			sql = query.getProperty("selectEdateAsc");
		} else if(viewCondition.equals("edate")&&rank.equals("desc")) {
			sql = query.getProperty("selectEdateDesc");
		} else if(viewCondition.equals("grade")&&rank.equals("asc")) {
			sql = query.getProperty("selectGradeAsc");
		} else {
			sql = query.getProperty("selectGradeDesc");
		}
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getString("user_id"), 
									rset.getString("user_name"), 
									rset.getString("grade"), 
									rset.getDate("enroll_date"), 
									rset.getInt("overdue")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int changeGrade(Connection conn, String userId, String newGrade) {
		PreparedStatement pstmt = null;
		String sql = query.getProperty("changeGrade");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newGrade);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginMember(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String sql = query.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
	            m = new Member(rset.getString("user_id"),
	                              rset.getString("user_name"),
	                              rset.getString("grade"),
	                              rset.getInt("user_no"));                           
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int deleteMember(Connection conn, String user_id, String user_pwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = query.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

	

}
