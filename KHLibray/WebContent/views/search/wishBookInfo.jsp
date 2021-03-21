<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            margin: auto;
		margin-top: 20px;
            padding: 40px;
        }   

        .inner p {
            font-size: 18px;
            font-weight: 600;
        }

        .inner li {
            font-size:16px;
            color: rgb(71, 71, 71);
		line-height: 1.7em;       
        }

        .btnArea {
            text-align:center;
        }    

        button {
            height: 30px;
            text-align:center;
            margin: 50px 10px 20px 10px;
            border: rgb(216, 215, 215) 1px solid;
            border-radius: 5px;
            padding: 2px 10px;
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

    <div class="outer">
        <div><p class="title">희망 도서 신청</p><hr></div>
        <div class="inner">
            <p><i class="bi bi-book-half"></i>&nbsp;&nbsp;<b>희망도서신청안내</b></p>
            <ul>
                <li>신청 대상 : KH 도서관 대출 회원</li>
                <li>신청 방법 : 희망하는 도서의 소장여부 확인 후 없을 경우, 홈페이지 내 희망도서 신청화면에서 정확한 도서 정보 기재하여 신청</li>
                <li>신청 권수 : 주 1회, 1인 1권</li>
                <li>처리 주기 : 매주 월요일 도서 주문 (도서관 사정에 의해 변경 가능)</li>
                <li>신청자 우선 대출 기간 : 3일 (타인 대리 대출 불가)</li>
            </ul>
            <br>

            <p><i class="bi bi-book-half"></i>&nbsp;&nbsp;<b>희망도서 선정 제외 기준</b></p>
            <ul>
                <li>우리도서관 소장도서, 정리중인 도서, 구입중인 도서</li>
                <li>타회원과 중복 신청 도서</li>
                <li>서지사항(서명, 저자, 출판사)이 불분명한 도서</li>
                <li>품절, 절판 도서</li>
                <li>최신성이 떨어지는 도서(당해년도 포함 5년이내 도서만 가능)</li>
                <li>5만원을 초과하는 고가도서(자료선정위원회 심의 후 구입여부 결정)</li>
                <li>교과서, 대학교재, 참고서, 문제집, 수험서, 워크북 등</li>
                <li>대중서점에서 구입하기 어려운 특수전문도서</li>
                <li>특정 종교의 선전 및 정치색이 귿단성을 띤 편파적인 자료</li>
                <li>영리(저자 및 출판사 관계자) 또는 정치적인 홍보 목적의 신청자료</li>
                <li>기타 우리도서관의 세부 자료선정 기준에 맞지 않는 도서</li>
            </ul>
            <br>

            <p><i class="bi bi-book-half"></i>&nbsp;&nbsp;<b>희망도서 신청 확인방법</b></p>
            <ul>
                <li>'내서재 > 희망도서 신청내역'에서 신청하신 도서의 진행상태를 확인하실 수 있습니다.</li>
            </ul>

            <div class="btnArea">
                <button type="button" onclick="searchPageGo()">소장자료검색</button>
                <button type="button" onclick="wishBookPageGo()">희망도서 신청하기</button>
            </div>
        </div>
    </div>
    
    <script>
    function searchPageGo(){
    	location.href = "<%= request.getContextPath() %>/views/search/simpleSearch.jsp"
    }
    
    function wishBookPageGo(){
    	<% if(loginUser != null) {%>
    		location.href = "<%= request.getContextPath() %>/views/search/wishBook.jsp"
    	<% } else { %>
    		alert('로그인 후 이용이 가능합니다.')
    	<% }%>
    }
    </script>
    
	
	<%-- 푸터 --%>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
