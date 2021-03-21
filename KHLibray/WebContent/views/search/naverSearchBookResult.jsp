<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.wishBook.model.vo.NaverBook"%>
    
<% 
	ArrayList<NaverBook> list = (ArrayList<NaverBook>)request.getAttribute("list");	

	String search = request.getParameter("search")!= null ? request.getParameter("search") : ""; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH 도서관</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<style>
		.title {
        	font-weight: 500;
			font-size: 28px;
			padding: 0px 0px 5px 20px;
		}
		
        .searchArea {
            width: 80%;
            height: 30px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 30px;
            position: relative;
            border : 1px rgb(219, 219, 219) solid;
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
        
        
        #search, #searchBtn {
        	width : 100%;
            height: 28px;
            border : 1px rgb(207, 206, 206) solid;
            font-size: 16px;
        }

        #search {
            padding-left: 5px;
        }
        
        #searchBtn{
        	height: 32px;
        }
        
        label {
        	font-size: 18px;
        	padding : 0px 10px;
        }
        
        
		.resultBook {
		 	margin: auto;
            width: 90%;
            height: 150px;
        }
        
        .resultBook p {
        	text-align : center;
        	padding: 50px 0px;
        }
        
        #closeBtn,
        .selBtn {
        	width: 70px;
            height: 30px;
            text-align:center;
            border: rgb(216, 215, 215) 1px solid;
            border-radius: 5px;
            margin : 5px;
        }
        
        #resultTable {
            width: 90%;
            height: 140px;
            border-collapse: collapse;
            border-bottom: 1px solid rgb(212, 210, 210);
            margin: auto;
            margin-bottom: 5px;
        }

        img {
            height: 140px;
        }

        td {
            padding : 5px 0px 5px 5px;
        }

        tr:nth-child(4n+1) td:nth-child(1){
            text-align: center;
            width : 20%;
            border-bottom: 1px solid rgb(212, 210, 210);
            
        }

        td:nth-child(2){
            text-align: left;
            width:65%;
        }

        tr:nth-child(4n),
        tr:nth-child(4n+1) td:nth-child(3) {
            border-bottom: 1px solid rgb(212, 210, 210);
        }

        td:nth-child(3) {
            width: 25%;
            text-align: center;
        }

        input[type=checkbox] {
            width: 15px;
            height: 15px;
        }
        
        .btnArea2 {
        	margin:20px;
        	text-align:center;
        }

</style>
</head>
<body>
	<div class="outer">

		<div><p class="title">희망 도서 검색</p><hr></div>
		
		<form action="<%= request.getContextPath() %>/wish/search" method="get" >
			<div class="searchArea">
				<div class="selectArea">
					<label>검색어</label>
				</div>
					<div class="textArea">
					<input type="text" name="search" id="search" placeholder="내용을 입력해주세요" value="<%= search %>">
				</div>
				
				<div class="btnArea">
					<button id="searchBtn" type="submit"><i class="bi bi-search"></i></button>
				</div>
				
			</div>
		</form>
		
		<div class="tableArea">
		    <form action="<%= request.getContextPath() %>/wish/choice" method="get" name ="myForm">
		    	<% if(list.isEmpty()) {%>
		   	 		<div class="resultBook">
		   	 		<p>검색 결과가 없습니다.<br><br><button type="button" onclick="window.close()" id="closeBtn">닫기</button></p>
		   	 		</div>
		   	 		
            	<% } else { %>
                    <% int i = 0; %>
                    <table id="resultTable">
                    	<% for(NaverBook bk : list) { %>
                    	<tbody class="bookInfo">
                        <tr>
                            <td rowspan="4"><img src="<%= bk.getImage() %>"></img></td>
                            <td><%= bk.getTitle() %></td>
                            <td rowspan="4"><input type="checkbox" name="bkInfo" id="checkSelect<%= i %>" value="<%= bk %>"></td>
                        </tr>
                        <tr><td>저자 : <%= bk.getAuthor() %>  지음 </td></tr>
                        <tr><td>발행처 : <%= bk.getPublisher() %></td></tr>
                        <tr><td>발행연도 : <%= bk.getPubdate().substring(0, 4) %> 년</td></tr>
                        <% i++; %>
                        </tbody>
                        <% }%>
                    
                   </table>
                   <div class="btnArea2">
                   		<button type="button" class="selBtn" onclick="goSubmit()">선택</button>
                   		<button type="button" onclick="window.close()" id="closeBtn">닫기</button>
                   </div>
                   <% } %>
			</form>
		</div>
	</div>
	
	
	
	<script>
	
	$(function(){
		$('input[type="checkbox"]').click(function(){
			if($(this).prop('checked')){
				$('input[type="checkbox"]').prop('checked',false);
			    $(this).prop('checked',true);
			 }
		});
	})
	
	function goSubmit(){
		window.opener.name = "parentPage";
		document.myForm.target = "parentPage";
		document.myForm.action = "<%= request.getContextPath() %>/wish/choice"
		document.myForm.submit();
		self.close();
	}
	
	</script>
	
</body>
</html>