package com.khlibrary.search.controller;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class SimpleSortServlet
 */
@WebServlet("/simple/sort")
public class SimpleSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimpleSortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchSelect = request.getParameter("searchSelect");
		String search = request.getParameter("search");
		String sortSelect = request.getParameter("sortSelect");
		String numSelect = request.getParameter("numSelect");
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BookService bService = new BookService();
		
		int listCount = bService.getSearchListCount(searchSelect, search);
		
		int pageLimit = 10;
		
		int boardLimit = Integer.parseInt(numSelect);
		
		int maxPage =(int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Book> list = new ArrayList<>(); 
		
		if(sortSelect.equals("서명순")) {
			list = bService.selectSearchList(pi, searchSelect, search); // 원래 것
		} else if(sortSelect.equals("저자순")){
			list = bService.searchWriterSortList(pi, searchSelect, search); 
		} else {
			list = bService.searchLatestSortList(pi, searchSelect, search);  
		}
		
		
		System.out.println(list);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/search/simpleSearchResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
