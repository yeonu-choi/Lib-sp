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
		
		Cookie[] cookies = request.getCookies();
		
		QNA qna = null;
		
		boolean flagQList = false;
		boolean flagQid = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("qList")) {
					flagQList = true;
					
					String qList = URLDecoder.decode(c.getValue(), "UTF-8");
					
					String[] list = qList.split(",");
					for(String st : list) {
						if(st.equals(String.valueOf(qna_No))) {
							flagQid = true;
							break;
						}
					}
					
					if(!flagQid) {
						c.setValue(URLEncoder.encode(qList + "," + qna_No, "UTF-8"));
						response.addCookie(c);
						
					}
				}
			}
			
			
			if(!flagQList) {
				Cookie c1 = new Cookie("qList", URLEncoder.encode(String.valueOf(qna_No), "UTF-8"));
				response.addCookie(c1);
				qna = new QNAService().selectQNA(qna_No);
			} else if(!flagQid) {
				qna = new QNAService().selectQNA(qna_No);
			} else {
				qna = new QNAservice().selectQNANoCnt(qna_No);
			}
			
			
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
