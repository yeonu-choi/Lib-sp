package com.khlibrary.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.member.model.service.MemberService;
import com.khlibrary.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/member/insert")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				request.setCharacterEncoding("UTF-8");				
			
				String user_id = request.getParameter("user_id");
				String user_pwd = request.getParameter("user_pwd");
				String user_name = request.getParameter("user_name");
				String birth_date = request.getParameter("birth_date");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				
				String[] addressArr = request.getParameterValues("address");

				String address="";
						
				if(addressArr != null && !addressArr[0].equals(""))
					address = String.join(",", addressArr);
		
				Member m = new Member(user_id, user_pwd, user_name, birth_date , phone, email, address);			
				int result = new MemberService().insertMember(m);				
				if(result > 0) {
					
				request.getSession().setAttribute("msg", "회원가입이 완료되었습니다. 로그인해주세요.");
										
				response.sendRedirect(request.getContextPath());
				} else {
					request.setAttribute("msg", "회원가입에 실패했습니다.");
					RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
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
