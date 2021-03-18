package com.khlibrary.board.model.service;

import java.sql.Connection;
import java.util.List;
import static com.khlibrary.common.JDBCTemplate.*;

import com.khlibrary.board.model.dao.NoticeDao;
import com.khlibrary.board.model.vo.Notice;

public class NoticeService {

	public List<Notice> selectList() {
		Connection conn = getConnection();

		List<Notice> list = new NoticeDao().selectList(conn);
		
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

}
