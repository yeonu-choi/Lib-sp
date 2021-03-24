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
 * Servlet implementation class pwdSearchResultServlet
 */
@WebServlet("/member/pwdSearchResult")
public class pwdSearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwdSearchResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
        String AuthenticationUser = request.getParameter("AuthenticationUser");
        if(!AuthenticationKey.equals(AuthenticationUser))
        {
            System.out.println("인증번호 일치하지 않음");
            request.setAttribute("msg", "인증번호가 일치하지 않습니다");
            request.getRequestDispatcher("/views/member/pwdSearchResult.jsp").forward(request, response);
            return;
	}
        String user_pwd = request.getParameter("new_pwd");
        String user_id = request.getParameter("user_id");
        System.out.println(user_id+"/"+ user_pwd);
        Member member = new Member();
	      member.setUser_id(user_id);
	      member.setUser_pwd(user_pwd);
	      
		Member pwdUpdate = new MemberService().pwdUpdate(user_id, user_pwd);
        System.out.println("가져온 값 : "+pwdUpdate);
	
       
        if(pwdUpdate !=null) {
        	request.getSession().setAttribute("msg","비밀번호가 성공적으로 변경되었습니다.");
			request.getRequestDispatcher("/views/member/loginForm.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			request.getRequestDispatcher("/views/member/pwdSearch.jsp").forward(request, response);

        
        
		}     
        
        
        
        
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
