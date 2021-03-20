<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String error = (String)request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    	
    	.menuTitle {
            margin-left: 25%;
            padding-top : 90px;
            padding-bottom: 20px;
            padding-left: 20px;
            width: 65%;
            border-bottom: 1.5px solid rgb(230, 230, 230);
        }

        .menuTitle span {
            font-weight: 600;
            font-size: 25px;
            padding-bottom: 5px;
        }

        .leave {
            margin-top: 50px;
            margin-left: 28%;
            width: 60%;
            height: 125px;
            background-color: rgb(180, 180, 180);
            overflow: hidden;
            border: 1px solid rgb(126, 125, 125);
        }

        .leave p {
            padding-top: 13px;
            padding-left: 20px;
            color: rgb(255, 255, 255);
        }

        .empa {
            color: red;
            font-size: 14px;
        }

        .passchk {
            margin-top: 50px;
            margin-left: 28%;
            margin-bottom : 200px;
            width: 60%;
            overflow: hidden;
        }
        #passchk {
            border-top: 2px solid rgb(68, 68, 68);
            margin-bottom: 20px;
            width: 100%;
        }

        #passchk th {
           background-color: rgb(243, 243, 243);
           border-right: 1px solid rgb(214, 214, 214);
           text-align: center;
        }

        #passchk tr {
            height: 50px;
            border-bottom: 2px solid rgb(190, 189, 189);
        }

        #passchk input {
            width: 20%;
            height: 30px;
            margin-left : 15px;
            background-color: rgb(243, 243, 243);
            border: 1px solid rgb(126, 125, 125);
        }

        .btns {
            width: 100%;
            text-align: center;
        }
    </style>
    <!-- <script>
        $(document).ready(function() {
            $("tr").on("click", function() { 
                    $(this).children().each(function() {
                        $("#subName").text($(this).text());
                    });
                });
            });
    </script> -->
</head>
<body>
<%@ include file="../common/mainbar-basic.jsp" %>
<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">내서재</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">회원탈퇴</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>내 서재</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                        <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/views/myLib/userUpdate.jsp">회원 정보 수정</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/mylib/wlist">희망 도서 신청 내역</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/mylib/lblist">대출 내역</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/views/myLib/userleave.jsp">회원 탈퇴</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
<div class="menuTitle">
        <span>회원탈퇴</span>
    </div>
    <div class="leave">
        <p><img src="<%=request.getContextPath()%>/resources/image/yw/warning.png" width="15px" height="15px">&nbsp; 회원 탈퇴를 하시면 아이디를 포함한 모든 개인정보가 영구적으로 삭제되어 복구되지 않습니다.<br>
            <img src="<%=request.getContextPath()%>/resources/image/yw/warning.png" width="15px" height="15px">&nbsp; 탈퇴 후에는 자료대출, 홈페이지 이용 등 모든 도서관 서비스를 이용하실 수 없습니다.<br>
            <img src="<%=request.getContextPath()%>/resources/image/yw/warning.png" width="15px" height="15px">&nbsp; 대출 중인 책이 있을 경우에는 탈퇴가 불가능합니다. 반납을 먼저 진행해시길 바랍니다.<br>
            <img src="<%=request.getContextPath()%>/resources/image/yw/warning.png" width="15px" height="15px">&nbsp; 회원님의 정보를 안전하게 보호하기 위해 한번 더 비밀번호를 입력해 주십시오.</p>
    </div>
    <div class="passchk">
        <form id="passout" action="<%=request.getContextPath() %>/mylib/leave" method="post">
        <table id="passchk" style="border-collapse: collapse;">
            <tr>
                <th width="20%">비밀번호(<span class="empa">*</span>)</th>
                <td><input type="password" id="pchk" name="pchk"></td>
            </tr>
        </table>
        <div class="btns">
        <button id="leavebtn" type="submit" class="btn btn-dark">탈퇴</button>
        </div>
    </form>
    </div>
    
    <script>
    $("#leavebtn").click(function(){
    	if($("#pchk").val().length == 0){
    		alert('비밀번호를 입력하세요');
    		$("#pchk").focus();
    		return false;
    	} else {
    		if(confirm('정말 탈퇴하시겠습니까?')){
        		$("#passout").submit();
        	}
    	}
    })
    </script>
    
    <% if(error != null) { %>
	<script>
	alert('<%= error %>');
	</script>
	<% } %>
	
    <%@ include file="../common/footer.jsp" %>
</body>
</html>