package com.khlibrary.board.model.service;

import java.sql.Connection;
import java.util.List;
import static com.khlibrary.common.JDBCTemplate.*;


import com.khlibrary.board.model.dao.NoticeDao;
import com.khlibrary.board.model.vo.Notice;
import com.khlibrary.board.model.vo.PageInfo;



public class NoticeService {

	public List<Notice> selectList(PageInfo pi) {
		Connection conn = getConnection();

		List<Notice> list = new NoticeDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Notice selectNotice(int nno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, nno);
		
		Notice n = null;
		
		if(result > 0) {
			n = new NoticeDao().selectNotice(conn, nno);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return n;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteNotice(int nno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;
	}

	public List<Notice> selectList(String search) {
		Connection conn = getConnection();
		
		List<Notice> list = new NoticeDao().selectList(conn, search);
		
		close(conn);
			
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public int getSearchListCount(String search) {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().getSearchListCount(conn, search);
		
		close(conn);
		
		return listCount;
	}

	public List<Notice> selectSearchList(String search, PageInfo pi) {
		Connection conn = getConnection();
		
		List<Notice> list = new NoticeDao().selectSearchList(conn, pi, search);
		
		close(conn);
		
		return list;
		
	}

	
	
	///////////// yw 공지사항 메인용  ///////////////////////////////////////////////
	public List<Notice> selectMainList() {
		Connection conn = getConnection();
		
		List<Notice> list = new NoticeDao().selectMainList(conn);
		
		close(conn);
			
		return list;
	}




}
