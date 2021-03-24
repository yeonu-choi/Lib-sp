package com.khlibrary.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.khlibrary.board.model.dao.QNADao;
import com.khlibrary.board.model.vo.PageInfo;
import com.khlibrary.board.model.vo.QNA;

import static com.khlibrary.common.JDBCTemplate.*;

public class QNAService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new QNADao().getListCount(conn);
		
		close(conn);
			
		return listCount;
	}

	public List<QNA> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		List<QNA> list = new QNADao().selectList(conn, pi);
		
		
		close(conn);
		
		return list;
	}

	public int insertQNA(QNA q) {
		Connection conn = getConnection();
		
		int result = new QNADao().insertQNA(conn, q);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
