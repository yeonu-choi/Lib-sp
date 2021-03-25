<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.khlibrary.board.model.vo.QNA" %>
<% QNA q = (QNA)request.getAttribute("qna"); %>
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
    	
    	#wrap {
            box-sizing: border-box;
        	width: 80%;  
        	float:left;         
        }

        #wrap * {
        	
            box-sizing: border-box;
        }
             
        #content {
            width: 85%;
            margin-top: 5%;
            margin-bottom: 5%;
            padding-left: 80px;
        }


        #boardtitle {
            padding-top: 10px;
            font-size: 30px;
        }

        #boardtitle h3 {
            margin-bottom: 20px;
        }

        #boardtitle hr {           
            opacity: 0.5;        
        }

        #top_empty {
            height: 20px;
        }
        
        #content dt{
            width: 20%;
            height: 35px;
            margin-right: 10px;
            float: left;
            background: #F6F6F6 ;
            font-size: 20px;
            text-align: center;
            line-height: 36px;
        }

        #content dl {
            width: 100%;
            margin-top: 5px;
            margin-bottom: 5px;
            float: left;
        
        }
        
        dl[class="b_info"] dd {
        	height: 35px;
            width: 27%; 
            margin: 0px;       	
        	float: left;
        }
        
        dd[class="b_info"] {
            font-size: 20px;
            padding-left: 20px;
            padding-right: 20px;
            margin-right: 20px;
            line-height: 36px;
        }

        dd[class="b_info2"] {
            font-size: 20px;
            width: 95%;
            height: 100%;
            padding-left: 20px;         
            line-height: 36px;
        }
        
        dd[class="b_title"]{
            float : left; 
            font-size: 20px;
            width: 74%;
            height: 100%;
            padding-left: 20px; 
            margin: 0;                   
            line-height: 36px;
        }

        dd[class="b_content"] textarea {
            float : left; 
            font-size: 20px;
            width: 74%;
            height: 350px;
            max-height: 500px;
            padding-left: 20px; 
            line-height: 36px;
            text-align: left;
            resize: none;
        }
        
        #btn{
        	text-align: center;
        }
        
        #btn button{
        	width:80px;
        	height: 35px;
        	margin-top: 40px;
        	margin-right: 30px;
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
                <dl class="b_info">
                    <dt class="b_info">작성자</dt>
                    <dd class="b_info"><%= q.getUser_Id() %></dd>
                    <dt class="b_info2">작성일</dt>
                    <dd class="b_info2"><%= q.getC_Date() %></dd>                        
                </dl>
                <dl class="b_title">
                    <dt class="b_title">제 목</dt>
                    <dd class="b_title">
                       	<%= q.getQna_Qtitle() %>
                    </dd>
                </dl>
               
                <dl class="b_content">
                    <dt class="b_content">내 용</dt>
                    <dd class="b_content">
                        <textarea readonly><%= q.getQna_Qcontent() %></textarea>                                                                 
                    </dd>
                </dl>
                <div id="btn">
                 	<% if(loginId.equals(q.getUser_Id())) { %> 
                   <button type="submit" id="bupdate">수정</button>
                   <button type="submit" id="bdelete">삭제</button>
                   <% } else if(loginId.equals("admin")) { %>
                   	<button type="submit" id="banswer">답변하기</button>
                   	<button type="submit" id="bdelete">삭제</button>
                   <% } %>                 
                   <button type="button" id="btolist">목록</button>
                 </div>
            <form id="noForm" method="POST">
                 <input type="hidden" name="nno" value="<%= q.getQna_No() %>">
            </form>
        </div>
</div>

	<script>
		const updateBtn = document.getElementById('bupdate');
		updateBtn.addEventListener('click', function(){
			$("#noForm").attr("action", "<%= request.getContextPath() %>/qna/update");
			$("#nnoForm").submit();
		});
	</script>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>