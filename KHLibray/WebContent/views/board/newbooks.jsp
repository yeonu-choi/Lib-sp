<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.search.model.vo.*, java.util.Calendar" %>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
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
    	
    	#thismonth {
    		text-align: center;
    		margin-left: -30px;
    	}
    	
    	#line1 {
    		height: 330px;
    	}
    	
    	#line1 a{
    		width: 240px;		
    		float: left;
    		display: inline-block;;
    		margin: 0px;
    		text-decoration: none;
    		color: black;
    	}
    	
  	
    	#line2 a{
    		width: 240px;
    		float: left;
    		display: inline-block;;
    		margin: 0px;
    		text-decoration: none;
    		color: black;
    	}
    	
    	#thismonth img {
            width: 130px;
            height: 190px;
            display: inline-block;
        }
 
 		#wrap {
 			box-sizing: border-box;
 			float:left;
 			width: 80%;
 			margin-top: 40px;
 			padding: 50px 0 0 40px;
 		}
 		
 		#boardtitle {
 			width: 70%;
 			padding-bottom: 25px;
 			border-bottom: 2px solid rgba(0, 0, 0, 0.3) ;
 			
 		}
 		
 		#selectmonth {
 			width: 70%;
 			padding: 50px 0px 50px 10px;
 			
 		}
 		
		#thismonth {
			width: 70%;
		}
		
		#btns{
			margin: 0 0 50px 700px;			
		}
		
		#btns button{
			height: 35px;
			line-height: 10px;
			padding: 10px;
			margin: 10px;
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
        <div id="boardtitle">
            <h3>이달의 신간</h3>
        </div>
        <div id="boardcontent">
        	<div id="selectmonth">
					<h4><%= year %>년 <%= month %>월 신간</h4>               
            </div>
            <div id="thismonth">
            	<div id="line1">
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(0).getbName() %>" id="newbook1"><img src="<%= request.getContextPath() %>/<%= list.get(0).getImgPath()%>/<%=list.get(0).getImgName()%>"><pre><br><%= list.get(0).getbName() %></pre></a>
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(1).getbName() %>" id="newbook2"><img src="<%= request.getContextPath() %>/<%= list.get(1).getImgPath()%>/<%=list.get(1).getImgName()%>"><pre><br><%= list.get(1).getbName() %></pre></a>
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(2).getbName() %>" id="newbook3"><img src="<%= request.getContextPath() %>/<%= list.get(2).getImgPath()%>/<%=list.get(2).getImgName()%>"><pre><br><%= list.get(2).getbName() %></pre></a>
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(3).getbName() %>" id="newbook4"><img src="<%= request.getContextPath() %>/<%= list.get(3).getImgPath()%>/<%=list.get(3).getImgName()%>"><pre><br><%= list.get(3).getbName() %></pre></a>

            	</div>

            	<div id="line2">
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(4).getbName() %>" id="newbook5"><img src="<%= request.getContextPath() %>/<%= list.get(4).getImgPath()%>/<%=list.get(4).getImgName()%>"><pre><br><%= list.get(4).getbName() %></pre></a>
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(5).getbName() %>" id="newbook6"><img src="<%= request.getContextPath() %>/<%= list.get(5).getImgPath()%>/<%=list.get(5).getImgName()%>"><pre><br><%= list.get(5).getbName() %></pre></a>
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(6).getbName() %>" id="newbook7"><img src="<%= request.getContextPath() %>/<%= list.get(6).getImgPath()%>/<%=list.get(6).getImgName()%>"><pre><br><%= list.get(6).getbName() %></pre></a>
	                <a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= list.get(7).getbName() %>" id="newbook8"><img src="<%= request.getContextPath() %>/<%= list.get(7).getImgPath()%>/<%=list.get(7).getImgName()%>"><pre><br><%= list.get(7).getbName() %></pre></a>
             	</div>
             	<div id="btns">
                <button id="more" onclick="location.href='<%= request.getContextPath() %>/views/search/detailSearch.jsp'">더보기</button>
                </div>
            </div>
            
        </div>
    </div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>