package com.khlibrary.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.member.model.service.MemberService;

/**
 * Servlet implementation class ChangeGradeServlet
 */
@WebServlet("/admin/grade")
public class ChangeGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String idList = request.getParameter("idList");
		String gList = request.getParameter("gradeList");
		String newgList = request.getParameter("newGradeList");
		int results[] = new int[10];
		String result = "";
		
		String[] idList1 = idList.split("/");
		String[] gList1 = gList.split("/");
		String[] newgList1 = newgList.split("/");
		
		for(int i = 0 ; i<idList1.length; i++) {		
			if(!(gList1[i].equals(newgList1[i]))) {
				results[i] = new MemberService().changeGrade(idList1[i], newgList1[i]);	
				
				if(results[i] > 0) {
					result += idList1[i] + "의 등급 변경에 성공하였습니다.\\n";
				} else {
					result += idList1[i] + "의 등급 변경에 실패하였습니다.\\n";
				}	
			}
		}			
			request.getSession().setAttribute("msg", result);
			response.sendRedirect(request.getContextPath() + "/admin/manage");
		} 


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
