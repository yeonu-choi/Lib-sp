<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.board.model.vo.*" %>
<%
	ArrayList<FAQ> common = (ArrayList<FAQ>)request.getAttribute("common");
	ArrayList<FAQ> account = (ArrayList<FAQ>)request.getAttribute("account");
	ArrayList<FAQ> book = (ArrayList<FAQ>)request.getAttribute("book");
	ArrayList<FAQ> facility = (ArrayList<FAQ>)request.getAttribute("facility");
	int ci = 0; int ai = 0; int bi = 0; int fi = 0;
	
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
    	        
       	#wrap{
       		width: 60%;
            margin-top: 80px;
            margin-bottom: 80px;
            margin-left:10px;
            float:left;
       	}
       	
       	#addfaq {
       		margin-top:50px;
       		float:right;
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
		<div id="boardTitle">
			<h2>&nbsp;&nbsp;FAQ</h2>
			<br>
			<hr>
			<br>
		</div>
		<div class="dropdown">&nbsp;&nbsp;
		  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
		    전체
		  </a>
		
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		    <li><a class="dropdown-item" href="#11">공통</a></li>
		    <li><a class="dropdown-item" href="#22">계정</a></li>
		    <li><a class="dropdown-item" href="#33">도서</a></li>
		    <li><a class="dropdown-item" href="#44">시설</a></li>
		  </ul>
		</div>
		<br><br>
		<!-- 그룹 -->
		
		<ul class="list-group">
		<li class="list-group-item list-group-item-light 11"><p id="11">공통</p>		
		<div class="accordion accordion-flush" id="accordionFlushExample">
		<!-- 질문 답변 -->                    
		<% if(common.isEmpty()) { %>
              <div class="accordion-item">
		   	  <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= ci %>c" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6>조회 된 질문이 없습니다.</h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= ci %>c" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회 된 답변이 없습니다.</div>
		    </div>
		  </div>                  
          <% } else { %>
		  <% for(FAQ f1 : common) { %>		  
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= ci %>c" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6><%= common.get(ci).getF_Qcontent() %></h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= ci %>c" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= common.get(ci).getF_Acontent() %></div>
		    </div>
		  </div>
		  <% ci++; %>
		  <% } %>
		  <% } %>
		  <!-- 질문 답변 -->
		</div>
		</li>
		<!-- 카테고리 -->
		
		<li class="list-group-item list-group-item-light 22"><p id="22">계정</p>		
		<div class="accordion accordion-flush" id="accordionFlushExample">
		 <!-- 질문 답변 -->
		 <% if(account.isEmpty()) { %>
		 <div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= ai %>a" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6>조회 된 질문이 없습니다.</h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= ai %>a" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회 된 답변이 없습니다.</div>
		    </div>
		  </div>
		 <% } else { %>
		 <% for(FAQ f : account) { %>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= ai %>a" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6><%= account.get(ai).getF_Qcontent() %></h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= ai %>a" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= account.get(ai).getF_Acontent() %></div>
		    </div>
		  </div>
		  <% ai++; %>
		  <% } %>
		  <% } %>
		</div>
		</li>
		
		<!-- 카테고리 -->
			<li class="list-group-item list-group-item-light 33"><p id="33">도서</p>		
		<div class="accordion accordion-flush" id="accordionFlushExample">
		<!-- 질문 답변 -->
		<% if(book.isEmpty()) { %>
		<div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= bi %>b" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6>조회 된 질문이 없습니다.</h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= bi %>b" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회 된 답변이 없습니다.</div>
		    </div>
		  </div>
		<% } else { %>
		<% for(FAQ f : book) { %>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= bi %>b" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6><%= book.get(bi).getF_Qcontent() %></h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= bi %>b" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= book.get(bi).getF_Acontent() %></div>
		    </div>
		  </div>
		  <% bi++; %>
		  <% } %>		  
		  <% } %>		  
		</div>
		</li>
		<!-- 카테고리 -->
		    <li class="list-group-item list-group-item-light 44"><p id="44">시설</p>		
		<div class="accordion accordion-flush" id="accordionFlushExample">
		<!-- 질문 답변 -->
		<% if(facility.isEmpty()) { %>
		<div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= fi %>f" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6>조회 된 질문이 없습니다.</h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= fi %>f" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회 된 답변이 없습니다.</div>
		    </div>
		  </div>
		<% } else { %>
		<% for(FAQ f : facility) { %>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= fi %>f" aria-expanded="false" aria-controls="flush-collapseOne">
		       <h4>Q.</h4>&nbsp;&nbsp;<h6><%= facility.get(fi).getF_Qcontent() %></h6>
		      </button>
		    </h2>
		    <div id="flush-collapse<%= fi %>f" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body"><h3>A.</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= facility.get(fi).getF_Acontent() %></div>
		    </div>
		  </div>
		  <% fi++; %>
		  <% } %>
		  <% } %>
		</div>
		</li>
		</ul>
		<% if(loginId != null && loginId.equals("admin")) { %>
		<button type="button" class="btn btn-secondary" id="addfaq">FAQ 추가</button>	
		<% } %>
		<script>
                const write = document.getElementById('addfaq');
                write.addEventListener('click', function(){
                location.href='<%= request.getContextPath() %>/views/board/faqInsert.jsp';
                });                    		
        </script>
    </div>
    
<%@ include file="../common/footer.jsp" %>
</body>
</html>