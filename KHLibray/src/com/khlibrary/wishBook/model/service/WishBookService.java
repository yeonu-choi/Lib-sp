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

}
