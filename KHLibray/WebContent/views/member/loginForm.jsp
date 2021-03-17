<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.khlibrary.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<%if(session.getAttribute("msg") != null){ %>
<script>
	alert('<%= session.getAttribute("msg") %>');
</script>
<%
	session.removeAttribute("msg");
} %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
   <style>
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }
       
        .sidebar {
            display: block;
            margin-left: 0;
            margin-top: 0;
            float: left;
            width: 20%;
            height: 450px;
            overflow: hidden;
        }

        .bcrumb {
            display: block;
            width: 100%;
            height: 40px;
            float: left;
            position: absolute;
            background-color: rgb(99, 98, 98);
            overflow: hidden;
            padding-top : 7px;
        }

        .bcrumb span:first-child {
            margin-top: 4px;
            padding-left: 90px;
        }

        .bcrumb span:nth-child(2) {
            margin-top: 6px;
            padding-left: 30px;
        }

        .bcrumb span:last-child {
            margin-top: 6px;
            padding-left: 30px;
        }

        .bcrumb a {   
            text-align: center;
            text-decoration: none;
            color: white;
            font-size: 14px;
            cursor: pointer;
        }
        .sideMenu {
            display: block;
            width: 300px;
            margin-top: 0px;
            margin-left: 80px;
            overflow: hidden;
        }

        #sideMenu {
            width: 250px;
        }

        #sideMenu td {
            border: 1px solid rgb(201, 201, 201);
            cursor: pointer;
        }

        #sideMenu td:first-child {
            border-top: none;
        }

        #sideMenu td p {
            padding-top: 15px;
            font-size: 16px;
            font-weight: 600;
        }
        
        
        #subTitle {
            float: left;
            margin-left: auto;
            width: 250px;
            height: 180px;
            padding-top: 100px;
            text-align: center; 
            border-left: 1px solid rgb(201, 201, 201);
            border-right: 1px solid rgb(201, 201, 201);   
        }
    
        #subTitle span {
            text-align: center;
            padding: 20px;
            border-bottom: 2px solid black;
            font-size: 20px;
            font-weight: 600;
        }
        
        #sideMenu a {
       		text-decoration: none;
       		color: black;
    	}
    	
    
     .loginArea  {   
    		margin-left : 25%;
    		width : 65%;
      		height : 85%;  
   		}
      
      .login {
        	font-weight: 600;
			font-size: 28px;
			padding: 90px 0px 5px 20px;
		}	
   		
   .loginTable{  		     	  
          margin-top : 5%;
          margin-bottom : 20%;        
          padding :80px;
           width : 100%;                   
  		 }
  		 
   #user_id{
   			height: 40px;
   			width: 300px;
   			font-size:17px;			   
  		 }
  		 
   #user_pwd {
   			height: 40px;
   			width: 300px;
   			font-size:17px;
   			
  		 }
   
   #userInfo {
      margin-top :200px;
      margin-right : 10px;
  		 }
      
   button:hover {
      cursor:pointer;
   		}

   #loginBtn {
   	    
      width:100px;
      height:75px;
      color:white;
      background: #aaaaaa;
      border: #aaaaaa;
      border-radius:5px;
      font-size : 18px;
     
  		 }
   
   #memberJoinBtn, #id_searchBtn{
   	  width:92px;
      height:40px;
      color:white;
      background: #aaaaaa;
      border: #aaaaaa;
      border-radius:5px;
    
  		 }   
    #pwd_searchBtn{
   	  width:110px;
      height:40px;
      color:white;
      background: #aaaaaa;
      border: #aaaaaa;
      border-radius:5px;
     
  		 }   
   .loginCon {
   		padding-bottom : 50px;
   
   }
   
   .inner {
            width: 95%;
            margin: auto;
			margin-top: 80px;
				margin-bottom: 80px;		
            padding: 40px;
            border : 1px rgb(219, 219, 219) solid;
        }
  
   #td {
   		width : 200px;
   		margin-left: 600px;
   		
   }
   #btn {
   		width: 320px;
   		padding : 10px;
   }
   #span1 {
   		margin-left: 200px;
   }
   #btn3 {
   		padding-top : 7px;
   		
   }
   #td1 {
   	padding-top : 20px;
   }
</style>
</head>
<body>
<%@ include file="../common/mainbar-basic.jsp" %>

<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">회원가입  및 로그인</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">로그인</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>로그인</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                        <td align="center"><p class="subm1"><a href="<%=request.getContextPath() %>/views/member/loginForm.jsp">로그인</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%=request.getContextPath() %>/views/member/memberJoinForm.jsp">회원가입</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%=request.getContextPath()%>/views/member/idSearch.jsp">아이디 찾기</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%=request.getContextPath()%>/views/member/pwdSearch.jsp">비밀번호 찾기</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
     
      <div class="loginArea">       
      <% if((Member)session.getAttribute("loginUser") == null) { %>
       <div><p class="login">로그인</p><hr></div>
     
      <form id="loginForm" action="<%= request.getContextPath() %>/member/login" 
      method="post" onsubmit="return validate();">
       
         <table class="loginTable">
        
            <tr>
               <td id="td" align="right" >
                  <input type="text" name="user_id" id="user_id" placeholder="아이디를 입력">
                  
               </td> 
                 <td rowspan="2" id="btn">                  
                  <button id="loginBtn" type="submit">로그인</button>
               </td> 
                          
            </tr>                      
            <tr>
               <td align="right"><input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호를 입력"></td>
            </tr>
                  
            <tr>
               <td id= "btn3" align="right">
                  <button id="memberJoinBtn" type="button">회원가입</button>
                  <button id="id_searchBtn" type="button">아이디찾기</button>
                  <button id="pwd_searchBtn" type="button">비밀번호찾기</button>             
               </td>
            </tr>   
                 
            <tr>
         		<td id="td1" colspan="2"><span id="span1">※&nbsp;회원가입 아이디 비밀번호 분실등 관련문의: 1544-9970 </span></td> 
            </tr>            	            	
            <tr>
         		<td colspan="2"><span id="span1">※&nbsp;로그인 정보가 기억이 나지 않는 경우 아이디 찾기 또는</span></td>         		 
             </tr>	
             <tr>
         		<td colspan="2"><span id="span1">&nbsp; 비밀번호 찾기를 통해 확인 가능합니다.</span></td>         		 
             </tr>	
            
         </table>
      </form>
      
      <script>
         // 1_2. validate() 작성 --> Jquery
         function validate() {
            if ($("#user_id").val().trim().length == 0) {
               alert("아이디를 입력하세요");
               $("#user_id").focus();
               return false;
            }
            if ($("#user_pwd").val().trim().length == 0) {
               alert("비밀번호를 입력하세요");
               $("#user_pwd").focus();
               return false;
            }
            return true;
         }
         
         // 회원가입 버튼에 회원가입 창으로 이동하는 이벤트 설정
         const memberJoinBtn = document.getElementById("memberJoinBtn");
         memberJoinBtn.addEventListener("click", function(){
            location.href='<%= request.getContextPath()%>/views/member/memberJoinForm.jsp';
         });
         
         const id_searchBtn = document.getElementById("id_searchBtn");
         id_searchBtn.addEventListener("click", function(){
            location.href='<%= request.getContextPath()%>/views/member/idSearch.jsp';
         });
         
         const pwd_searchBtn = document.getElementById("pwd_searchBtn");
         pwd_searchBtn.addEventListener("click", function(){
            location.href='<%= request.getContextPath()%>/views/member/pwdSearch.jsp';
         });
              
      </script>
   <%} else { %>
      <div class="inner">
      <div id="userInfo">
      
         <table>
          	
            <tr>
               <td>
                  <button id="myPageBtn">정보수정</button>
                  <button id="logoutBtn">로그아웃</button>
               </td>
            </tr>
         </table>
      </div>
      </div>
      <script>
         // 2_2. 로그아웃 작성하기
         const logoutBtn = document.getElementById("logoutBtn");
         logoutBtn.addEventListener("click", function(){
            location.href='<%= request.getContextPath()%>/member/logout';
         });
         
         // 4.정보수정
         const myPageBtn = document.getElementById("myPageBtn");
         myPageBtn.addEventListener("click", function(){
             location.href='<%= request.getContextPath()%>/views/member/myPage.jsp';
          });
         
      </script>
    
           <% } %>
     </div>
  
<%@ include file="../common/footer.jsp" %>   
</body>
</html>