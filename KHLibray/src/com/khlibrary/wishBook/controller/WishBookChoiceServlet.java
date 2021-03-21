package com.khlibrary.wishBook.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class WishBookChoiceServlet
 */
@WebServlet("/wish/choice")
public class WishBookChoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookChoiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bkInfo = request.getParameter("bkInfo");
		
		String[] bkArr = bkInfo.split(",");
		
		request.setAttribute("bTitle", bkArr[0]);
		request.setAttribute("bWriter", bkArr[1]);
		request.setAttribute("bPublisher", bkArr[2]);
		request.setAttribute("issueDate", bkArr[3].substring(0, 4));
		
		request.getRequestDispatcher("/views/search/wishBook.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
