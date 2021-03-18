package com.khlibrary.wishBook.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.member.model.vo.Member;
import com.khlibrary.wishBook.model.service.WishBookService;
import com.khlibrary.wishBook.model.vo.WishBook;

/**
 * Servlet implementation class WishBookServlet
 */
@WebServlet("/wish/apply")
public class WishBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = "user01"; //((Member)request.getSession().getAttribute("loginUser")).getUser_id();
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String bName = request.getParameter("bName");
		String bWriter = request.getParameter("bWriter");
		String bPublisher = request.getParameter("bPublisher");
		int issueDate = 0; 
		if(request.getParameter("issueDate") != "") {
			issueDate = Integer.parseInt(request.getParameter("issueDate"));
		}
		
//		if(email == "") {
//			email = "없음";
//		}
//		if(phone == "") {
//			phone = "없음";
//		}
		
		WishBook wb = new WishBook(bName, bWriter, bPublisher, issueDate, userId, phone, email);
		
		System.out.println(wb);
		
		int result = new WishBookService().applyWishBook(wb);
		
		System.out.println(result);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "희망 도서 신청이 완료되었습니다.");
			request.getRequestDispatcher("/views/search/wishBook.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
