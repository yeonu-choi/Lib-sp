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
        
        #b_area dt{
            width: 20%;
            height: 35px;
            margin-right: 10px;
            float: left;
            background: #F6F6F6 ;
            font-size: 20px;
            text-align: center;
            line-height: 36px;
        }

        #b_area dl {
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

        #down1 {
            text-decoration: none;
            display: inline-block;
            margin-left: 22%;
            margin-top: 5px;
            padding: 5px;
            border: 1px solid #b8b8b8;
            border-radius: 5px;
        }

        #down2 {
            text-decoration: none;
            display: inline-block;
            margin-left: 2%;
            margin-top: 5px;
            padding: 5px;
            border: 1px solid #b8b8b8;
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
                <h3>Q & A</h3>
                <hr>
            </div>
            <div id="top_empty"></div>
            <form id="b_area">
                <dl class="b_info">
                    <dt class="b_info">분 류</dt>
                    <dd class="b_info">공 통</dd>
                    <dt class="b_info2">작성자</dt>
                    <dd class="b_info2">홍길동</dd>                        
                </dl>
                <dl class="b_title">
                    <dt class="b_title">제 목</dt>
                    <dd class="b_title">
                        질문 질문 질문 질문
                    </dd>
                </dl>
                <dl class="b_content">
                    <dt class="b_content">내 용</dt>
                    <dd class="b_content">
                        <textarea readonly>내용 내용 내용</textarea>  
                                        
                        
                    </dd>
                </dl>
                <a href="" id="down1">파일다운로드1</a><a href="" id="down2">파일다운로드2</a><br>


                    <button type="submit" id="bsubmit">등록</button>
                    <button type="button" id="bcancel">취소</button>


            </form>
        </div>
</div>




    <%@ include file="../common/footer.jsp" %>

</body>
</html>