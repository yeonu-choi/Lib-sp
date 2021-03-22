<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	
        div[id="wrap"] {
            width: 65%;
            height: 80%;
            margin-top: 60px;
            margin-bottom: 80px;
            float : left;
            
        }
               
        #content {
            width: 1073px;
            margin-right: 200px;
            padding-left: 80px;
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

        #boardtitle hr {
            float: left;
            width: 93%;
            margin: 0;
            opacity: 0.5;        
        }

        #top_empty {
            display: inline-block;
            width: 100%;
            height: 50px;
        }

        #b_area {
        	padding-top: 30px;
            border-top: 2px solid #b8b8b8;
        }
        
		#b_area dl {
		}
        
        #b_area dt{
        	width: 17%;
        	height: 37px;
        	margin-right: 13px;
            text-align: center;
			line-height: 36px;
			font-size: 20px;
			background: #F6F6F6;
			float: left;
        }

        dd[class="b_title"]{
        	width: 81%;
            padding: 0 0 2px 2px;
            float: left;
        }

        dd[class="b_content"] {
        	display: inline-block;
        	margin: 0;
            padding: 0px 0 2px 2px;
            width: 81%;
        }
        
        dd[class="b_title"] input {
        	margin: 0;
            font-size: 20px;
            width: 100%;
        }

        dd[class="b_content"] textarea {
            font-size: 20px;
            width: 100%;
            height: 300px;
            resize: none;
        }

        #upload {
            margin-left: 213px;
            margin-top: 5px;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 5px;
            border: 1px solid #b8b8b8;
            width: 770px;
            border-radius: 5px;
        }

        #bsubmit {
            margin-left: 53%;
            margin-top: 15px;
            margin-right: 20px;
            height: 30px;
            width: 50px;
            
        }

        #bcancel {
            height: 30px;
            width: 50px;
        }
        
        .b_category select{
        	width: 100px;
        	height: 30px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/mainbar-basic.jsp" %>
	<div class="submArea">
	    <div class="bcrumb">
	        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
	        <span><a id="mName" href="">열린 공간</a></span>&nbsp;&nbsp;&nbsp;
	        <span><a id="subName" href="">FAQ</a></span>
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
                    <h3>FAQ</h3>
                   	<hr>
                </div>
                <div id="top_empty"></div>
                <form id="b_area" action="<%= request.getContextPath() %>/faq/insert" method="POST">
                     <dl class="b_category">
                        <dt class="b_category"> 분 류</dt>
                        <dd class="b_category">
                        	<select name="category">
		                		<option>공통</option>
		                		<option>계정</option>
		                		<option>도서</option>
		                		<option>시설</option>               	
                	    	</select> 
                	    </dd>
                    </dl>
                	               	
                    <dl class="b_title">
                        <dt class="b_title"> 질 문</dt>
                        <dd class="b_title"><input type="text" name="question" required></dd>
                    </dl>
                    <dl class="b_content">
                        <dt class="b_content">답 변</dt>
                        <dd class="b_content"><textarea name="answer" required></textarea></dd>
                    </dl>
                        <button type="submit" id="bsubmit">등록</button>
                        <button type="button" id="bcancel" onclick="javascript:history.back();">취소</button>
                </form>
            </div>
    </div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>