package com.khlibrary.wishBook.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.member.model.vo.Member;
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
		
		int[] wbId = Arrays.stream(chkWbId).mapToInt(Integer::parseInt).toArray();
		
		List<String> wbEmail = new WishBookService().wishBookEmail(wbId);	// 해당 회원 이메일 알아오기
		
		int result = new WishBookService().insertWishBook(wbId);
		
		
		
		if(result > 0) {
			request.getSession().setAttribute("wbId", wbId);
			request.getSession().setAttribute("wbEmail", wbEmail);
			//request.getSession().setAttribute("msg", wbId.length + "권 입고 처리되었습니다.");
			response.sendRedirect(request.getContextPath() + "/wish/mail");	// 이메일 보내기로 바로 이동
		} else {
			request.getSession().setAttribute("msg", "입고 처리에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/wish/list");
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
