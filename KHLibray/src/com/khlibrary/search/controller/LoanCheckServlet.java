package com.khlibrary.search.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.member.model.vo.Member;
import com.khlibrary.search.model.service.BookService;

/**
 * Servlet implementation class LoanCheckServlet
 */
@WebServlet("/loan/check")
public class LoanCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoanCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		System.out.println(user_id);
		
		int result = new BookService().loanNumCount(user_id);
		
		PrintWriter out = response.getWriter();
		
		if(result > 5) {
			out.print("fail");
		} else {
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
