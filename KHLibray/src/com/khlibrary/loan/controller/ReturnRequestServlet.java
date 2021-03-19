package com.khlibrary.loan.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.loan.model.service.LoanService;

/**
 * Servlet implementation class ReturnRequestServlet
 */
@WebServlet("/mylib/myreturn")
public class ReturnRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lidList = request.getParameter("lidList");
		int results[] = new int[10];
		String result = "";
		int result1 = 0;
		
		ArrayList<String> lidList1 = new ArrayList<>();
		String[] lidList2 = lidList.split("/");
		
		if(lidList2.length > 1) {
		for(String lid : lidList2) {
			if(!lidList1.contains(lid)) {
				lidList1.add(lid);
			}
		}
		int idx = 0;
		for(String lid : lidList1) {
			results[idx] = new LoanService().returnRequest(lid);
			if(results[idx] > 0) {
				result += lid + " 대출 건의 반납이 신청되었습니다.\\n";
			} else {
				result += lid + " 대출 건의 반납 신청에 실패하였습니다.\\n";
				}	
			idx ++;
		  	}
		} else {
			result1 = new LoanService().returnRequest(lidList);
			
			if(result1 > 0) {
				result += lidList + " 대출 건의 반납이 신청되었습니다.\\n";
			} else {
				result += lidList + " 대출 건의 반납 신청에 실패하였습니다.\\n";
			}	
		}
		
		request.getSession().setAttribute("msg", result);
		response.sendRedirect(request.getContextPath() + "/mylib/lblist");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
