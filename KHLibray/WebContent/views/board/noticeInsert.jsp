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
 
       #wrap {
       		width: 65%;
            height: 80%;
            margin-top: 60px;
            margin-bottom: 30px;
            float : left;          
        }


        #content {
            width: 100%;
            margin-left : 100px;
            margin-right: 200px;
            padding-right: 127px;
            overflow: visible;
            

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
            width: 90%;
            margin: 0;
            opacity: 0.5;        
        }

        #top_empty {
            display: inline-block;
            width: 100%;
            height: 50px;
        }

        #b_area {
            border-top: 2px solid #b8b8b8;
            padding-top : 30px;
      	}      
        
        dl[class="b_title"]{
        	width: 100%;
        }

			
        dt[class="b_title"]{
			text-align: center;
			line-height: 35px;
			width: 20%;
            height: 35px;
            float: left;
            background: #F6F6F6 ;
            font-size: 20px;
        }
        
        dd[class="b_title"]{
        	margin: 0;
        	padding-left: 10px;
        	float: left;
            width: 80%;
        }
        
        dd[class="b_title"] input {
            font-size: 20px;
            width: 100%;
        }

        dt[class="b_content"]{
        	text-align: center;
			line-height: 35px;
        	float:left;
            width: 20%;
            height: 35px;
            background: #F6F6F6 ;
            font-size: 20px;
        }



        dd[class="b_content"] {
        	magin: 0;
            padding: 5px 0 2px 10px;
            width: 80%;
            float: left;
        }
        


        dd[class="b_content"] textarea {
            font-size: 20px;
            width: 100%;
            height: 300px;
            resize: none;
        }

        #upload {
            margin-left: 230px;
            margin-top: 5px;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 5px;
            border: 1px solid #b8b8b8;
            width: 760px;
            border-radius: 5px;
        }

        #bsubmit {
            margin-left: 50%;
            margin-top: 30px;
            margin-right: 10px;
            height: 30px;
            width: 50px;
            
        }

        #bcancel {
            height: 30px;
            width: 50px;
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
                    <hr>                   
                </div>
                <div id="top_empty"></div>
                <form id="b_area" action="<%= request.getContextPath() %>/notice/insert" method="POST">
                    <dl class="b_title">
                        <dt class="b_title">제 목</dt>
                        <dd class="b_title"><input type="text" name="title" required></dd>
                    </dl>
                    <dl class="b_content">
                        <dt class="b_content">내 용</dt>
                        <dd class="b_content"><textarea name="content"></textarea></dd>
                    </dl>
                    <input type="file" id="upload">
                        <button type="submit" id="bsubmit">등록</button>
                        <button type="button" id="bcancel" onclick="javascript:history.back();">취소</button>
                </form>
            </div>
    </div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>