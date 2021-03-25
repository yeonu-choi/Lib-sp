package com.khlibrary.board.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.board.model.service.QNAService;
import com.khlibrary.board.model.vo.QNA;

/**
 * Servlet implementation class QNADetailServlet
 */
@WebServlet("/qna/detail")
public class QNADetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNADetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qna_No = Integer.parseInt(request.getParameter("qna_No"));
		
		QNA qna = new QNAService().selectQNA(qna_No);
		
		String page = "";
		
		if(qna != null) {
			request.setAttribute("qna", qna);
			page = "/views/board/qnadetail.jsp";			
		} else {
			request.setAttribute("msg", "해당 게시글을 조회 할 수 없습니다.");
			page = "/views/common/errorPage.jsp";
		}
				
		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
