<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.khlibrary.board.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH도서관</title>
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
    	       
        #wrap {
       		width: 65%;
            height: 80%;
            margin-top: 60px;
            margin-bottom: 30px;
            float : left;          
        }
       
        #content {
            width: 100%;
            margin-right: 200px;
            padding-left: 80px;
            padding-right: 127px;
            display: inline-block;
        }


        #boardtitle {
            
            width: 1150px;
            font-size: 30px;
            margin-top: 40px;
        }

        #boardtitle h3 {
            margin-bottom: 15px;
        }

        hr {
            float: left;
            width: 93%;
            margin: 0;
            opacity: 0.5;        
        }

        #top_empty {
            display: inline-block;
            width: 800px;
            height: 50px;
        }

        #top_info {
            border-top: solid 1px #b8b8b8;
            width: 100%;
          
        }
        
        #top_info dl {
            border-bottom: solid 1px #b8b8b8;
            margin: 0px;
            height: 44px;
			overflow: hidden;
           
        }
              
        dl[class="info_2"] {
        	margin-top: -5px;
        }
        
        #top_info dt {
        	float: left;
        	width: 180px;
            height: 42px;
            font-size: 18px;
            background: #F6F6F6;
            text-align: center;
			line-height: 43px;       
        }
              
        dd[class="info_1"] {
        	float: left;
            margin: 0;        
            font-size: 20px;
            padding:  8px 0 0px 20px;
        }

        dd[class="info_2"]{
            margin: 0;
            float: left;
            font-size: 20px;
            padding: 7px 20px 0px 20px;

        }

        dd[class="info_2_1"]{
            margin: 0;
            float: left;
            font-size: 20px;
            padding: 7px 30px 0px 30px;

        }
        
         dd[class="info_2_2"]{
            margin: 0;
            float: left;
            font-size: 20px;
            padding: 7px 30px 0px 30px;

        }

        #main_content {
            padding: 30px;
            min-height: 200px;
            border-bottom: solid 1px #b8b8b8;
        }
        #tolist {
            padding: 40px;
        }

        #tolist button {
            height: 30px;
            margin-right: 20px;
        }
        
        #tolist button[id="modify"] {
           margin-left: 360px;        
        }
    </style>
</head>
<body>

	<%@ include file="../common/mainbar-basic.jsp" %>
	<div class="submArea">
    	<div class="bcrumb">
        	<span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        	<span><a id="mName" href="">열린 공간</a></span>&nbsp;&nbsp;&nbsp;
        	<span><a id="subName" href="">공지사항</a></span>
    	</div>
    	<div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>열린 공간</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                        <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/notice">공지사항</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/views/board/faq.jsp">FAQ</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/views/board/qna.jsp">Q&A</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/newbooks">이달의신간</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
    <div id="wrap">
            <div id="content">
                <div id="boardtitle">
                    <h3>공지사항</h3>
                   <div><hr></div>
                </div>
                <div id="top_empty"></div>
                <div id="top_info">
                    <dl class="info_1">
                        <dt class="info_1">제 목</dt>
                        <dd class="info_1"><%= n.getnTitle() %></dd>
                    </dl>
                    <dl class="info_2">
                        <dt class="info_2">작성일</dt>
                        <dd class="info_2"><%= n.getC_Date() %></dd>
                        <dt class="info_2_1">조회수</dt>
                        <dd class="info_2_1"><%= n.getnCount() %></dd>
                    </dl>
                </div>
                <div id="main_content"><%= n.getnContent() %></div>
     
                <div id="tolist">
                	<% if(loginId != null && loginId.equals("admin")) { %>
                    <button id="modify">수정하기</button>
                    <% } %>
                    <button id="list_b" onclick="location.href='<%= request.getContextPath()%>/notice'">목록으로</button>
                    <% if(loginId != null && loginId.equals("admin")) { %>
                    <button id="delete">삭제하기</button>
                    <% } %>
                    <form id="nnoForm" method="POST">
                    	<input type="hidden" name="nno" value="<%= n.getnNo() %>">
                    </form>
                    
                    
                    <script>
                    	/* 수정 버튼 클릭 시 */
                    	const updateBtn = document.getElementById('modify');
                    	updateBtn.addEventListener('click', function(){
                    		$("#nnoForm").attr("action", "<%= request.getContextPath() %>/notice/update");
                    		$("#nnoForm").submit();
                    	});
                    	
                    	/* 삭제 버튼 클릭 시 */
                    	const deleteBtn = document.getElementById('delete');
                    	deleteBtn.addEventListener('click', function(){
                    		$("#nnoForm").attr("action", "<%= request.getContextPath() %>/notice/delete");
                    		$("#nnoForm").submit();
                    	});
                    </script>
                    
                </div>
            </div>
    </div>   
 
 
 
 
<%@ include file="../common/footer.jsp" %>
</body>
</html>