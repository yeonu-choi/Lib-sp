package com.khlibrary.search.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.member.model.vo.Member;
import com.khlibrary.search.model.service.BookService;

/**
 * Servlet implementation class SimpleLoanServlet
 */
@WebServlet("/simple/loan")
public class SimpleLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimpleLoanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//String searchSelect = request.getParameter("searchSelect");
		//String search = request.getParameter("search");
		
		// System.out.println("BLS" + (String) request.getSession().getAttribute("searchSelect"));
				
		String[] chk = request.getParameterValues("checkSelect");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		
		int result = new BookService().loanBook(chk, userId);
		
		
		if(result > 0) {
			//request.getSession().setAttribute("searchSelect", searchSelect);
			//request.getSession().setAttribute("search", search);
			
			request.getSession().setAttribute("msg", "대출 예약 되었습니다.");
			//response.sendRedirect(request.getContextPath() + "/simple/result");
			
			response.sendRedirect(request.getContextPath() + "/mylib/lblist");
			//request.getRequestDispatcher("/views/myLib/loanList.jsp").forward(request, response);
			
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
