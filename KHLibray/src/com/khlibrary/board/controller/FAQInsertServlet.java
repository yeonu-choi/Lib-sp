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
 * Servlet implementation class FAQInsertServlet
 */
@WebServlet("/faq/insert")
public class FAQInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String category = request.getParameter("category");
		
		FAQ faq = new FAQ(question, answer, category);
		
		int result = new FAQService().insertFAQ(faq);
		
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "FAQ 등록 완료!");
			response.sendRedirect(request.getContextPath() + "/faq/list");
		} else {
			request.setAttribute("msg", "FAQ 등록 실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
