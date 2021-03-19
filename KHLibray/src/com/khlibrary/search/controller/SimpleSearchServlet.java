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
 * Servlet implementation class SimpleSearchServlet
 */
@WebServlet("/simple/search")
public class SimpleSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimpleSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// getParameter로 넘어온 값 변수에 저장
		String searchSelect = request.getParameter("searchSelect");
		String search = request.getParameter("search");
		
		// 검색 초기화 or 재검색 
//		String reSearch = request.getParameter("reSearch");
//		
//		if(reSearch != null) {
//			request.removeAttribute("list"); // 다시 생각하기
//		}
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BookService bService = new BookService();
		
		// 게시글 총 갯수 구하기 
		int listCount = bService.getSearchListCount(searchSelect, search);
		
		// 페이징 처리용 변수
		int pageLimit = 10;
		
		int boardLimit = 10;
		
		int maxPage =(int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		List<Book> list = bService.selectSearchList(pi, searchSelect, search);
		
		
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
