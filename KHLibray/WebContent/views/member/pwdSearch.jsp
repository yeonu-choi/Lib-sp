<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    	 /********************************************************/
       	.outer{
            width: 65%;
            min-width : 850px;
            margin : auto;
            margin-bottom: 100px;
            margin-left : 25%
        }
    	 .inner {
            width: 95%;
            margin: auto;
			margin-top: 60px;
            padding: 40px;
            border : 1px rgb(219, 219, 219) solid;
        }
    	    	
    	h2{
    		font-weight: 600;
			font-size: 28px;
			padding: 90px 0px 5px 20px;
    	    	} 	
    	.pwdSearchTable {
    		margin-left: 130px;
    		border : 1px solid #aaaaaa;    	
    	}
    	
    	.btnArea {
    	    margin-top: 30px; 
    	
    		margin-left: 250px; 
    	}
    	
    	#inputId {
  			display: inline-block;
  			width:330px;
  			height:35px;
  			font-size:20px; 			
  			margin: 3px;
  			border : 1px solid #aaaaaa;
		}
    	
    	  button{
   	  		 width:80px;
      		 height:40px;
     		 color:white;
     		 background: #aaaaaa;
     		 border: #aaaaaa;
      		 border-radius:5px;  
   		}  
	
	    th {
   			border : 1px solid #aaaaaa;
   		   	 background: #d2d2d2;   		
   		}
   		td{
   			height:55px;
   			border : 1px solid #aaaaaa;
   		}
	
	
</style>
</head>
<body>
<%@ include file="../common/mainbar-basic.jsp" %>

<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">회원가입 및 로그인</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">비밀번호 찾기</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>도서관 안내</span>
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

	<div class="outer">
		 <h2>비밀번호 찾기</h2><hr>
		<div class="inner">
		 <form id="pwdSearch" action="<%= request.getContextPath() %>/member/pwdSearch"
            method="post">
		<div class="insertArea">
              
        <table class="pwdSearchTable">
            <tr>
                <th><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></th>
                <td><input type="text" id="inputId" name=user_id></td>					
            </tr>
            <tr>
                <th><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></th>
                <td><input type="text" id="inputId" name=user_name></td>					
            </tr>       
            <tr>
                <th><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></th>	
                <td><input type=email  id="inputId"name="email"></td>
            </tr>
           
		</table>
			<div class="btnArea">
				<button type="button">취소하기</button>
				<button type="submit">검색하기</button>
			</div>
		</div>
	</form>
	</div>
	</div>
 























<%@ include file="../common/footer.jsp" %>
</body>
</html>