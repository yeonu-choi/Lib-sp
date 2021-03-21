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
 * Servlet implementation class WishBookCheckServlet
 */
@WebServlet("/wish/bkCheck")
public class WishBookCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bName = request.getParameter("bName");
		
		int result = new WishBookService().firstCheckWishBook(bName);
		int result2 = new WishBookService().checkWishBook(bName);
		
		System.out.println("소장 도서 확인 결과 : " + result);
		
		System.out.println("중복 도서 확인 결과 : " + result2);
		
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			// 소장 도서 
			out.print("fail1");
		} else if(result2 > 0) {
			// 희망 도서 중복
			out.print("fail2");
		} else {
			out.print("success");
			// 희망 도서 중복 X
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
