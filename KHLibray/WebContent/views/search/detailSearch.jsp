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
		
		.inner {
			width:90%;
			margin:auto;
        	margin-top: 60px;
        	border : 1px rgb(219, 219, 219) solid;
            border-top: 2px rgb(138, 137, 137) solid;
            padding: 50px;
		}

        .searchArea ul {
        	width:100%;
            list-style: none;
            
        }

        .searchArea li {
            width: 90%;
            min-width: 650px;
            height: 40px;
            font-size: 16px;
            margin:auto;
            padding:10px;
        }

        .searchArea label {
            width: 150px;
            display: inline-block;
            text-align: center;
            padding: 6px;
            border: 1px rgb(218, 215, 215) solid;
            border-radius: 5px;
        }
        

        .input_area {
            width : 70%;
            margin: 5px;
            display: inline-block;
            text-align: left;
        }

        #bName {
            width: 100%;
        }

        .input_area input{
            width: 80%;
            height: 31px;
            border: 1px rgb(216, 211, 211) solid;
            padding-left: 5px;
        }

        #tDate, #fDate{
            width: 20%;
        } 


        .btnArea {
            text-align:center;
        }    

        button {
         	width: 100px;
            height: 30px;
            text-align:center;
            margin: 30px 10px 5px 10px;
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
        <span><a id="subName" href="">상세 검색</a></span>
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
                        <td align="center"><p class="subm3">
                        <% if(lu != null) {%>
                        <a href="<%= request.getContextPath() %>/views/search/wishBook.jsp">희망 도서 신청</a>
                        <% } else { %>
                        <a href="#" onClick="alert('로그인 후 이용이 가능합니다.')">희망 도서 신청</a>
                        <% }%>
                        </p></td>
                    </tr>
                </table>
            </div>
    	</div>
	</div>

	<%-- 본문 --%>
	<div class="outer">
        <div><p class="title">상세 검색</p><hr></div>
        <div class="inner">
            <form action="<%= request.getContextPath() %>/detail/search" method="get">
                <div class="searchArea">
                    <ul>
                        <li>
                            <label>서명</label>
                            <span class="input_area"><input type="text" name="bName" id="bName"></span>
                        </li>
                        <li>
                            <label>저자</label>
                            <span class="input_area"><input type="text" name="bWriter" id="bWriter"></span>
                        </li>
                        <li>
                            <label>발행처</label>
                            <span class="input_area"><input type="text" name="bPublisher" id="bPublisher"></span>
                        </li>
                        <li>
                            <label>ISBN</label>
                            <span class="input_area"><input type="text" name="isbn" id="isbn"></span>
                        </li>
                        <li>
                            <label>발행연도</label>
                            <span class="input_area"><input type="text" name="tDate" id="tDate">
                            부터&nbsp;
                            <input type="text" name="fDate" id="fDate">
                            까지&nbsp;</span>
                        </li>
                    </ul>
                </div>

                <div class="btnArea">
                    <button type="submit"><i class="bi bi-search"></i> 검색</button>
                    <button type="button" onclick="location.reload() ">초기화</button>
                </div>

            </form>
        </div>
    </div>
    
    <%-- 푸터 --%>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>