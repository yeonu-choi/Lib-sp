package com.khlibrary.loan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.common.model.vo.PageInfo;
import com.khlibrary.loan.model.service.LoanService;
import com.khlibrary.loan.model.vo.Loan;
import com.khlibrary.member.model.service.MemberService;
import com.khlibrary.member.model.vo.Member;

/**
 * Servlet implementation class MyLoanSortListServlet
 */
@WebServlet("/mylib/lsort")
public class MyLoanSortListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyLoanSortListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = (String)request.getSession().getAttribute("login_id");
		String viewCondition = request.getParameter("viewCondition");
		String rank = request.getParameter("rank");
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		LoanService lService = new LoanService();
		int listCount = lService.getMyListCount(user_id);

		int pageLimit = 10;
		int boardLimit = 10;
		int maxPage;
		int startPage;
		int endPage; 

		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if(maxPage == 0) {
			maxPage = 1;
		}
		
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		Member m = new MemberService().loginMember(user_id);
		List<Loan> list = lService.selectMySortList(pi, user_id, viewCondition, rank);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("/views/myLib/loanList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
