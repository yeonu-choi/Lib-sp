package com.khlibrary.board.model.service;

import java.sql.Connection;
import java.util.List;
import static com.khlibrary.common.JDBCTemplate.*;

import com.khlibrary.board.model.dao.FAQDao;
import com.khlibrary.board.model.vo.FAQ;

public class FAQService {

	public List<FAQ> selectCommonList() {
		Connection conn = getConnection();
		
		List<FAQ> list = new FAQDao().selectCommonList(conn);
		
		close(conn);
		
		return list;
	}

	public List<FAQ> selectAccountList() {
		Connection conn = getConnection();
		
		List<FAQ> list = new FAQDao().selectAccountList(conn);
		
		close(conn);
		
		return list;
	}

	public List<FAQ> selectBookList() {
		Connection conn = getConnection();
		
		List<FAQ> list = new FAQDao().selectBookList(conn);
		
		close(conn);
		
		return list;
	}

	public List<FAQ> selectFacilityList() {
		Connection conn = getConnection();
		
		List<FAQ> list = new FAQDao().selectFacilityList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertFAQ(FAQ faq) {
		Connection conn = getConnection();
		
		int result = new FAQDao().insertFAQ(conn, faq);
		
		if(result > 0) {
			commit(conn);			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public int deleteFAQ(FAQ faq) {
		Connection conn = getConnection();
		
		int result = new FAQDao().deleteFAQ(conn, faq);
		
		if(result > 0) {
			commit(conn);
		} else  {
			rollback(conn);
		}
		
		return result;
	}

}
