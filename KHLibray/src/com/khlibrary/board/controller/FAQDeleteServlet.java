package com.khlibrary.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.board.model.service.FAQService;
import com.khlibrary.board.model.vo.FAQ;

/**
 * Servlet implementation class FAQDeleteServlet
 */
@WebServlet("/faq/delete")
public class FAQDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String deltie = request.getParameter("deleteTitle");
		
		FAQ faq = new FAQ(deltie);
		
		int result = new FAQService().deleteFAQ(faq);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "FAQ 삭제가 완료 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/faq/list");
		} else {
			request.setAttribute("msg", "FAQ 삭제에 실패하였습니다.");
			request.getRequestDispatcher("/views/common.errorPage.jsp").forward(request, response);
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
