<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	
        #content {
            width: 60%;
            padding: 60px 0px 0px 40px;
            margin-right: 100px;
            margin-bottom: 60px;
            display: inline-block;
        }

        #boardtitle {           
            width: 100%;
            font-size: 30px;
            margin-top: 30px;
        }

        #boardtitle h3 {
            padding-bottom: 23px;
            margin: 0;
        }

        #boardtitle hr {
            float: left;
            width: 100%;
            margin: 0;
            opacity: 0.5;        
        }

        #top_empty {
            display: inline-block;
            width: 100%;
            height: 50px;
        }

        #search{
            position: relative;
            top: -18px;
            left: 750px;
            height: 43px;
            width: 350px;
            margin: 0;
            border: 1px solid #b8b8b8;
            border-radius: 7px;
            padding: 3px 60px 3px 5px;
            display: flex;
            align-items: center;
        }

        #search input[type="text"] {
            width: 90%;
            border: none;
        }

        #search button {
            border: 0px;
            position: absolute;
            height: 32px;
            width: 60px;
            right: 9px;
            border-radius: 7px;
        }

        #boardlist {
            width: 100%;
            border-top: 2px solid #3b414d; 
            border-bottom: 1px solid #b8b8b8; 
            border-collapse: collapse;
        }

        .b_num {
            border-left: none;
        }

        .b_count {
            border-right: none;
        }

        .b_num, .b_count, .b_date, .b_ctgr, .b_writer {
            text-align: center;
        }


        #t_h {

            border-bottom: 1px solid #b8b8b8; 
        }

        #boardlist th {
        	padding : 12px;
            border: #b8b8b8 solid 1px;	
            background: #fcfcfc;
            color: #313131;
        }

        #boardlist td {
            border: #b8b8b8 solid 1px;
			padding : 12px;
            color: #5d5d5d;
        }

        #paging {
            padding-top: 40px;
            text-align:center;
            position: relative;
            
        }

        #paging button {
            height: 40px;
            width: 40px;
            border-radius: 6px;
        }

        #write {
            width: 100px;
            height: 40px;
            border-radius: 6px;
            position: absolute;
            right: 20px;
            background: #fcfcfc ;
        }

        #boardlist a {
            text-decoration: none;
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
            <div id="content">
                <div id="boardtitle">
                    <h3>Q & A</h3>
                   	<hr>
                </div>
                <div id="top_empty"></div>
                <fieldset id="search">
                    <input type="text" id="search_box" placeholder="검색어를 입력하세요">
                    <button type="submit">검색</button>
                </fieldset>

                <table id="boardlist">
                    <thead id="t_h">
                        <tr>
                            <th class="b_num">번호</th>
                            <th class="b_ctgr">분류</th>
                            <th class="b_title">제목</th>
                            <th class="b_writer">작성자</th>
                            <th class="b_date">작성일</th>
                            <th class="b_count">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="b_num">5</td>
                            <td class="b_ctgr">회원</td>
                            <td class="b_title"><a href="qnadetail.jsp">탈퇴 요청합니다.</a></td>
                            <td class="b_writer">두*형</td>
                            <td class="b_date">2021-03-13</td>
                            <td class="b_count">10</td>
                        </tr>
                        <tr>
                            <td class="b_num">4</td>
                            <td class="b_ctgr">도서대출</td>
                            <td class="b_title"><a href="qnadetail.jsp">대출도서 연장 신청 어떻게 하나요?</a></td>
                            <td class="b_writer">이*빈</td>
                            <td class="b_date">2021-03-12</td>
                            <td class="b_count">20</td>
                        </tr>
                        <tr>
                        <tr>
                            <td class="b_num">3</td>
                            <td class="b_ctgr">공통</td>
                            <td class="b_title"><a href="qnadetail.jsp">대체공휴일에도 휴관인가요?</a></td>
                            <td class="b_writer">황*혜</td>
                            <td class="b_date">2021-03-11</td>
                            <td class="b_count">30</td>
                        </tr>
                        </tr>
                        <tr>
                            <td class="b_num">2</td>
                            <td class="b_ctgr">도서</td>
                            <td class="b_title"><a href="qnadetail.jsp">책 추천 해주세요</a></td>
                            <td class="b_writer">안*란</td>
                            <td class="b_date">2021-03-12</td>
                            <td class="b_count">40</td>
                        </tr>
                        <tr>
                            <td class="b_num">1</td>
                            <td class="b_ctgr">시설</td>
                            <td class="b_title"><a href="qnadetail.jsp">제 2 열람실 이용 가능한가요?</a></td>
                            <td class="b_writer">엄*인</td>
                            <td class="b_date">2021-03-11</td>
                            <td class="b_count">50</td>
                        </tr>
                    </tbody>
                </table>
                <div id="paging">
                    <button>&lt;&lt;</button>
                    <button>&lt;</button>
                    <button>1</button>
                    <button>&gt;</button>
                    <button>&gt;&gt;</button>
                    <input id="write" type="button" value="글쓰기" onclick="location.href='qnaInsert.jsp'">
                </div>
                
                
            </div>
    </div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>