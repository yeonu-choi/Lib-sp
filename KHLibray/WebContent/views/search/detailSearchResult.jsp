<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.search.model.vo.*"%>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String bName = (String)request.getAttribute("bName") != null ? request.getParameter("bName") : "";
	String bWriter = (String)request.getAttribute("bWriter") != null ? request.getParameter("bWriter") : "";
	String bPublisher = (String)request.getAttribute("bPublisher") != null ? request.getParameter("bWriter") : "";
	String isbn = request.getAttribute("isbn") != null ? request.getParameter("isbn") : "";
	String tDate = request.getAttribute("tDate") != null ? request.getParameter("tDate") : "";
	String fDate = request.getAttribute("fDate") != null ? request.getParameter("fDate") : "";	

//int tDate = request.getAttribute("tDate") != "" ? Integer.parseInt(request.getParameter("tDate")) : "";
//int fDate = request.getAttribute("fDate") != "" ? Integer.parseInt(request.getParameter("fDate")) : "";
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
    	/* 사이드바 부분*/
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
    
    
    	/* 본문 */
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

        .searchArea {
            width: 90%;
            height: 135px;
            margin: auto;
            margin-top: 60px;
            padding: 50px;
            position: relative;
            border : 1px rgb(219, 219, 219) solid;
            border-top: 2px rgb(138, 137, 137) solid;
        }

        .selectArea {
            float: left;
            width : 10%;
            margin-left: 2%;
        }

        .textArea{
            float: left;
            width: 75%;
        }

        .btnArea { 
            float: right;
            width: 10%;
            margin-right: 3%;
        }

        #searchSelect, #search, #searchBtn {
        	width : 100%;
            height: 30px;
            border : 1px rgb(207, 206, 206) solid;
            font-size: 16px;
        }

        #search {
            padding-left: 5px;
        }


        .listArea {
            width: 86%;
            font-size : 15px;
            margin: auto;
            padding: 10px 10px 0px 10px;
            border-bottom: 1px rgb(194, 192, 192) solid;
        }

        .resultArea {
        	width: 80%;
            margin: auto;
        }

        .resultBook {
            position: relative;
            display: inline-block;
            width: 100%;
            height: 170px;
            border-bottom: 1px rgb(194, 192, 192) solid;
            padding: 5px;
        }


        .bookImg {
        	width : 20%;
            position: absolute;
            left : 40px;
        }

        .bookImg img {
            height : 150px;
        }

        .book {
            width : 70%;
            height: 130px;
            font-size : 16px;
            padding : 7px;
            position: absolute;
            left : 190px;
        }

        .book div{
            margin : 10px;
        }
        
        .chk {
        	width : 10%;
            position: absolute;
            left : 90%;
            top : 65px;
            text-align: center;
        }

        input[type=checkbox] {
            width: 15px;
            height: 15px;
        }


		.pageArea,
        .loansArea {
            text-align: center;
            margin: 20px;
            
        }

        .pageArea a {
            margin: 10px 3px;
            padding : 5px 10px;
            text-decoration: none;  /* a태그 밑줄 없애기 */
            color :rgb(110, 110, 110);
            border: rgb(216, 215, 215) 1px solid;
            border-radius: 5px;
        }

        .loansArea button {
            width: 100px;
            height: 30px;
            text-align: center;
            margin: 20px 10px;
            border: rgb(216, 215, 215) 1px solid;
            border-radius: 5px;
        }
    </style>
</head>
<body>
	<%-- 헤더 네비 --%>
	<%@ include file="../common/mainbar-basic.jsp" %>
	<%-- 사이드바 --%>
	<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">도서 검색</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">상세 검색</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>도서 검색</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                    <tr>
                        <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/views/search/simpleSearch.jsp">간략 검색</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/views/search/detailSearch.jsp">상세 검색</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3">
                        <% if(loginUser != null) {%>
                        <a href="<%= request.getContextPath() %>/views/search/wishBook.jsp">희망 도서 신청</a>
                        <% } else { %>
                        <a href="#" onClick="alert('로그인 후 이용이 가능합니다.')">희망 도서 신청</a>
                        <% }%>
                        </p></td>
                    </tr>
                </table>
            </div>
    	</div>
	</div>

	<%-- 본문 --%>
    <div class="outer">
        <div><p class="title">상세 검색</p><hr></div>
        <div class="inner">
            <form action="<%= request.getContextPath() %>/simple/search" method="get">
                <div class="searchArea">

                    <div class="selectArea">
                    	<select name="searchSelect" id="searchSelect">
                        	<option value="total">전체</option>
                        	<option value="title">서명</option>
                        	<option value="writer">저자</option>
                        	<option value="publisher">발행처</option>
                    	</select>
                    </div>

                    <div class="textArea">
                        <input type="text" name="search" id="search" placeholder="내용을 입력해주세요">
                    </div>

                    <div class="btnArea">
                        <button id="searchBtn" type="submit" ><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </form>
            
			<br>

            <div class="listArea"><p>요청하신 에 대한 자료 검색 결과이며 총 <%= pi.getListCount() %> 건이 검색되었습니다.</p></div>
	
            <form action="<%= request.getContextPath() %>/detail/loan" method="POST" id="loansForm">
                <div class="resultArea">
                     <% if(list.isEmpty()) {%>
                    	<div class="resultBook"><p>조회 된 도서가 없습니다.</p></div>
                    		
                    	<script>
                    		$(document).ready(function() {
                    			if(confirm("희망 도서를 신청하시겠습니까?")) {
                    				<% if(loginUser != null) {%>
                    				location.href = "<%=  request.getContextPath() %>/views/search/wishBook.jsp";
                    				<% } else { %>
                    				alert("로그인 후 이용이 가능합니다.")
                    				location.href="<%= request.getContextPath() %>/views/member/loginForm.jsp"
                    				<% } %>
                    			}
                    		});
                    	</script>
                    	
                    <% } else { %>
                    	<% int i = 0; %>
                   		<% for(Book bk : list) { %>
                    	<div class="resultBook" >
                        	<input type="hidden" name="bName" value="<%=bName%>">
                        	<input type="hidden" name="bWriter" value="<%=bWriter%>">
                        	<input type="hidden" name="bPublisher" value="<%=bPublisher%>">
                        	<input type="hidden" name="isbn" value="<%=isbn%>">
                        	<input type="hidden" name="tDate" value="<%=tDate%>">
                        	<input type="hidden" name="fDate" value="<%=fDate%>">
                        	<input type="hidden" name="bName" value="<%=bName%>">
                        	
                        	<div class="bookImg"><img src="<%= request.getContextPath() %><%= bk.getImgPath()%><%= bk.getImgName() %>"></img></div>
                        	<div class="book">
                            		<div class="bName"><%= bk.getbName() %></div>
                            		<div><span>저자 : <%= bk.getbWriter() %>  지음 | </span>
                                		<span>발행처 : <%= bk.getbPublisher() %> | </span>
                                		<span>발행연도 : <%= bk.getIssueDate() %> 년</span></div>
                            		<div><span>ISBN : <%= bk.getIsbn() %> | </span>
                                		<span>청구 기호 : <%= bk.getCallNum() %></span></div>
                            		<div>재고 여부 : <%= bk.getStatus() %></div>
                        	</div>
                        	<span class="chk"><input type="checkbox" value=<%= bk.getCallNum() %> name="checkSelect" id="checkSelect<%=i%>"></span>
                        		<input type="hidden" value="">
                        	<% i++; %>
                    	</div>
 						<% }%>
                    <% } %>
                </div> 

                <div class="pageArea">
                    <% if(pi.getCurrentPage() == 1) {%>
                    <a href="#;"><i class="bi bi-chevron-double-left"></i></a>						
                    	<a href="#;"><i class="bi bi-chevron-compact-left"></i></a>					<!--  http://localhost:8800/khlib/detail/search?bName=1&bWriter=1&bPublisher=1&isbn=1&tDate=2007&fDate= -->
                    	<% } else {%>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=1&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-double-left"></i></a>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= pi.getCurrentPage()- 1 %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-compact-left"></i></a>
                    	
					<% } %>
	
                    <% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                    	<% if(i == pi.getCurrentPage()) { %>
                    		<a href="#;" style="background:rgb(216, 215, 215)"><%= i %></a>
                    	<% } else { %>
                    		<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= i %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><%= i %></a>
                    	<% } %>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                    	<a href="#;"><i class="bi bi-chevron-right"></i></a>
                    	<a href="#;"><i class="bi bi-chevron-double-right"></i></a>
                    <% } else {%>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= pi.getCurrentPage() + 1 %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-right"></i></a>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= pi.getMaxPage() %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-double-right"></i></a>
                    <% } %>
                </div>

                <div class="loansArea">
                    <button type="button" id="loansBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">대출 예약</button>
                    <button type="button" onclick="location.reload()">선택 취소</button>
                </div>

            </form>
        </div>
    </div>
    
    
    <!-- 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  	<div class="modal-dialog">
		 	<div class="modal-content">
      			<div class="modal-header">
      			<h6 class="modal-title" id="exampleModalLabel">선택 도서 예약 하시겠습니까?</h6>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body" id="modal-body">
      			
      			</div>
      			<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="yesBtn">네</button>
        		<button type="button" class="btn btn-secondary" id="cancelBtn" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>



	<script>
		const modalbody = document.getElementById("modal-body");
		
		
		$("#loansBtn").click(function(){
			//if(){ 로그인 유저 확인 -  로그인 아닐 시 alert 창 , 5개 이상 대출시 불가능
			const arr = [];
			<% for(int i = 0; i < list.size(); i++){ %>
			
				if($('#checkSelect' + <%= i %>).is(":checked") == true){
					// console.log('체크된 상태');
					arr.push('<%= list.get(i).getbName() %>');
				}
			<% } %>
			// console.log(arr);
			modalbody.innerHTML = arr.join('<br>');
		});
		
		
				
		$("#yesBtn").click(function(){
			// 로그인 유저만 가능
			<% if(loginUser != null) { %>
			
			<% for(int i = 0; i < list.size(); i++){ %>
				if($('#checkSelect' + <%= i %>).is(":checked") == true){
					// console.log('체크된 상태');
					<% if( list.get(i).getStatus().equals("대출가능")) { %>
						$("#loansForm").submit();
					<% } else { %>
						alert("해당 도서는 대출 불가능합니다.")
						
					<% } %>
					}
				<% } %>
				
			<% } else {%>
				alert("로그인 후 이용이 가능합니다.")
				location.href="<%= request.getContextPath() %>/views/member/loginForm.jsp"
			<% }%>
			
		});
		

	</script>
    <%-- 푸터 --%>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>