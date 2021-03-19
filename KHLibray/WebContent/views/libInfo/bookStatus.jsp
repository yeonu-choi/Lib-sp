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
            padding-top : 95px;
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

        #bcdt {
            margin-top: 30px;
            margin-left: 28%;
            width:60%;
            height:520px;
            overflow: hidden;
        }

        .book, .nonbook {
            width: 100%;
            border-top: 3px solid rgb(224, 223, 223);
        }

        #nbct {
            margin-top: 50px;
            margin-left: 28%;
            margin-bottom: 100px;
            width:60%;
            height:400px;
            
        }

        #bcdt th, #bcdt td, #nbct th, #nbct td{
            height: 50px;
            border-bottom: 1px solid rgb(228, 228, 228);
            text-align : center;
        }

        .book tr:first-child{
            background-color: rgb(201, 199, 199);
            border-bottom: 3px solid rgb(228, 228, 228);
            color: white;
        }
        
        .book tr:first-child th {
        	border-left : 1px solid rgb(228, 228, 228);
        }
        
        .book tr:last-child {
            border-bottom: 3px solid rgb(228, 228, 228);
        }

        .book td:not(td:first-child) {
            border-left: 1px solid rgb(228, 228, 228);
        }

        .book tr:not(tr:first-child){
            color: rgb(87, 86, 86);
        }

        #bcdt p, #nbct p{
            font-size: 18px;
            font-weight: 700;
        }

        .nonbook tr:first-child{
            background-color: rgb(201, 199, 199);
            border-bottom: 3px solid rgb(228, 228, 228);
            color: white;
        }

        .nonbook tr:last-child {
            border-bottom: 3px solid rgb(228, 228, 228);
        }

        .nonbook th:not(th:first-child) {
            border-left: 1px solid rgb(228, 228, 228);
        }

        .nonbook td:not(td:first-child) {
            border-left: 1px solid rgb(228, 228, 228);
        }

        .nonbook tr:not(tr:first-child){
            color: rgb(87, 86, 86);
        }

        .book td, .nonbook td {
            font-size: 15px;
        }

    </style>
</head>
<body>
    <%@ include file="../common/mainbar-basic.jsp" %>
<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">도서관 안내</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">도서현황</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>도서관 안내</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                        <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/views/libInfo/useGuide.jsp">이용 안내</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/views/libInfo/bookStatus.jsp">도서 현황</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/views/libInfo/libSchedule.jsp">도서관 일정</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/views/libInfo/libMap.jsp">오시는 길</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
	<div class="menuTitle">
        <span>도서현황</span>
    </div>
    <div id="bcdt">
        <p><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="15px">&nbsp;도서 (단위:권) 2021.03.10 현재</p>
        <table class="book" style ="border-collapse: collapse">
            <tr>
                <th colspan="2">구분</th>
                <th>총류</th>
                <th>철학</th>
                <th>종교</th>
                <th>사회과학</th>
                <th>자연과학</th>
                <th>기술과학</th>
                <th>예술</th>
                <th>언어</th>
                <th>문학</th>
                <th>역사</th>
                <th>합계</th>
            </tr>
            <tr>
                <td rowspan="3" align="center">일반</td>
                <td align="center">국내</td>
                <td align="center">5,342</td>
                <td align="center">7,500</td>
                <td align="center">3,841</td>
                <td align="center">22,736</td>
                <td align="center">4,462</td>
                <td align="center">11,574</td>
                <td align="center">7,135</td>
                <td align="center">4,077</td>
                <td align="center">33,088</td>
                <td align="center">7,989</td>
                <td align="center">107,744</td>
            </tr>
            <tr>
                <td align="center">서양</td>
                <td align="center">8</td>
                <td align="center">22</td>
                <td align="center">10</td>
                <td align="center">83</td>
                <td align="center">55</td>
                <td align="center">26</td>
                <td align="center">36</td>
                <td align="center">16</td>
                <td align="center">2,223</td>
                <td align="center">149</td>
                <td align="center">2,628</td>
            </tr>
            <tr>
                <td align="center">소계</td>
                <td align="center">5,350</td>
                <td align="center">7,522</td>
                <td align="center">3,851</td>
                <td align="center">22,819</td>
                <td align="center">4,517</td>
                <td align="center">11,600</td>
                <td align="center">7,171</td>
                <td align="center">4,093</td>
                <td align="center">35,311</td>
                <td align="center">8,138</td>
                <td align="center">110,372</td>
            </tr>
            <tr>
                <td rowspan="3" align="center">어린이</td>
                <td align="center">국내</td>
                <td align="center">964</td>
                <td align="center">984</td>
                <td align="center">283</td>
                <td align="center">3,886</td>
                <td align="center">4,088</td>
                <td align="center">1,047</td>
                <td align="center">861</td>
                <td align="center">704</td>
                <td align="center">20,704</td>
                <td align="center">3,829</td>
                <td align="center">37,350</td>
            </tr>
            <tr>
                <td align="center">서양</td>
                <td align="center">51</td>
                <td align="center">3</td>
                <td align="center">24</td>
                <td align="center">311</td>
                <td align="center">398</td>
                <td align="center">93</td>
                <td align="center">103</td>
                <td align="center">1,931</td>
                <td align="center">4,523</td>
                <td align="center">231</td>
                <td align="center">7,668</td>
            </tr>
            <tr>
                <td align="center">소계</td>
                <td align="center">1,015</td>
                <td align="center">987</td>
                <td align="center">307</td>
                <td align="center">4,197</td>
                <td align="center">4,486</td>
                <td align="center">1,140</td>
                <td align="center">964</td>
                <td align="center">2,635</td>
                <td align="center">25,227</td>
                <td align="center">4,060</td>
                <td align="center">45,018</td>
            </tr>
            <tr>
                <td colspan="2" align="center">합계</td>
                <td align="center">6,365</td>
                <td align="center">8,509</td>
                <td align="center">4,158</td>
                <td align="center">27,016</td>
                <td align="center">9,003</td>
                <td align="center">12,740</td>
                <td align="center">8,135</td>
                <td align="center">6,728</td>
                <td align="center">60,538</td>
                <td align="center">12,198</td>
                <td align="center">155,390</td>
            </tr>
        </table>
    </div>
    <div id="nbct">
        <p><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="15px">&nbsp;비도서 (단위:점)</p>
        <table class="nonbook" style ="border-collapse: collapse">
            <tr>
                <th>구분</th>
                <th>수량</th>
                <th>비고</th>
            </tr>
            <tr>
                <td align="center">CD</td>
                <td align="center">120</td>
                <td align="center">오디오CD</td>
            </tr>
            <tr>
                <td align="center">CD-Rom</td>
                <td align="center">107</td>
                <td align="center"></td>
            </tr>
            <tr>
                <td align="center">DVD</td>
                <td align="center">8,503</td>
                <td align="center"></td>
            </tr>
            <tr>
                <td align="center">기타</td>
                <td align="center">219</td>
                <td align="center">오디오북</td>
            </tr>
            <tr>
                <td align="center">합계</td>
                <td align="center">8,949</td>
                <td align="center"></td>
            </tr>
        </table>
    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>