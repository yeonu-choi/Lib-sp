package com.khlibrary.wishBook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.common.model.vo.PageInfo;
import com.khlibrary.wishBook.model.service.WishBookService;
import com.khlibrary.wishBook.model.vo.WishBook;

/**
 * Servlet implementation class MyWishBookListSortServlet
 */
@WebServlet("/mylib/wsort")
public class MyWishBookListSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWishBookListSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user_id = (String)request.getSession().getAttribute("login_id");
		String wstatus = request.getParameter("wstatus");
		String smonth = request.getParameter("start");
		String emonth = request.getParameter("end");
		
		String[] sarr = smonth.split("-"); 
		String[] earr = emonth.split("-");
		
		String smonth1 = "";
		String emonth1 = "";
		
		for(int i =0 ; i<sarr.length; i++) {
			smonth1 += sarr[i];
			emonth1 += earr[i];
		}
		
		int currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		WishBookService wbService = new WishBookService();
		int listCount = wbService.getMySortListCount(user_id, wstatus, smonth1, emonth1);

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

		List<WishBook> list = wbService.selectMySortList(pi, user_id, wstatus, smonth1, emonth1);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);

		request.getRequestDispatcher("/views/myLib/wishBookList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
