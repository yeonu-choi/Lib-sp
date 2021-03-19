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
 * Servlet implementation class MyWishBookListServlet
 */
@WebServlet("/mylib/wlist")
public class MyWishBookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWishBookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		String user_id = (String)request.getSession().getAttribute("login_id");
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		WishBookService wbService = new WishBookService();
		int listCount = wbService.getMyListCount(user_id);

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

		List<WishBook> list = wbService.selectMyList(pi, user_id);
		
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
