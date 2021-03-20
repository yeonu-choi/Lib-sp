package com.khlibrary.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.loan.model.service.LoanService;
import com.khlibrary.member.model.service.MemberService;

/**
 * Servlet implementation class UserLeaveServlet
 */
@WebServlet("/mylib/leave")
public class UserLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLeaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String user_id = (String)request.getSession().getAttribute("login_id");
		String user_pwd = request.getParameter("pchk");
		
		int lCount = new LoanService().onLoanCount(user_id);
		
		if(lCount > 0) {
			request.setAttribute("error", "대출 중인 책이 있습니다. \\n반납을 먼저 진행해주세요.");
			request.getRequestDispatcher("/views/myLib/userleave.jsp").forward(request, response);
		} else {
			
			int result = new MemberService().deleteMember(user_id, user_pwd);
			
			if(result > 0) {
				request.getSession().invalidate();
				request.getSession().setAttribute("msg", "회원 탈퇴가 완료되었습니다.");
				response.sendRedirect(request.getContextPath());
			} else {
				request.setAttribute("error", "회원 탈퇴에 실패하였습니다.");
				request.getRequestDispatcher("/views/myLib/userleave.jsp").forward(request, response);
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
