<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bTitle = (String)request.getAttribute("bTitle") != null ? (String)request.getAttribute("bTitle") : "";	
	String bWriter = (String)request.getAttribute("bWriter") != null ? (String)request.getAttribute("bWriter") : "";
	String bPublisher = (String)request.getAttribute("bPublisher") != null ? (String)request.getAttribute("bPublisher") : "";	
	String issueDate = (String)request.getAttribute("issueDate") != null ? (String)request.getAttribute("issueDate") : "";
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

        .inner {
            width: 90%;
            margin: auto;
			margin-top: 60px;
            padding: 40px;
            border : 1px rgb(219, 219, 219) solid;
        }
        
        .info {
        	font-size: 20px;
        	font-weight : bold;
        	margin: 10px 40px;
        }

        /* table 2개 */
        .inner table {
            width: 90%;
            margin: auto;
            border-top: 1px rgb(204, 199, 199) solid;
            border-collapse: collapse;
            font-size: 15px;
        }

        /* */
       .inner th {
            width : 150px;
            text-align: center;
            padding : 10px;
            background-color: rgb(236, 236, 236);
            border-bottom: 1px rgb(218, 215, 215) solid;
        }

        .inner td {
            border-bottom: 1px rgb(218, 215, 215) solid;
        }

        .inner input , 
        .searchBtn button{
        	height: 26px;
            border: 1px rgb(216, 211, 211) solid;
            padding-left: 5px;
        }
        
        .inner td label, input{
            margin-left: 5px;
        }
        
        .searchBtn button {
        	margin : 0px 10px;
        	width : 12%
        }
        
        
        .inner tr:nth-child(1) input{
            width:80%;
        }

        .inner tr:not(:nth-child(1)) input{
            width:50%;
        }


        .btnArea {
            text-align:center;
        }    

        button {
        	width: 100px;
            height: 30px;
            text-align:center;
            margin: 50px 10px 20px 10px;
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
        <span><a id="subName" href="">희망 도서 신청</a></span>
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
        <div><p class="title">희망 도서 신청</p><hr></div>
        <div class="inner">
            <form action="<%= request.getContextPath() %>/wish/apply" method="POST" id="wishBookForm" >
                 <div><p class="info">신청자 정보</p></div>
                 <div class="userArea">
                    <table class="userTable">
                        <tr>
                            <th><label>신청자명</label></th>
                            <td><label><%= loginUser.getUser_name() %></label></td>
                        </tr>
                        <tr>
                            <th><label>휴대폰 번호</label></th>
                            <td>
                                <span class="input_area">
                                <input type="tel" maxlength="11" name="phone" value="<%= loginUser.getPhone() %>" placeholder="(-없이)01012345678">
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th><label>이메일</label></th>
                            <td>
                                <span class="input_area">
                                <input type="email" name="email" value="<%= loginUser.getEmail() %>"placeholder="@gmail.com">
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
				<br>
                <p class="info">희망 도서 정보</p>
                <div class="bookArea">
                    <table class="bookTable">
                        <tr>
                            <th><label>희망 도서명 * </label></th>
                            <td>
                                <span class="input_area">
                                <input type="text" name="bName" value="<%=bTitle %>"class="iCheck" required>
                                </span>
                                <span class="searchBtn"><button type="button" id="searchBtn">검색</button></span>
                            </td>
                        </tr>
                        <tr>
                            <th><label>저자 * </label></th>
                            <td>
                                <span class="input_area">
                                <input type="text" name="bWriter" value="<%= bWriter%>" class="iCheck" required>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th><label>발행처* </label></th>
                            <td>
                                <span class="input_area">
                                <input type="text" name="bPublisher" value="<%= bPublisher%>" class="iCheck" required>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th><label>발행연도 </label></th>
                            <td>
                                <span class="input_area">
                                <input type="text" name="issueDate" value="<%= issueDate%>"maxlength="4" > <span> ※ 숫자만 입력 (ex. 2021)</span> 
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="btnArea">
                    <button type="button" id="wishBtn" onclick="return wishBookApply()">도서 신청</button>
                    <button type="button" onclick="location.reload()">신청 취소</button>
                </div>

            </form>
        </div>
    </div>
    
    
   <script>
   // 휴대폰번호, 발행연도 유효성 검사
  
   
   function wishBookApply(){
	   
	   var phone = $(".userTable input[name=phone]").val().trim();
	   var iDate = $(".bookTable input[name=issueDate]").val().trim();
	   
	   if(phone != ""){
		   if(!(/^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/.test(phone))){
			   alert("잘못된 휴대폰 번호입니다.")
			   $(".userTable input[name=phone]").select();
			   return false;
		   }
	   }
	   
	   if(iDate != ""){
			if(!(/^[1-2][0-9]{3}$/.test(iDate))){
		   		alert("발행연도는 연도 4자로 입력해 주세요 ex.2021");
		   		$(".bookTable input[name=issueDate]").select();
		   		return false;
	   		}
		}
	   
	   var iCheck = document.getElementsByClassName("iCheck")
	   
	   for(var i = 0; i < iCheck.length; i++){
	  		if(iCheck[i].value.trim().length == 0){
			   alert("필수 사항을 입력하세요.");
			   return false;
	   		}
	   }
	   
	   $(function(){
		var bName = $(".bookTable input[name=bName]");
			$.ajax({
				url : "<%= request.getContextPath() %>/wish/bkCheck",
				type : "post",
				data : { bName : bName.val() },
				success : function(data){
					console.log(data);							
					if(data == "fail1"){
						alert("해당 도서는 현재 도서관에 소장 중인 도서입니다.");
						bName.focus();
					}else if(data == "fail2"){alert("해당 도서는 이미 희망 도서 신청 상태입니다.");
						bName.focus();
						
					} else {
						$("#wishBookForm").submit();
					}
				},
				error : function(e){
					console.log(e);
				}
			});
	   });
    }
   
   	
   	const searchBtn = document.getElementById('searchBtn');
   		searchBtn.addEventListener('click', function(){
		window.open("<%= request.getContextPath()%>/views/search/naverSearchBook.jsp" , "naverSearch", "width=1000, height=800");
	})

   
   
   </script>
    
    <%-- 푸터 --%>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>