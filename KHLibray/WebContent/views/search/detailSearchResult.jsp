<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.search.model.vo.*"%>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	String bName = (String)request.getParameter("bName") != null ? request.getParameter("bName") : "";;
	String bWriter = (String)request.getParameter("bWriter") != null ? request.getParameter("bWriter") : "";
	String bPublisher = (String)request.getParameter("bPublisher") != null ? request.getParameter("bPublisher") : "";
	String isbn = (String)request.getParameter("isbn") != null ? request.getParameter("isbn") : "";
	String tDate = (String)request.getParameter("tDate") != null ? request.getParameter("tDate") : "";
	String fDate = (String)request.getParameter("fDate") != null ? request.getParameter("fDate") : "";

	String sortSelect = request.getParameter("sortSelect") != null ? request.getParameter("sortSelect") : "";
	String numSelect = request.getParameter("numSelect") != null ? request.getParameter("numSelect") : "";
	
	String sort[] = new String[3];
	if(sortSelect == ""){
		sort[0] = "selected";
	} else {
		if(sortSelect.equals("서명순")){
			sort[0] = "selected";
		} else if(sortSelect.equals("저자순")){
			sort[1] = "selected";
		} else {
			sort[2] = "selected";
		}
	}
	
	String num[] = new String[3];
	if(numSelect == ""){
		num[0] = "selected";
	} else {
		if(numSelect.equals("10")){
			num[0] = "selected";
		} else if(numSelect.equals("20")) {
			num[1] = "selected";
		}else {
			num[2] = "selected";
		}
	}
	
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH도서관</title>
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
        }
	
		.select {
            width :80%;
            margin: auto;
            text-align: right;
            font-size : 15px;
            padding: 0px 0px 10px 0px;
            border-bottom: 1px rgb(194, 192, 192) solid;
        }
        
        .select button{
            height: 30px;
            text-align: center;
            margin: 0px 10px 5px 5px;
            border: rgb(216, 215, 215) 1px solid;
            border-radius: 5px;
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
	
		.resultBook p {
        	text-align : center;
        	padding: 70px 0px;
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
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/views/search/wishBookInfo.jsp">희망 도서 신청</a></p></td>
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

            <div class="listArea"><p>요청하신 서명 : <%= bName%> 저자 : <%= bWriter %> 발행처 : <%= bPublisher %> ISBN : <%= isbn %> 발행연도 : <%= tDate%> - <%= fDate %>에 대한 자료 검색 결과이며 총 <%= pi.getListCount() %> 건이 검색되었습니다.</p></div>
	
			<form action="<%= request.getContextPath() %>/detail/sort" method="get">
			<div class="select">
                <span>
                    <select name="sortSelect" id="sortSelect">
                    <option value="서명순" <%= sort[0] %>>서명순</option>
                    <option value="저자순" <%= sort[1] %>>저자순</option>
                    <option value="최신순" <%= sort[2] %>>최신순</option>
                    </select>
                </span>
                <span>
                    <select name="numSelect" id="numSelect">
                        <option value="10" <%= num[0] %>>10개</option>
                        <option value="20" <%= num[1] %>>20개</option>
                        <option value="30" <%= num[2] %>>30개</option>
                    </select>
                    <input type="hidden" value="<%=bName%>" name="bName">
                    <input type="hidden" value="<%=bWriter%>" name="bWriter">
                    <input type="hidden" value="<%=bPublisher%>" name="bPublisher">
                    <input type="hidden" value="<%=isbn%>" name="isbn">
                    <input type="hidden" value="<%=tDate%>" name="tDate">
                    <input type="hidden" value="<%=fDate%>" name="fDate">
                    <button type="submit" id="sortbtn">조회</button>
                </span>
            </div> 
			</form>
	
	
	
            <form action="<%= request.getContextPath() %>/detail/loan" method="POST" id="loansForm">
                <div class="resultArea">
                     <% if(list.isEmpty()) {%>
                    	<div class="resultBook"><p>조회 된 도서가 없습니다.</p></div>
                    	<script>
                    		$(document).ready(function() {
                    			if(confirm("희망 도서를 신청하시겠습니까?")) {
                    				location.href = "<%=  request.getContextPath() %>/views/search/wishBookInfo.jsp";
                    			}
                    		});
                    	</script>
                    <% } else { %>
                    	<% int i = 0; %>
                   		<% for(Book bk : list) { %>
                    	<div class="resultBook" >
                        	<div class="bookImg"><img src="<%= request.getContextPath() %><%= bk.getImgPath()%><%= bk.getImgName() %>"></img></div>
                        	<div class="book">
                            	<div class="bName" id="bName<%= i %>"><%= bk.getbName() %></div>
                            	<div><span>저자 : <%= bk.getbWriter() %>  지음 | </span>
                                	<span>발행처 : <%= bk.getbPublisher() %> | </span>
                                	<span>발행연도 : <%= bk.getIssueDate() %> 년</span></div>
                            	<div><span>ISBN : <%= bk.getIsbn() %> | </span>
                                	<span>청구 기호 : <%= bk.getCallNum() %></span></div>
                            	<div>재고 여부 : <span id="bks<%= i %>"><%= bk.getStatus() %></span></div>
                            	<input type="hidden" value="<%=bName%>" name="bName">
                            	<input type="hidden" value="<%=bWriter%>" name="bWriter">
                            	<input type="hidden" value="<%=bPublisher%>" name="bPublisher">
                            	<input type="hidden" value="<%=isbn%>" name="isbn">
                            	<input type="hidden" value="<%=tDate%>" name="tDate">
                            	<input type="hidden" value="<%=fDate%>" name="fDate">
                        	</div>
                        	<span class="chk"><input type="checkbox" value=<%= bk.getCallNum() %>  name="checkSelect" id="checkSelect<%= i %>"></span>
                        		
                        	<% i++; %>
                    	</div>
 						<% }%>
                    <% } %>
                </div> 

                <div class="pageArea">
                    <% if(pi.getCurrentPage() == 1) {%>
                    <a href="#;"><i class="bi bi-chevron-double-left"></i></a>						
                    	<a href="#;"><i class="bi bi-chevron-compact-left"></i></a>					
                    	<% } else if(sortSelect.equals("") && numSelect.equals("")) {%>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=1&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-double-left"></i></a>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= pi.getCurrentPage()- 1 %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-compact-left"></i></a>
                    	<% } else { %>
                    	<a href="<%= request.getContextPath() %>/detail/sort?currentPage=1&sortSelect=<%= sortSelect %>&numSelect=<%= numSelect %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-double-left"></i></a>
                    	<a href="<%= request.getContextPath() %>/detail/sort?currentPage=<%= pi.getCurrentPage()- 1 %>&sortSelect=<%= sortSelect %>&numSelect=<%= numSelect %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-compact-left"></i></a>
                    	
					<% } %>
	
                    <% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
                    	<% if(i == pi.getCurrentPage()) { %>
                    		<a href="#;" style="background:rgb(216, 215, 215)"><%= i %></a>
                    	<% } else if(sortSelect.equals("") && numSelect.equals("")) {%>
                    		<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= i %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><%= i %></a>
                    	<% } else {%>
                    		<a href="<%= request.getContextPath() %>/detail/sort?currentPage=<%= i %>&sortSelect=<%= sortSelect %>&numSelect=<%= numSelect %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><%= i %></a>
                    	<% } %>
                    <% } %>
                    
                    <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                    	<a href="#;"><i class="bi bi-chevron-right"></i></a>
                    	<a href="#;"><i class="bi bi-chevron-double-right"></i></a>
                    <% } else if(sortSelect.equals("") && numSelect.equals("")) {%>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= pi.getCurrentPage() + 1 %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-right"></i></a>
                    	<a href="<%= request.getContextPath() %>/detail/search?currentPage=<%= pi.getMaxPage() %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-double-right"></i></a>
                    <% } else { %>
                    	<a href="<%= request.getContextPath() %>/detail/sort?currentPage=<%= pi.getCurrentPage() + 1 %>&sortSelect=<%= sortSelect %>&numSelect=<%= numSelect %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-right"></i></a>
                    	<a href="<%= request.getContextPath() %>/detail/sort?currentPage=<%= pi.getMaxPage() %>&sortSelect=<%= sortSelect %>&numSelect=<%= numSelect %>&bName=<%= bName %>&bWriter=<%= bWriter %>&bPublisher=<%= bPublisher %>&isbn=<%= isbn %>&tDate=<%= tDate %>&fDate=<%= fDate %>"><i class="bi bi-chevron-double-right"></i></a>
                    
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
	var sArr = [];
	
	$("#loansBtn").click(function(){
		const arr = [];	// 클릭할때마다 비워주기!
		sArr = [];  	// 클릭할때마다 비워주기!
		$(".book").each(function(i){
			if($('#checkSelect' + i ).is(":checked") == true){
				arr.push($("#bName" + i).text());
				sArr.push($("#bks" + i).text());
			}
		});
		modalbody.innerHTML = arr.join('<br>');
	});
	
	$("#yesBtn").click(function(){
		<% if(loginUser != null) { %>
		$(function(){
			$.ajax({
				url : "<%= request.getContextPath() %>/loan/check",
				type : "post",
				success : function(data){
					console.log(data);	
					if(data == "fail"){
						alert("회원님은 더 이상 대출할 수 없습니다.");
					} else if(sArr.includes("대출불가능[대출중]")){
						alert("대출 불가능한 도서가 있습니다.")
					} else {
						$(".book").each(function(i){
							if($('#checkSelect' + i ).is(":checked") == true){
								$("#loansForm").submit()
							}
						});
					}
				},
				error : function(e){
					console.log(e);
				}
			});
		});
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