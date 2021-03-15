<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        form span {
            font-size: 15px;
            font-weight: 400;
        }

        .modiArea {
            margin-top: 50px;
            margin-left: 28%;
            width: 60%;
            height: 50px;
            background-color: rgb(226, 226, 226);
            overflow: hidden;
        }

        .modiArea *{
            text-align: center;
            margin-top: 6px;
        }

        .modiArea button {
            margin-top: -7px;
            font-size: 14px;
        }

        .detailArea {
            margin-top: 50px;
            margin-left: 28%;
            width: 60%;
            overflow: auto;
            border-top: 2px solid rgb(0, 0, 0);

        }

        #wishDetail {
            margin-top: 20px;
            margin-bottom: 20px;
            width: 100%;
            text-align: center;
        }

        #wishDetail tr:first-child {
            background-color: rgb(246, 246, 247);
            height: 60px;
            border-top: 2px solid rgb(214, 213, 213);
            border-bottom: 2px solid rgb(214, 213, 213);
        }

        #wishDetail tr:last-child{
            border-bottom: 2px solid rgb(214, 213, 213);
        }

        #wishDetail th {
            font-weight: 600;
            font-size: 15px;
        }

        #wishDetail td {
            height: 80px;
            font-weight: 550;
            color: rgb(85, 85, 85);
        }

        #blank td:last-child {
            padding-right: 30px;
        }
        
         #paging {
            margin-top: 50px;
            margin-left: 27%;
            width: 60%;
            text-align: center;
            margin-bottom : 150px;
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
        <span><a id="subName" href="">희망도서신청내역</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>내 서재</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                        <td align="center"><p class="subm1"><a href="">회원 정보 수정</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/views/myLib/wishBookList.jsp">희망 도서 신청 내역</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/views/myLib/loanList.jsp">대출 내역</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/views/myLib/userleave.jsp">회원 탈퇴</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
<div class="menuTitle">
        <span>희망도서신청내역</span>
    </div>
    <div class="modiArea">
        <form action="<%= request.getContextPath() %>/wish/search" method="get">
           <span>신청일 : </span>
            <input type="month" id="start" name="start"> - 
            <input type="month" id="end" name="end">
            <span> &nbsp;진행상태 선택 : </span>
            <select>
                <option>신청중</option>
                <option>입고완료</option>
                <option>취소완료</option>
            </select>
            <button type="button" class="btn btn-secondary">조회</button>
        </form>
    </div>
    <div class="detailArea">
        <table id="wishDetail" style="border-collapse: collapse;">
            <tr>
                <th width="5%">번호</th>
                <th width="27%">도서명</th>
                <th width="13%">저자</th>
                <th width="13%">신청일</th>
                <th  width="13%">진행상태</th>
                <th width = "8%">취소여부</th>
            </tr>
            <tr id="blank">
                <td align="center"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="20px"></td>
                <td colspan="5">희망 도서 신청 내역이 없습니다.</td>
            </tr>
        </table>
    </div>
     <div id="paging">
        <button onclick="">1</button>
    </div>
    <script>
     document.getElementById('start').value= new Date().toISOString().slice(0, 7);
     document.getElementById('end').value= new Date().toISOString().slice(0, 7);
     $('#blank').attr("width : ")
    </script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>