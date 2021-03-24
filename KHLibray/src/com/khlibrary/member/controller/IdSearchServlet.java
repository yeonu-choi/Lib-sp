package com.khlibrary.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khlibrary.member.model.service.MemberService;
import com.khlibrary.member.model.vo.Member;

/**
 * Servlet implementation class IdSerachServlet
 */
@WebServlet("/member/idSearch")
public class IdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
			
		Member member = new Member();
	      member.setUser_name(user_name);
	      member.setEmail(email);

		Member idSearch = new MemberService().idSearch(member);
		if(idSearch != null) {		
			HttpSession session = request.getSession();							
			session.setAttribute("idSear", idSearch);								
			request.getRequestDispatcher("/views/member/idSearchResult.jsp").forward(request, response);
		
		} else {		
			request.getSession().setAttribute("msg", "아이디찾기에 실패했습니다. 다시 한 번 확인하세요");
			request.getRequestDispatcher("/views/member/idSearch.jsp").forward(request, response);

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
