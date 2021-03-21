package com.khlibrary.wishBook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.wishBook.model.vo.NaverBook;
import com.khlibrary.wishBook.model.vo.NaverBookApi;

/**
 * Servlet implementation class WishSearchAPIServlet
 */
@WebServlet("/wish/search")
public class WishSearchAPIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishSearchAPIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		System.out.println(search);
		
		List<NaverBook> list  = new NaverBookApi().searchBook(search);
		//String nn = 
		//System.out.println(list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/search/naverSearchBookResult.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
