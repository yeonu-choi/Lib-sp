package com.khlibrary.wishBook.controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khlibrary.wishBook.model.vo.MailAuth;

/**
 * Servlet implementation class WishBookMailServlet
 */
@WebServlet("/wish/mail")
public class WishBookMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishBookMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int[] wbId = (int[]) request.getSession().getAttribute("wbId");
		List<String> emails = (List<String>) request.getSession().getAttribute("wbEmail");
		
		String host = "smtp.gmail.com";

		// Property에 SMTP 서버 정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		 
		// SMTPAuthenticatior를 불러와 계정인증 
		Authenticator auth = new MailAuth();
		Session ses = Session.getInstance(props, auth);
		     
	    
		// Message 클래스 객체 사용하여 수신자, 제목, 내용 작성
	    MimeMessage msg = new MimeMessage(ses);
	    
	    try {
	    	msg.setFrom(new InternetAddress("admin@gmail.com"));
			
			InternetAddress[] to = new InternetAddress[emails.size()];
			
			for(int i = 0 ; i < emails.size(); i++) {
				to[i] = new InternetAddress(emails.get(i));
			}
			
			msg.setRecipients(Message.RecipientType.TO, to); 
	        
	        msg.setSubject("희망 도서 입고 완료되었습니다. ", "UTF-8");            
	        msg.setText("안녕하세요. KH도서관 입니다." + "\n" + "회원님이 신청하신 희망 도서가 입고 완료되었습니다." + "\n" + "3일내에 도서관에 방문하셔서 대출하시길 바랍니다.", "UTF-8");            
	        
	        Transport.send(msg);
	         
	        request.getSession().setAttribute("msg",  wbId.length + "권 입고 처리되었습니다. (메일 전송 완료)");
			response.sendRedirect(request.getContextPath() + "/wish/list");
	        
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (javax.mail.MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
