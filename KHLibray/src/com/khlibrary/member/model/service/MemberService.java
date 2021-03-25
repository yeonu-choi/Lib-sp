package com.khlibrary.member.model.service;

import java.sql.Connection;
import java.util.List;

import static com.khlibrary.common.JDBCTemplate.*;
import static com.khlibrary.common.JDBCTemplate.close;
import static com.khlibrary.common.JDBCTemplate.getConnection;

import com.khlibrary.common.model.vo.PageInfo;
import com.khlibrary.member.model.dao.MemberDao;
import com.khlibrary.member.model.vo.Member;


public class MemberService {

	// 1 .로그인용 서비스 메소드
		public Member loginMember(Member member) {
		
			Connection conn = getConnection();
					
			Member loginUser = new MemberDao().loginMember(conn, member); 
			
			close(conn);
			
			return loginUser;
		}

		// 2. 회원 가입용 서비스 메소드
		public int insertMember(Member m) {
			Connection conn = getConnection(); 
			
			int result = new MemberDao().insertMember(conn, m);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);			
			}
			close(conn);
			
			return result;
		}

		// 3. 회원 정보 수정용 서비스 메서드
		public Member updateMember(Member m) {
			Connection conn = getConnection();
	
			int result = new MemberDao().updateMember(conn, m);
			
			Member updateMember =null;
			if(result > 0) {
				commit(conn);
				updateMember = new MemberDao().selectMember(conn, m.getUser_id());
			} else {
				rollback(conn);
			}
			
			close(conn);
					
			return updateMember;
		}

		// 비밀번호 수정용 서비스 메소드
		public Member updatePwd(String user_id, String user_pwd, String new_pwd) {
			Connection conn = getConnection();
		
			int result = new MemberDao().updatePwd(conn, user_id, user_pwd, new_pwd);
						
			Member updateMember =null;
			if(result > 0) {
				commit(conn);
				updateMember = new MemberDao().selectMember(conn, user_id);
			} else {
				rollback(conn);
			}
					
			close(conn);
							
			return updateMember;
		}

		public int idCheck(String user_id) {
			Connection conn = getConnection();
			
			int result = new MemberDao().idCheck(conn, user_id);
			
			close(conn);
						
			return result;
		}
		
		public Member idSearch(Member member) {
		
			Connection conn = getConnection();
						
			Member idSearch = new MemberDao().idSearch(conn, member); 
			
			close(conn);
			
			return idSearch;
		}
	// 비밀번호 찾기시 아이디/이메일 맞는지 확인 	
	public Member pwdSearch(Member member) {
		
		Connection conn = getConnection();
		
		Member pwdSearch = new MemberDao().pwdSearch(conn, member); 
		
		close(conn);
		
		return pwdSearch;			
		}
	
	// 비밀번호 찾기 후 수정된 비밀번호 등록하기
	public int pwdUpdate(Member m) {
	      Connection conn = getConnection();	      
	      int result = new MemberDao().pwdUpdate(conn, m);
	               
	      if(result > 0) {
	        commit(conn);
	    } else {	         
	    	rollback(conn);
	      }	            
	      close(conn);
	         
	      return result ;
	   }
	
/////////////////아래부터 yw ////////////////////////////////////////////////////// 	
		
		public int getListCount() {
			Connection conn = getConnection();

			int listCount = new MemberDao().getListCount(conn);

			close(conn);

			return listCount;

		}

		public List<Member> selectList(PageInfo pi) {
			Connection conn = getConnection();

			List<Member> list = new MemberDao().selectList(conn, pi);

			close(conn);

			return list;
		}

		public List<Member> selectSortList(PageInfo pi, String viewCondition, String rank) {
			Connection conn = getConnection();

			List<Member> list = new MemberDao().selectSortList(conn, pi, viewCondition, rank);

			close(conn);

			return list;
		}

		public int changeGrade(String userId, String newGrade) {
			Connection conn = getConnection();
			int result = new MemberDao().changeGrade(conn, userId, newGrade);

			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
		}

		public Member loginMember(String user_id) {
			Connection conn = getConnection();

			Member m = new MemberDao().loginMember(conn, user_id); 

			close(conn);

			return m;
		}

		public int deleteMember(String user_id, String user_pwd) {
			Connection conn = getConnection();

			int result = new MemberDao().deleteMember(conn, user_id, user_pwd);

			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}

			close(conn);

			return result;
		}

		

		

		

	
	
		


}
