<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%@ include file="../common/mainbar-basic.jsp" %>	<%-- 헤더 부분 --%>
	<%-- 사이드바 --%>
	<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">도서 검색</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">간략 검색</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>도서 검색</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                    <tr>
                        <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/views/search/briefSearch.jsp">간략 검색</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/views/search/detailSearch.jsp">상세 검색</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/views/search/wishBook.jsp">희망 도서 신청</a></p></td>
                    </tr>
                </table>
            </div>
    	</div>
	</div>

	<%-- 본문 --%>
    <div class="outer">
        <div><p class="title">간략 검색</p><hr></div>
        <div class="inner">
            <form action="" method="get">
                <div class="searchArea">
                    <div class="selectArea">
                    	<select name="searchSelect" id="searchSelect">
                        	<option>전체</option>
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

            <div class="listArea"><p>요청하신 에 대한 자료 검색 결과이며 총 건이 검색되었습니다.</p></div>
	
            <form action="" method="POST">
                <div class="resultArea">
                    <div class="resultBook" >
                        <input type="hidden" value="">
                        <div class="bookImg"><img src="<%= request.getContextPath() %>/resources/image/bookImg/14427514.jpg"></img></div>
                        <div class="book">
                            <div class="bName">생활코딩! HTML + CSS + 자바스크립트</div>
                            <div><span>저자 : 이고잉 지음 | </span>
                                <span>발행처 : 위키북스 | </span>
                                <span>발행연도 : 2017</span></div>
                            <div><span>ISBN : 9791158391331 | </span>
                                <span>청구 기호 : 005.118-ㅇ664사</span></div>
                            <div>재고 여부 : N</div>
                        </div>
                        <span class="chk"><input type="checkbox"></span>
                    </div>
                    
                    <div class="resultBook" >
                        <input type="hidden" value="">
                        <div class="bookImg"><img src="<%= request.getContextPath() %>/resources/image/bookImg/14427514.jpg"></img></div>
                        <div class="book">
                            <div class="bName">생활코딩! HTML + CSS + 자바스크립트</div>
                            <div><span>저자 : 이고잉 지음 | </span>
                                <span>발행처 : 위키북스 | </span>
                                <span>발행연도 : 2017</span></div>
                            <div><span>ISBN : 9791158391331 |</span>
                                <span>청구 기호 : 005.118-ㅇ664사</span></div>
                            <div>재고 여부 : N</div>
                        </div>
                        <span class="chk"><input type="checkbox"></span>
                    </div>
 
                </div> 

                <div class="pageArea">
                    <a href=""><i class="bi bi-chevron-double-left"></i></a>
                    <a href=""><i class="bi bi-chevron-compact-left"></i></a>

                    <script>
                        // 리스트 가져올때 고칠 것
                        for(var i = 1; i<=1; i++){
                            document.write("<a href=''>" + i +"</a>");
                        }
                    </script>
                    
                    <a href=""><i class="bi bi-chevron-right"></i></a>
                    <a href=""><i class="bi bi-chevron-double-right"></i></a>
                </div>

                <div class="loansArea">
                    <button type="submit">대출 예약</button>
                    <button type="button" onclick="location.reload()">선택 취소</button>
                </div>

            </form>
        </div>
    </div>
    
    <%-- 푸터 --%>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>