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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/member/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String user_id= request.getParameter("user_id");
		String user_pwd= request.getParameter("user_pwd");		
		
		Member loginUser = new MemberService().loginMember(new Member(user_id, user_pwd));
		
		if(loginUser != null) {		
			HttpSession session = request.getSession();							
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("login_id", user_id);
			response.sendRedirect(request.getContextPath());
						
		} else {		
			request.getSession().setAttribute("msg", "로그인에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/views/member/loginForm.jsp");
			view.forward(request, response);
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
