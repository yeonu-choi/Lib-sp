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
    	        
       	#wrap{
       		width: 65%;
            height: 80%;
            margin-top: 60px;
            margin-bottom: 80px;
            float : left;
       	}
        
        
        #content {
            width: 1073px;
            margin-right: 200px;
            padding-left: 80px;
            padding-right: 127px;
            display: inline-block;
			
        }


        #boardtitle {            
            width: 1150px;
            font-size: 30px;
        }
        
        #boardtitle h3 {
        	margin-top: 40px;
        	margin-bottom: 40px;
        }


        #boardtitle hr {
            width: 93%;
            opacity: 0.5;        
        }

        #qna dl {
            margin-top: 20px;
            align-items: center;
        }

        #top_empty {
            height: 40px;
        }

        #qna {
            min-height: 500px;
            padding: 0px 0px 40px 0px;
            border-bottom: 1px solid black;
            border-top: 1px solid black;
            font-size: 15px;
            padding-left: 20px;
        }

        dt{
            padding: 10px;
        }


        #qna a{
            text-decoration: none;
            padding-top: 15px;
            padding-bottom: 15px;
            font-weight: bold;
        }

        #qna dd {
            padding : 10px 30px 10px 40px;
            background: #f7f7f7;
            border-bottom: 1px solid #b8b8b8;
        }

        button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@ include file="../common/mainbar-basic.jsp" %>
<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">열린 공간</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">FAQ</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>열린 공간</span>
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
                    <h3>FAQ</h3>
                   	<hr>
                </div>
                <div id="top_empty"></div>
                <div id="qna">
                        <dl>
                            <dt>
                                <a href="">
                                    <span>1.</span>
                                    	도서관 위치와 주차시설을 알려주세요.
                                </a>
                            </dt>
                            <dd>                                
                                    KH도서관 주소와 연락처
                                    - 위치 : 서울시 강남구
                                    - 주차 : 30대
                                    ......                               
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="">
                                    <span>2.</span>
                                   	 자원봉사를 하고 싶습니다.
                                </a>
                            </dt>
                            <dd>
                                
                                -도서관 자원봉사신청은 1365 자원봉사포탈을 통해 등록된 일감 내용을 확인 후 신청 바랍니다.                            
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="">
                                    <span>3.</span>
                                    도서 연장은 어떻게 하나요?
                                </a>
                            </dt>
                            <dd>
                                
                                - 대출기간은 14일이고, 1회에 한하여 반납예정일 이전에 반납연기 가능하며 그 기간은 반납예정일 기준으로 7일간 연장됩니다.                           
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="">
                                    <span>4.</span>
                                    도서관자료의 변상은 어떻게 하나요?
                                </a>
                            </dt>
                            <dd>
                                
                                ※ 서울특별시 금천구 도서관 설치 및 운영에 관한 조례 ....                              
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <a href="">
                                    <span>5.</span>
                                    도서관 휴관일, 이용시간이 궁금합니다.
                                </a>
                            </dt>
                            <dd>                              
                                - 금천구립도서관 홈페이지 메인화면에서 도서관별로 확인하실 수 있습니다.                           
                            </dd>
                        </dl>
                </div>
                    <button id="new" onclick="location.href='faqInsert.jsp'">등록하기</button>
            </div>
    </div>    
    
    
<%@ include file="../common/footer.jsp" %>
</body>
</html>