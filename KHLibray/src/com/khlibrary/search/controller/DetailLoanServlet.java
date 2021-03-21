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
 * Servlet implementation class DetailLoanServlet
 */
@WebServlet("/detail/loan")
public class DetailLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailLoanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		request.setCharacterEncoding("UTF-8");
		//String bName = request.getParameter("bName");
		//String bWriter = request.getParameter("bWriter");
		//String bPublisher = request.getParameter("bPublisher");
		//String isbn = request.getParameter("isbn");
		//String tDate = request.getParameter("tDate");
		//String fDate = request.getParameter("fDate");
		
		//System.out.println(bName + ", " + bWriter + ", " +  bPublisher + ", " + isbn + ", " + tDate + ", " + fDate + ", ");
	
		String[] chk = request.getParameterValues("checkSelect");
	
		// System.out.println(Arrays.toString(chk)); //청구번호 넘어옴... 확인...
	
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
	
		int result = new BookService().loanBook(chk, userId);
	
		if(result > 0) {
		//  request.getSession().setAttribute("bName", bName);
		//  request.getSession().setAttribute("bWriter", bWriter);
		//  request.getSession().setAttribute("bPublisher", bPublisher);
		//	request.getSession().setAttribute("isbn", isbn);
		//	request.getSession().setAttribute("tDate", tDate);
		//	request.getSession().setAttribute("fDate", fDate);
			
			request.getSession().setAttribute("msg", "대출 예약 되었습니다.");
			//response.sendRedirect(request.getContextPath() + "/detail/result");
			response.sendRedirect(request.getContextPath() + "/mylib/lblist");
			//request.getRequestDispatcher("/views/myLib/loanList.jsp").forward(request, response);
			
		} else {
			request.getSession().setAttribute("msg", "대출불가합니다.?");
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
