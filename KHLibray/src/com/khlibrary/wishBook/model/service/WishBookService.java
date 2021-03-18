package com.khlibrary.wishBook.model.service;

import static com.khlibrary.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.khlibrary.wishBook.model.dao.WishBookDao;
import com.khlibrary.wishBook.model.vo.WishBook;

public class WishBookService {
	
	// 희망 도서 신청 Service
	public int applyWishBook(WishBook wb) {
		Connection conn = getConnection();
		
		int result = new WishBookDao().applyWishBook(conn, wb);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 희망 도서 중복 체크
	public int wishBookCheck(String bName) {
		Connection conn = getConnection();
		
		int result = new WishBookDao().wishBookCheck(conn, bName);
		
		close(conn);
		
		return result;
	}
	
	// 희망 도서 리스트
	public List<WishBook> selectWishBookList() {
		Connection conn= getConnection();
		
		List<WishBook> list = new WishBookDao().selectWishBookList(conn);
		
		close(conn);
		
		return list;
	}
	
	// 희망 도서 입고 완료
	public int insertWishBook(int[] wbId) {
		Connection conn = getConnection();
		
		int result1 = new WishBookDao().insertWishBook(conn, wbId);
		
		int result = 0;
		
		if(result1==wbId.length) {
			result = 1;
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	
	////////////////// 이하 yw //////////////////////////////////////////////////////////
	
	
	public int getMyListCount(String user_id) {
		Connection conn = getConnection();
		
		int listCount = new WishBookDao().getMyListCount(conn, user_id);
				
		close(conn);
		
		return listCount;
	}

	public List<WishBook> selectMyList(PageInfo pi, String user_id) {
		Connection conn = getConnection();
		
		List<WishBook> list = new WishBookDao().selectMyList(conn, pi, user_id);
		
		close(conn);
		
		return list;
	}

	public List<WishBook> selectMySortList(PageInfo pi, String user_id, String wstatus, String smonth1,
			String emonth1) {
		
		Connection conn = getConnection();
		
		List<WishBook> list = new WishBookDao().selectMySortList(conn, pi, user_id, wstatus, smonth1, emonth1);
		
		close(conn);
		
		return list;
	}

	public int getMySortListCount(String user_id, String wstatus, String smonth1, String emonth1) {
		Connection conn = getConnection();
		
		int listCount = new WishBookDao().getMySortListCount(conn, user_id, wstatus, smonth1, emonth1);
				
		close(conn);
		
		return listCount;
	}

	
}
