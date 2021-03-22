package com.khlibrary.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khlibrary.member.model.service.MemberService;
import com.khlibrary.member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/member/update")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				request.setCharacterEncoding("UTF-8");
				
				String user_name = request.getParameter("user_name");
				String birth_date = request.getParameter("birth_date");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				
				String[] addressArr = request.getParameterValues("address");
				
				String address = "";
				
				if(addressArr != null && !addressArr[0].equals("")) {
					address = String.join(",", addressArr);
				}
				
				String user_id = request.getParameter("user_id");
				
				Member m = new Member(user_id, user_name, birth_date, phone, email, address);
				
				Member updateMember = new MemberService().updateMember(m);
								
				if(updateMember != null) {

					HttpSession session = request.getSession();
	
					session.setAttribute("loginUser", updateMember);
					session.setAttribute("msg", "성공적으로 회원 정보를 수정했습니다.");
					response.sendRedirect(request.getContextPath());
				} else {
					// 수정 실패 ->에러페이지 포워딩
					request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
					// 두 줄을 한 줄로 줄인거다 
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
