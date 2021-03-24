package com.khlibrary.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.board.model.service.QNAService;
import com.khlibrary.board.model.vo.QNA;

/**
 * Servlet implementation class QNAInsertServlet
 */
@WebServlet("/qna/insert")
public class QNAInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		String secret = request.getParameter("secret");
		QNA q = new QNA(title, content, secret, name);
		
		int result = new QNAService().insertQNA(q);
		
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "게시글이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/qna/list");
		} else {
			request.setAttribute("msg", "게시글 작성에 실패했습니다.");
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
