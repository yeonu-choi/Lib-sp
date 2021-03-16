<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH도서관</title>
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
            margin-left: 0;
        }

        #sideMenu td {
            border: 1px solid rgb(201, 201, 201);
            cursor: pointer;
        }

        #sideMenu td:first-child {
            border-top: none;
        }

        #sideMenu td p {
            padding-top: 10px;
            font-size: 16px;
            font-weight: 600;
        }
        
        #subTitle {
            float: left;
            margin-left: auto;
            width: 248px;
            height: 80px;
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
        	display: block;
            width: 65%;
            height: 80%;	
            margin-top: 60px;
            margin-bottom: 30px;
            float : left;
            overflow : hidden;
        }

        #content {
            width: 100%;
            display: block;
        }

        #boardtitle {  
            font-size: 28px;
        }

        #boardtitle h3 {
            margin-bottom: 15px;
        }

        hr {
            float: left;
            width: 100%;
            margin: 0;
            opacity: 0.5;        
        }

        #top_empty {
            display: inline-block;
            width: 100%;
            height: 30px;
        }

        #search{
            position: relative;
            float : right;
            height: 25px;
            width: 215px;
            margin-bottom: 25px;
            border: 1px solid #b8b8b8;
            border-radius: 7px;
            padding: 3px 40px 3px 5px;
        }

        #search input[type="text"] {
            display: inline-block;
            width: 90%;
            border: 0;
        }

        #search button {
            border: 0px;
            position: absolute;
            display: inline-block;
            height: 20px;
            width: 40px;
            top: 5px;
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

        .b_num, .b_count, .b_date {
            text-align: center;
        }


        #t_h {

            border-bottom: 1px solid #b8b8b8; 
        }

       #wrap th, #wrap td {
            padding : 12px;
        }

        #wrap th {
            border: #b8b8b8 solid 1px;

            background: #fcfcfc;
            color: #313131;
        }

        #wrap td {
            border: #b8b8b8 solid 1px;

            color: #5d5d5d;
        }

        #paging {
            padding-top: 30px;
            text-align:center;
            position: relative;
            
        }

        #paging button {
            height: 30px;
            width: 30px;
        }

        #write {
            width: 100px;
            height: 30px;
            border-radius: 6px;
            position: absolute;
            right: 20px;
            background: #fcfcfc ;
        }

        #wrap a {
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
        <span><a id="subName" href="">공지사항</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>열린공간</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                        <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/views/board/notice.jsp">공지사항</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/views/board/faq.jsp">FAQ</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/views/board/qna.jsp">Q&A</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/views/board/newbooks.jsp">이달의신간</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
    <div id="wrap">
            <div id="content">
                <div id="boardtitle">
                    <h3>공지사항</h3>
                   <div><hr></div>
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
                            <th class="b_title">제목</th>
                            <th class="b_date">작성일</th>
                            <th class="b_count">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="b_num">5</td>
                            <td class="b_title"><a href="noticedetail.jsp">정리중인 자료목록 예고</a></td>
                            <td class="b_date">2021-03-13</td>
                            <td class="b_count">10</td>
                        </tr>
                        <tr>
                            <td class="b_num">4</td>
                            <td class="b_title"><a href="noticedetail.jsp">3월 토요문화광장 운영 안내</a></td>
                            <td class="b_date">2021-03-12</td>
                            <td class="b_count">20</td>
                        </tr>
                        <tr>
                            <td class="b_num">3</td>
                            <td class="b_title"><a href="noticedetail.jsp">관광사진전국공모전 안내</a></td>
                            <td class="b_date">2021-03-11</td>
                            <td class="b_count">30</td>
                        </tr>
                        <tr>
                            <td class="b_num">2</td>
                            <td class="b_title"><a href="noticedetail.jsp">2021년 어린이 독서회 회원모집 안내</a></td>
                            <td class="b_date">2021-03-10</td>
                            <td class="b_count">40</td>
                        </tr>
                        <tr>
                            <td class="b_num">1</td>
                            <td class="b_title"><a href="">어린이자료실 독서문화프로그램 안내</a></td>
                            <td class="b_date">2021-03-09</td>
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
                    <input id="write" type="button" value="글쓰기" onclick="location.href='noticeInsert.jsp'">
                </div>
            </div>
    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>