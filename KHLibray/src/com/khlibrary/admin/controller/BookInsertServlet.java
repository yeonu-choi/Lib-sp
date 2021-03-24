package com.khlibrary.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.khlibrary.search.model.service.BookService;
import com.khlibrary.search.model.vo.Book;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class BookInsertServlet
 */
@WebServlet("/admin/bookInsert")
public class BookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/"); 
			String savePath = root + "resources\\uploadFiles\\";
			
			MultipartRequest multiRequest = 
				new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
			long isbn = Long.parseLong(multiRequest.getParameter("isbn"));
			String call_num = multiRequest.getParameter("call_num");
			String bk_name = multiRequest.getParameter("bk_name");
			String writer = multiRequest.getParameter("writer");
			String publisher = multiRequest.getParameter("publisher");
			int issue_year = Integer.parseInt(multiRequest.getParameter("issue_year"));
			String imgName = multiRequest.getFilesystemName("imgname");
			String imgPath = "/resources/uploadFiles/";
			
			Book book = new Book();
			
			book.setIsbn(isbn);;
			book.setCallNum(call_num);
			book.setbName(bk_name);
			book.setbWriter(writer);
			book.setbPublisher(publisher);
			book.setIssueDate(issue_year);
			book.setImgName(imgName);
			book.setImgPath(imgPath);
			System.out.println("b : " + book);
			
			int result =  new BookService().insertBook(book);	
			
			if(result >0) {
				request.getSession().setAttribute("msg","도서가 성공적으로 등록되었습니다.");
				request.getRequestDispatcher("/views/admin/bookInsert.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "도서 등록에 실패했습니다.");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
