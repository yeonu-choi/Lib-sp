<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.khlibrary.wishBook.model.vo.*"%>
<%
	ArrayList<WishBook> list = (ArrayList<WishBook>)request.getAttribute("list");
	
	String flag = "disabled";
	
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    
    <style>
    	/* 사이드바 부분 */
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
        
        
        
		/* 전체 영역 div */
        .outer{
            width: 65%;
            min-width : 850px;
            margin : auto;
            margin-bottom: 100px;
            margin-left : 25%
        }
	
		.title {
        	font-weight: 600;
			font-size: 28px;
			padding: 90px 0px 5px 20px;
		}
		
        /* select, table, button 영역 div */
        .inner{
        	width:90%;
        	margin: auto;
        	margin-top: 45px;
            text-align: center;
        }
        
        /* 선택 영역 */
        .selectArea{
        	width : 100%;
        	text-align : right;
        }
        
        .selectArea button{
            height: 30px;
            text-align: center;
            margin: 0px 10px 5px 5px;
            border: rgb(216, 215, 215) 1px solid;
            border-radius: 5px;
        }

        /* table div */
        .tableArea {
            width: 100%;
            height:100%;
            max-height: 400px;
            /* border-top: 1px rgb(204, 199, 199) solid;   좀 더 진함... */
            border-top: 1px rgb(138, 137, 137) solid;
            border-bottom: 1px rgb(226, 223, 223) solid;
            margin: auto;
            overflow: auto; /* 스크롤 */
            /* overflow-x: hidden;
            box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 4px 0px; 이런거 추가해보기*/
        }

        /* table */
        .tableArea table {
            width: 100%;
            border-collapse: collapse;
        }  

        .tableArea th {
            height: 35px;
            background-color: rgb(236, 236, 236);
            position: sticky;
            top : 0;
            /* border: 1px rgb(226, 223, 223) solid; */

        }

        .tableArea td {
            height: 22px;
            font-size : 14px;
            border-top: 1px rgb(236, 236, 236) solid;
            padding: 7px;
        }


        .btnArea button {
        	width: 100px;
            height: 30px;
            text-align: center;
            margin: 40px 10px 0px 10px;
            border: rgb(216, 215, 215) 1px solid;
            border-radius: 5px;
        }
        
    </style>
    <script>
         function ShowSub(subNum, e){
            $("#top-sub").slideDown(300);
            $("#top-sub ul").hide(0);
            $(".sub"+subNum).show(0);	
        }

        function HideSub(){
            $("#top-sub").slideUp(300);
        }
    </script>
</head>
<body>
<%@include file="../common/mainbar-basic.jsp" %>
	
	<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">관리자</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">희망 도서 확인</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>관리자</span>
                </div>
				<table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                       <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/views/admin/bookInsert.jsp">도서 등록</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/admin/manage">회원 관리</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/admin/rblist">반납 처리</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/wish/list">희망 도서 확인</a></p></td>
                    </tr>
                </table>
            </div>
    	</div>
	</div>

	
	<div class="outer">
        <div><p class="title">희망 도서 확인</p><hr></div>
        <div class="inner">
        
       		<form action="<%= request.getContextPath() %>/wish/select" method="get">
        		<div class="selectArea">
            	<select name ="select">
            		<option value="전체">전체</option>
            		<option value="입고중">입고중</option>
            		<option value="입고완료">입고완료</option>
            	</select>
            	<button type="submit">조회</button>
            	</div>
        	</form>
        
            <form action="<%= request.getContextPath() %>/wish/manage" method="POST">
                <div class="tableArea">
                    <table>
                        <thead>
                            <tr>
                                <th><i class="bi bi-check"></i></th>
                                <th>No</th>
                                <th>회원 ID</th>
                                <th>희망 도서명</th>
                                <th>저자</th>
                                <th>발행처</th>
                                <th>발행연도</th>
                                <th>신청일</th>
                                <th>상태</th>
                                <th>회원정보</th>
                            </tr>
                        </thead>

                        <tbody>
                        <% for(WishBook wb : list) {%>
                        <tr>
                        	
                            <td><input type="checkbox" value="<%= wb.getWbId() %>" name="chkWbId" 
                            	<% if (!wb.getStatus().equals("입고중")) { %>
                            		<%= flag %> 
								<% } %>></td>
                            <td><%= wb.getWbId() %></td>
                            <td><%= wb.getUserId() %></td>
                            <td><%= wb.getWbName() %></td>
                            <td><%= wb.getWbWriter() %></td>
                            <td><%= wb.getWbPublisher() %></td>
                            <td><%= wb.getIssueYear() %></td>
                            <td><%= wb.getRequestDate() %></td>
                            <td><%= wb.getStatus() %></td>
                            <td><% if(wb.getPhone() != null && wb.getEmail() != null) { %>
                            	연락처 : <%= wb.getPhone() %><br> 
                            	이메일 : <%= wb.getEmail() %>
                            <% } else if(wb.getPhone() != null) {%>
                            	연락처 : <%= wb.getPhone() %>
                            <% } else if(wb.getEmail() != null) {%>
                            	이메일 : <%= wb.getEmail() %>
                            <% } %>
                            </td>
                        </tr>
						<% } %>
                        </tbody>
                    </table>
                </div>

                <div class="btnArea">
                    <button type="submit">입고 완료</button>
                    <button type="button" onclick="location.reload() ">선택 취소</button>
                </div>

            </form>
        </div>
    </div>
    
    
	<%@ include file="../common/footer.jsp" %>

</body>
</html>