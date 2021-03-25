<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat, java.util.Date"%>
    
<% 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();	
	String today = sdf.format(date);
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
        	width: 90%;
        }
             
        #content {
            width: 70%;
            margin-top: 50px;
            margin-bottom: 80px;
            margin-right: 100px;
            padding-left: 80px;
            display: inline-block;
        }


        #boardtitle {
            
            width: 100%;
            font-size: 30px;
            margin-top: 40px;
        }

        #boardtitle h3 {
            margin-bottom: 25px;
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


        #b_area dl{
        	margin: 0;
        }
        
        dt[class="b_title"],
        dt[class="b_content"] {
        	width: 15%;
            height: 35px;
            margin-right: 10px;
            float: left;
            background: #F6F6F6;
            font-size: 20px;
            text-align: center;
            line-height: 36px;
        }
        
        
       
        
        dl[class="b_info"] dt {
        	width: 80px;
        	height: 35px;
        	margin-right: 10px;
        	float: left;
        	background: #F6F6F6;
        	font-size: 15px;
        	text-align: center;
        	line-height: 36px;
        }
        
        dl[class="b_info"] dd {
        	width: 250px;
        	height: 35px;        	
        	float: left;
        }
        
        #scrtdd, #scrtdd2 {
        	width: 50px;
        }
        
       
        
        #scrtN, #scrtY {
      		zoom: 1.7;
        	margin-top: 4px;
        	margin-left: 7px;
        }
        
        dd[class="b_info"] input {
           	font-size: 15px;
            width: 95%;
            height: 100%;
            padding-left: 20px;
            background: #F6F6F6;
            border: none;
            line-height: 36px;
        }

        dd[class="b_info2"] input {
            font-size: 15px;
            width: 95%;
            height: 100%;
            padding-left: 20px;
            background: #F6F6F6;
            border: none;
            line-height: 36px;
        }
        
        dl[class="b_title"] {
            margin: 0;
            height: 8%;
        }

        dl[class="b_content"] {
            margin: 0;

        }
        
        dd[class="b_title"]{
			float : left;
            width: 74%;
        }
        
        dd[class="b_title"] input {
        	width: 100%;
            font-size: 20px;
        }

        dd[class="b_content"] {
        	float : left;
            width: 74%;
        }

        dd[class="b_content"] textarea {
            font-size: 20px;
            width: 100%;
            height: 300px;
            padding: 0;
            resize: none;
        }

        #upload {
            margin-left: 21%;
            margin-top: 5px;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 5px;
            border: 1px solid #b8b8b8;
            width: 74%;
            border-radius: 5px;
        }

        #bsubmit {
            margin-left: 50%;
            margin-top: 20px;
            margin-right: 15px;
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
        <span><a id="mName" href="">열린공간</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">Q&A</a></span>
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
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/faq/list">FAQ</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/qna/list">Q&A</a></p></td>
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
                    <h3>Q & A</h3>
                    <hr>
                </div>
                <div id="top_empty"></div>
                <form id="b_area" action="<%= request.getContextPath() %>/qna/insert" method="POST">
                    <dl class="b_info">
                        <dt class="b_info">작성자</dt>
                        <dd class="b_info">
                           <input type="text" name="name" value="<%= loginId %>" readonly>
                        </dd>
                        <dt class="b_info2">작성일</dt>
                        <dd class="b_info2"><input type="text" value="<%= today %>" disabled></dd>
                        <dt id="scrtdtN">공개</dt>
                        <dd id="scrtdd">
                        <input id="scrtN" type="radio" name="secret" value="N" required>
                        </dd> 
                         <dt id="scrtdtY">비공개</dt>
                         <dd id="scrtdd2">
                        <input id="scrtY" type="radio" name="secret" value="Y">
                        </dd>                      
                    </dl>
                    <br><br>
                    <dl class="b_title">
                        <dt class="b_title">제 목</dt>
                        <dd class="b_title"><input type="text" name="title"></dd>
                    </dl>
                    <dl class="b_content">
                        <dt class="b_content">내 용</dt>
                        <dd class="b_content"><textarea name="content"></textarea></dd>
                    </dl>
                        <button type="submit" id="bsubmit">등록</button>
                        <button type="button" id="bcancel" onclick="javascript:history.back();">취소</button>
                </form>
            </div>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>