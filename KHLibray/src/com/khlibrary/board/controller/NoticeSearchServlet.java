package com.khlibrary.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.board.model.service.NoticeService;
import com.khlibrary.board.model.vo.Notice;

import com.khlibrary.board.model.vo.PageInfo;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/notice/search")
public class NoticeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String search = request.getParameter("search");
			
			int currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			NoticeService nService = new NoticeService();
			
			int listCount = nService.getSearchListCount(search);
			
			int pageLimit = 10;			// 한 페이지 하단에 보여질 페이징바 갯수
			int boardLimit = 10;		// 한 페이지에 보여질 게시글 수
			int maxPage = (int)Math.ceil((double)listCount/boardLimit);
			int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			int endPage = startPage + pageLimit - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage,
					startPage, endPage);
			
			
			List<Notice> list = nService.selectSearchList(search, pi);
		
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			RequestDispatcher view = request.getRequestDispatcher("/views/board/notice.jsp");
			view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
