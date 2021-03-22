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
 * Servlet implementation class DetailSearchServlet
 */
@WebServlet("/detail/search")
public class DetailSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BSS" + (String) request.getSession().getAttribute("tDate"));
		
		String bName = request.getParameter("bName");
		String bWriter = request.getParameter("bWriter");
		String bPublisher = request.getParameter("bPublisher");
		String isbn = request.getParameter("isbn");
		String tDate = request.getParameter("tDate");
		String fDate = request.getParameter("fDate");
		
		Book bk = new Book(bName, bWriter, bPublisher);
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BookService bService = new BookService();
		
		int listCount = bService.getSearchListCount(bk, isbn ,tDate, fDate);
		
		int pageLimit = 10;
		int boardLimit = 10;
		int maxPage =(int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		System.out.println(pi);
		
		List<Book> list = bService.selectSearchList(pi, isbn, bk, tDate, fDate);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/search/detailSearchResult.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
