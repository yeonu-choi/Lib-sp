package com.khlibrary.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.search.model.service.BookService;
import com.khlibrary.search.model.vo.Book;
import com.khlibrary.search.model.vo.PageInfo;

/**
 * Servlet implementation class SimpleReSearchServlet
 */
@WebServlet("/simple/reSearch")
public class SimpleReSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimpleReSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String preSearchSelect = request.getParameter("preSearchSelect");
		String preSearch = request.getParameter("preSearch");
		String searchSelect = request.getParameter("searchSelect");
		String search = request.getParameter("search");
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BookService bService = new BookService();
		
		int listCount = bService.getReSearchListCount(preSearchSelect, preSearch, searchSelect, search);
		
		
		int pageLimit = 10;
		int boardLimit = 10;
		int maxPage =(int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		System.out.println(listCount);
		
		List<Book> list = bService.selectReSearchList(pi, preSearchSelect, preSearch, searchSelect, search);
		
		System.out.println(list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
