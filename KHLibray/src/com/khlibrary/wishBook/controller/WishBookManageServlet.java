package com.khlibrary.wishBook.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.wishBook.model.service.WishBookService;

/**
 * Servlet implementation class WishBookManageServlet
 */
@WebServlet("/wish/manage")
public class WishBookManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String[] chkWbId = request.getParameterValues("chkWbId");
				
		// String[] -> int[] 타입으로 변경
		int[] wbId = Arrays.stream(chkWbId).mapToInt(Integer::parseInt).toArray();
		// System.out.println("Int" + Arrays.toString(wbId));
		
		int result = new WishBookService().insertWishBook(wbId);
		
		if(result > 0) {
			//request.getSession().setAttribute("msg", wbId.length + "권 입고 처리되었습니다.");
			response.sendRedirect(request.getContextPath() + "/wish/list");
		} else {
			System.out.println("실패");
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
