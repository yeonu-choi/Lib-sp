<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.board.model.vo.*"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String search = request.getParameter("search") != null ? request.getParameter("search") : "";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH도서관</title>
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
            margin-left: 0;
        }

        #sideMenu td {
            border: 1px solid rgb(201, 201, 201);
            cursor: pointer;
        }

        #sideMenu td:first-child {
            border-top: none;
        }

        #sideMenu td p {
            padding-top: 10px;
            font-size: 16px;
            font-weight: 600;
        }
        
        #subTitle {
            float: left;
            margin-left: auto;
            width: 248px;
            height: 80px;
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
            margin-top: 60px;
            margin-bottom: 30px;
            float : left;
        }

        #content {
            width: 100%;
        }

        #boardtitle {  
            font-size: 28px;
        }

        #boardtitle h3 {
        	margin-top: 30px;
            margin-bottom: 30px;
        }

        #boardtitle hr {
            float: left;
            width: 100%;
            margin: 0;
            opacity: 0.5;        
        }

        #top_empty {
            display: inline-block;
            width: 100%;
            height: 30px;
        }

        #search{
            position: relative;
            float : right;
            right: 120px;
            height: 30px;
            width: 240px;
            margin-bottom: 25px;
            border: 1px solid #b8b8b8;
            border-radius: 7px;
            padding: 3px 40px 3px 5px;
        }

        #search input[type="search"] {
            display: inline-block;
            line-height: 30px;
            width: 90%;
            border: 0;
        }

        #search button {
            border: 0px;
            position: absolute;
            display: inline-block;			
            height: 30px;
            width: 40px;
            top: 3px;
            right: 9px;
            border-radius: 7px;
        }

        #boardlist {
            width: 80%;
            border-top: 2px solid #3b414d; 
            border-bottom: 1px solid #b8b8b8; 
            border-collapse: collapse;
            margin: auto;
        }

        .b_num {
        	width: 10%;
        }

        .b_count {
        	width: 12%;
            
        }

        .b_num, .b_count, .b_date {
            text-align: center;
        }


        #t_h {

            border-bottom: 1px solid #b8b8b8; 
        }

        #wrap th, #wrap td {
            padding : 12px;
        }

        #wrap th {
            border: #b8b8b8 solid 1px;
            background: #fcfcfc;
        }
        
        #wrap th:first-child {
            border-left: none;
        }
        
        #wrap th:last-child {
            border-right: none;
        }
        
        #t_b .b_num,
        #t_b .b_date,
        #t_b .b_count {
        	border: #b8b8b8 solid 1px;
        }
        
        #t_b .b_title {
        	width: 55%;
        	margin-left: 30px;
        	padding-left: 30px;
        	border: #b8b8b8 solid 1px;
        }

        #wrap td:first-child {
            border-left: none;
        }
        
        #wrap td:last-child {
            border-right: none;
        }
        
        #paging {
            padding-top: 30px;
            text-align:center;
            
        }

        #paging button {
            height: 30px;
            width: 30px;
        }
        
        #writeb{
        	float:right;
        	margin-right: 130px;
        }
        
        #write{
        	width: 90px;
        	height: 30px;
        }

        #wrap a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@ include file="../common/mainbar-basic.jsp" %>
<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">열린공간</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">공지사항</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>열린공간</span>
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
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/views/board/newbooks.jsp">이달의신간</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
    <div id="wrap">
            <div id="content">
                <div id="boardtitle">
                    <h3>공지사항</h3>
                    <hr>
                </div>
                <div id="top_empty"></div>
                <fieldset id="search">
                	<form action="<%= request.getContextPath() %>/notice/search" method="get" onsubmit="return checkSearchBox();">
                    	<input type="search" id="search_box" name="search" placeholder="검색어를 입력하세요" value="<%=search%>">
                    	<button type="submit">검색</button>
                    </form>
                </fieldset>

                <table id="boardlist">
                    <thead id="t_h">
                        <tr>
                            <th class="b_num">번호</th>
                            <th class="b_title">제목</th>
                            <th class="b_date">작성일</th>
                            <th class="b_count">조회</th>
                        </tr>
                    </thead>
                    <tbody id="t_b">
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="4">조회 된 게시글이 없습니다.</td>
                    	</tr>                    
                    <% } else { %>
                    	<% for(Notice n : list) { %>
                        <tr>
                            <td class="b_num"><%= n.getnNo() %></td>
                            <td class="b_title"><%= n.getnTitle() %></td>
                            <td class="b_date"><%= n.getC_Date() %></td>
                            <td class="b_count"><%= n.getnCount() %></td>
                        </tr>
                        <% } %>
                     <% } %>
                    </tbody>
                </table>
                <div id="paging">
                    <button onclick="location.href='<%= request.getContextPath() %>/notice?currentPage=1'">&lt;&lt;</button>
                    <% if(pi.getCurrentPage() == 1) { %>
                    <button disabled>&lt;</button>
                    <% } else { %>
                    <button onclick="location.href='<%= request.getContextPath() %>/notice?currentPage=<%= pi.getCurrentPage() - 1%>'">&lt;</button>
                    <% } %>
 					<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
 						<%if(p == pi.getCurrentPage()) { %>
 						<button style="background:#7b767a; color:white;" disabled> <%= p %></button>
 						<% } else { %>
 						<button onclick="location.href='<%= request.getContextPath() %>/notice?currentPage=<%= p %>'"><%= p %></button>
 						<% } %>
 					<% } %>
 					<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
 					<button disabled>&gt;</button>
 					<% } else { %>
 					<button onclick="location.href='<%= request.getContextPath() %>/notice?currentPage=<%= pi.getCurrentPage() + 1 %>'">&gt;</button>
 					<% } %>
                    <button onclick="location.href='<%= request.getContextPath() %>/notice?currentPage=<%= pi.getMaxPage() %>'">&gt;&gt;</button>         
                </div>
                    <form id="writeb">
                    	<input id="write" type="button" value="글쓰기" onclick="location.href='noticeInsert.jsp'">
                    	<script>
                    		const write = document.getElementById('write');
                    		write.addEventListener('click', function(){
                    			location.href='<%= request.getContextPath() %>/views/board/noticeInsert.jsp';
                    		});
                    		
                    	</script>
                    </form> 
                    
                    <script>
                    	function checkSearchBox(){
                    		if($("#search_box").val() == ''){
                    			return false;
                    		}
                    		return true;
                    	}
                    </script>                                   
            </div>
    </div>
    <script>
    	$(function(){
    		$("#t_b td").mouseenter(function(){
    			$(this).parent().css({"background":"lightgray", "cursor" : "pointer"});
    		}).mouseout(function(){
    				$(this).parent().css("background", "white");
    			}).click(function(){
    				let nno = $(this).parent().children().eq(0).text();
    				location.href="<%= request.getContextPath() %>/notice/detail?nno=" + nno;
    			});
    		});
    </script>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>