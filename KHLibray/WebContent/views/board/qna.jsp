<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.board.model.vo.*"%>
    
<% 
	ArrayList<QNA> list = (ArrayList<QNA>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH 도서관</title>
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
			float: left;
			width: 60%;
			padding-left: 50px;
		}
		
		#title {
			margin-top: 100px;
		}
		
		#searchForm {
			margin-top: 50px;
		}
		
		.form-select {
			width: 180px;
			display: inline-block;
		}
		
		#searchText {
			display: inline-block;
			width: 800px;
		}
		
		#searchBtn {
			margin-top: -4px;
		}
		
		#content {
			padding-top: 30px;
		}
		
		.no{
			width:5%;
		}
		
		.title {
			width: 50%;
		}
		
		.writer {
			width: 15%;
		}
		
		.date {
			width: 20%;
		}
		
		#paging {
			text-align: center;
			margin-top: 50px;
			margin-right: 60px;
		}
		
		#btn {
			float: right;
			margin: 30px 30px 50px 0
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
		<div id="title">
			<h3>Q & A</h3>
			<br>
			<hr>
		</div>
		<div id="search">
			<form id="searchForm" method="get" action="">
				<select class="form-select" aria-label="Default select example">
				  <option>-----</option>	
				  <option value="qna_Qtitle">제 목</option>
				  <option value="qna_Qcontent">내 용</option>
				  <option value="user_id">작 성 자</option>
				</select>
				<input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" id="searchText">
				<button type="submit" class="btn btn-outline-secondary" id="searchBtn">검색</button>
			</form>
		</div>
		<div id="content">
		    <table class="table table-hover">
				<thead>
					<tr>
						<td class="no">No.</td>
						<td class="title">제목</td>
						<td class="writer">작성자</td>
						<td class="date">작성일</td>
						<td class="count">조회수</td>					
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="5">조회 된 게시글이 없습니다.</td>
					</tr>
					<% } else { %>
						<% for(QNA q : list) { %>	
							<% if(q.getSecret().equals("Y")) { %>
								<tr id="listTable" style="visibility:collapse">
									<td class="no"><%= q.getQna_No() %></td>						
									<% if(q.getSecret().equals("Y")) { %>
										<td id="hiddentitle"><%= q.getQna_Qtitle() %>&nbsp;
										<img id="img" src="<%= request.getContextPath() %>/resources/image/doo/sec.png" width="30px" height="20px">
										</td>						
									<% } else { %>
									<td class="title"><%= q.getQna_Qtitle() %>
									<% } %>
									</td>
									<td class="writer"><%= q.getUser_Id() %></td>
									<td class="date"><%= q.getC_Date() %></td>
									<td class="count"><%= q.getQ_Count() %></td>
								</tr>
								<!--  -->
							<script>
							<% String writer = q.getUser_Id(); %>
							<% if(loginId != null && (loginId.equals("admin") || loginId.equals(writer))){ %>
								
								$(function(){
									$("#listTable").css({"visibility" : "visible"});
								});									
								
							<% } %>
							</script>		
						 <!--  -->																	
							<% } else { %>				
						<tr id="listTable">
							<td class="no"><%= q.getQna_No() %></td>						
							<% if(q.getSecret().equals("Y")) { %>
								<td class="hiddentitle"><%= q.getQna_Qtitle() %>&nbsp;
								<img id="img" src="<%= request.getContextPath() %>/resources/image/doo/sec.png" width="30px" height="20px">
								</td>						
							<% } else { %>
							<td class="title"><%= q.getQna_Qtitle() %>
							<% } %>
							</td>
							<td class="writer"><%= q.getUser_Id() %></td>
							<td class="date"><%= q.getC_Date() %></td>
							<td class="count"><%= q.getQ_Count() %></td>
						</tr>
							<% } %>
																						
						<% } %>
					<% } %>
				</tbody>
			</table>
		</div>
		<div id="paging"> 
			<!-- << -->
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=1'"> &lt;&lt; </button>
			<!-- < -->
			<% if(pi.getCurrentPage() == 1) { %>
			<button type="button" class="btn btn-outline-secondary" disabled> &lt; </button>
			<% } else { %>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			<!-- 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
				<% if(p == pi.getCurrentPage()) { %>
					<button style="background:lightgray;" type="button" class="btn btn-outline-secondary" disabled><%= p %></button>
				<% } else { %>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= p %>'"><%= p %></button>
				<% } %>			
			<% } %>
			<!-- > -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
			<button type="button" class="btn btn-outline-secondary" disabled> &gt; </button>
			<% } else { %>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			<!-- >> -->
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='<%= request.getContextPath() %>/qna/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
		</div>
		
		<div id="btn">
			<% if(loginUser != null) { %>
			<button type="button" class="btn btn-secondary" onclick="location.href='<%= request.getContextPath() %>/views/board/qnaInsert.jsp'">글쓰기</button>
			<% } %>
		</div>
	</div>
	
	<script>
		$(function(){
			$("#listTable td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			}).click(function(){
				<% if(loginUser != null) { %>
				let no = $(this).parent().children().eq(0).text();
				location.href="<%= request.getContextPath() %>/qna/detail?qna_No=" + no; 
				<% } else { %>
					alert("로그인 후 조회 가능합니다.")
				<% } %>				
			});	

		});

		
	</script>
	
	
	
	

<%@ include file="../common/footer.jsp" %>
</body>
</html>