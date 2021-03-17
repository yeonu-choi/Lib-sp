package com.khlibrary.member.model.service;

import java.sql.Connection;
import java.util.List;

import static com.khlibrary.common.JDBCTemplate.*;

import com.khlibrary.common.model.vo.PageInfo;
import com.khlibrary.member.model.dao.MemberDao;
import com.khlibrary.member.model.vo.Member;


public class MemberService {

	// 1 .로그인용 서비스 메소드
		public Member loginMember(Member member) {
		
			Connection conn = getConnection();
					
//			System.out.println("conn : " + conn);
			
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
		// 3. 회원 탈퇴용 서비스 메서드
		public int deleteMember(String user_id) {
			Connection conn = getConnection();
			
			int result = new MemberDao().deleteMember(conn, user_id);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
					close(conn);
					
			return result;
		}

		// 4. 회원 정보 수정용 서비스 메서드
		public Member updateMember(Member m) {
			Connection conn = getConnection();
			// 1. update 수행
			int result = new MemberDao().updateMember(conn, m);
			
			
			// 2. update 결과에 따라 수정 된 updateMember 객체를 리턴하거나 null을 리턴
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
			// 1.비밀번호 수정
			int result = new MemberDao().updatePwd(conn, user_id, user_pwd, new_pwd);
			
		
			// 2. update 결과에 따라 수정 된 updateMember 객체를 리턴하거나 null을 리턴
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
	
}
