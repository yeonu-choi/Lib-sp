package com.khlibrary.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khlibrary.member.model.service.MemberService;
import com.khlibrary.member.model.vo.Member;

/**
 * Servlet implementation class pwdSearchServlet
 */
@WebServlet("/member/pwdSearch")
public class pwdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String user_id = request.getParameter("user_id");
		String email = request.getParameter("email");
		
		Member member = new Member();
	      member.setUser_id(user_id);
	      member.setEmail(email);
		
	      Member pwdSearch = new MemberService().pwdSearch(member);
		
		
	      if(pwdSearch==null || !pwdSearch.getEmail().equals(email))
	        {
	            request.getSession().setAttribute("msg", "아이디나 이메일 정보가 맞지 않습니다.");
	            request.getRequestDispatcher("/views/member/pwdSearch.jsp").forward(request, response);
	            return;
	        }
	     
	                //mail server 설정
	                String host = "smtp.naver.com";
	                String user = ""; //자신의 네이버 계정
	                String password = "";//자신의 네이버 패스워드
	                
	                //메일 받을 주소
	                String to_email = pwdSearch.getEmail();
	                
	                //SMTP 서버 정보를 설정한다.
	                Properties props = new Properties();
	                props.put("mail.smtp.host", host);
	                props.put("mail.smtp.port", 465);
	                props.put("mail.smtp.auth", "true");
	                props.put("mail.smtp.ssl.enable", "true");
	                //인증 번호 생성기
	                StringBuffer temp =new StringBuffer();
	                Random rnd = new Random();
	                for(int i=0;i<10;i++)
	                {
	                    int rIndex = rnd.nextInt(3);
	                    switch (rIndex) {
	                    case 0:
	                        // a-z
	                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
	                        break;
	                    case 1:
	                        // A-Z
	                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
	                        break;
	                    case 2:
	                        // 0-9
	                        temp.append((rnd.nextInt(10)));
	                        break;
	                    }
	                }
	                String AuthenticationKey = temp.toString();
//	                System.out.println(AuthenticationKey);
	              

	                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication(user,password);
	                    }
	                });
	                //email 전송
	                try {
	                    MimeMessage msg = new MimeMessage(session);
	                    msg.setFrom(new InternetAddress(user, "KH Books"));
	                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
	                    
	                    //메일 제목
	                    msg.setSubject("안녕하세요 KH도서관 인증 메일입니다.");
	                    //메일 내용
	                    msg.setText("인증 번호는 :"+temp);
		              	                    
		                Transport.send(msg);
	                    System.out.println("이메일 전송");
		        
	                }catch (Exception e) {
	                    e.printStackTrace();// TODO: handle exception
	                }
	                HttpSession saveKey = request.getSession();
	                saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
	                //패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id	   
//	                HttpSession session = request.getSession();
//	                idSession.setAttribute("user_id", user_id);
	                request.getRequestDispatcher("/views/member/pwdSearchResult.jsp").forward(request, response);
	    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
