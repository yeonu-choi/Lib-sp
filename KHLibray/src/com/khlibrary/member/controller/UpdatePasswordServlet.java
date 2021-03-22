package com.khlibrary.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.member.model.service.MemberService;
import com.khlibrary.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePasswordServlet
 */
@WebServlet("/member/updatePwd")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 현재 비밀번호 
				String user_pwd = request.getParameter("user_pwd");	
				String new_pwd = request.getParameter("new_pwd");			
				String user_id = ((Member)request.getSession().getAttribute("loginUser")).getUser_id();
				
				Member updateMember = new MemberService().updatePwd(user_id, user_pwd, new_pwd);
				
				if(updateMember !=null) {
					request.setAttribute("result", "success");
					request.getSession().setAttribute("loginUser", updateMember);
				} else {
					request.setAttribute("result", "fail");
				}
				RequestDispatcher view = request.getRequestDispatcher("/views/myLib/pwdUpdateForm.jsp");
				view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
