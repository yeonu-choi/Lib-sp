package com.khlibrary.search.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.search.model.service.BookService;

import com.khlibrary.member.model.vo.Member;

/**
 * Servlet implementation class BookLoanServlet
 */
@WebServlet("/book/loan")
public class BookLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookLoanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String[] chk = request.getParameterValues("checkSelect");
		
		// System.out.println(Arrays.toString(chk)); //청구번호 넘어옴... 확인...
		
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		//for(int i = 0 ; i < chk.length; i++ ) {
		//	System.out.println(chk[i]);
		//}
		//System.out.println(chk.length);
		
		
		int result = new BookService().loanBook(chk, userId);
		
		// System.out.println(result);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "대출 예약 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/book/list");
		} else {
			System.out.println("실패");
			// 수정하기
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
