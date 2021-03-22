package com.khlibrary.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.board.model.service.FAQService;
import com.khlibrary.board.model.vo.FAQ;

/**
 * Servlet implementation class FAQListServlet
 */
@WebServlet("/faq/list")
public class FAQListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FAQService fService = new FAQService();
		
		
		List<FAQ> common = fService.selectCommonList();		
		List<FAQ> account = fService.selectAccountList();
		List<FAQ> book = fService.selectBookList();
		List<FAQ> facility = fService.selectFacilityList();
		
		request.setAttribute("common", common);
		request.setAttribute("account", account);
		request.setAttribute("book", book);
		request.setAttribute("facility", facility);
		request.getRequestDispatcher("/views/board/faq.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
