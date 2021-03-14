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

        .userinfo {
            margin-top: 50px;
            margin-left: 28%;
            width: 60%;
        }

        .userinfo > .ititle {
            font-size: 18px;
            font-weight: 700;
        }

        .userinfo p:not(.ititle){
            font-size: 14px;
            display: inline-block;
            margin-top: 3px;
            
        }

        .stitle {
            margin-left: 25px;
        }

        #username {
            font-weight: 550;
        }

        .loanList {
            margin-top: 50px;
            margin-left: 28%;
            width: 60%;
            height: 350px;
        }

        #subselect {
            width: 100%;
            border-bottom: 2px solid black;
        }

        #subselect td{
            padding-bottom: 2px;
        }

        #searchCondition, #rank, #view {
            float: right;
        }

        #subselect tr:first-child td:last-child{
            width: 50px;
        }

        #return {
            background-color: white;
            border: 1px solid gray;
            color: rgb(73, 73, 73);
        }

        #loanlist {
            margin-top: 3px;
            width: 100%;
        }

        #loanlist th {
            height: 40px;
            background-color: rgb(139, 138, 138);
            font-size: 14px;
            border-bottom: 2px solid rgb(121, 120, 120);
            color: white;
        }

        #blank td {
            height: 250px;
            border-bottom: 2px solid rgb(228, 228, 228);
            background-color: rgb(241, 239, 239);
        }

        #paging {
            margin-top: 50px;
            margin-left: 27%;
            width: 60%;
            text-align: center;
            margin-bottom : 100px;
        }

        #view {
            background-color: white;
            border: 1px solid gray;
            color: rgb(73, 73, 73);
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
        <span><a id="subName" href="">대출내역</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>대출 내역</span>
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
        <span>대출내역</span>
    </div>
    <div class="userinfo">
        <p class="ititle"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="15px">&nbsp;이용자 대출 상태</p>
        <p class="stitle"><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp; 이용자 이름 : </p>
        <p id="username" name=username>김코딩</p>
        <p id="grade" name="grade">(정회원)</p><br>
        <p class="stitle"><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp; 이용자 번호 : </p>
        <p id="userno" name=userno></p><br>
        <p class="stitle"><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp; 회원 상태 : </p>
        <p id="userstat" name=userstat>정상</p><br>
    </div>
    <div class=loanList>
        <table id=subselect style="border-collapse: collapse;">
            <tr>
                <td><button id="return" name="return">반납신청</button></td>
                <td>
                <select id="searchCondition">
                    <option>반납예정일</option>
                    <option>대출번호</option>
                    <option>대출일</option>
                    <option>상태</option>
                </select>
                <select id="rank">
                    <option>내림차순</option>
                    <option>오름차순</option>
                </select>
            </td>
            <td><button id="view">보기</button></td>
            </tr>
        </table>
        <table id="loanlist" style="border-collapse: collapse;">
            <tr>
                <th><input type="checkbox" name="returnChk"></th>
                <th>대출번호</th>
                <th>도서명</th>
                <th>저자명</th>
                <th>출판사</th>
                <th>대출일</th>
                <th>반납예정일</th>
                <th>상태</th>
            </tr>
            <tr id="blank">
                <td colspan="8" align="center">대출 내역이 없습니다.</td>
            </tr>
        </table>
    </div>
    <div id="paging">
        <button onclick="">1</button>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>