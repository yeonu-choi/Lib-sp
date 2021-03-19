package com.khlibrary.wishBook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.wishBook.model.service.WishBookService;

/**
 * Servlet implementation class WishBookFirstCheckServlet
 */
@WebServlet("/wish/bkFCheck")
public class WishBookFirstCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookFirstCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bName = request.getParameter("bName");
		
		// DB의 MEMBER 테이블에서 동일 아이디가 있는지 조회하여 숫자로 리턴
		// 있으면 1 없으면 0
		int result = new WishBookService().firstCheckWishBook(bName);
		
		System.out.println("소장 도서 확인 결과 : " + result);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			// 희망 도서 중복
			out.print("fail");
		} else {
			// 희망 도서 중복 X
			out.print("success");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
