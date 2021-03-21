<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.board.model.vo.*, com.khlibrary.search.model.vo.*"%>
<%
	ArrayList<Notice> nlist = (ArrayList<Notice>)request.getAttribute("nlist");
	ArrayList<Book> blist = (ArrayList<Book>)request.getAttribute("blist");
%>
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
            
        }
        
        #mainContent {
        height: 100%;
        }
        
        #mainImg{
            margin: 0;
            padding: 0;
        }

        #mainImg > img {
            display: block;
            width : 100%; 
            height : 300px;
        }

        .mainSearch {
            float: left;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100px;
            background-color: rgb(224, 209, 193);
            position: relative;
            text-align:center;
            border-top: rgb(223, 221, 221) 3px solid;
            border-bottom: rgb(223, 221, 221) 3px solid;
            overflow: hidden;
        }

        .mainSearch form {
            width: 40%;
            height: 50%;
            position: absolute;
            top: 20%;
            bottom: 0;
            left: 28%;
            right: 0;
        }

        .label{
            width: 20%;
            height: 100%;
            float: left;  
        }

        #msearch {
            width: 70%;
            height: 100%;
            float: left;
            border-bottom: white 3px solid;
        }

        #mainbtn {
            width: 10%;
            height: 100%;
            float: left;
        }

        .label p{
            width: 100%;
            height: 100%;
            font-weight: bold;
            color: white;
            font-size: 21px;
            text-align: center;
            float: left;
            line-height: 50px;
            overflow: hidden;
        }

        form #search {
            width: 100%;
            height: 100%;
            background-color: rgb(224, 209, 193);
            border: none;
        }

        #search::placeholder{
            color: white;
            font-size: 18px;
            font-weight: 600;
            text-align: center;
        }
        
        #search:focus {
        	outline:none;
            font-size: 18px;
            font-weight: 600;
        	background-color: rgb(224, 209, 193);
        }

        #msbtn {
            background: url(<%=request.getContextPath() %>/resources/image/yw/searchbtn.png) no-repeat;
            background-position: center;
            background-size: 40% 50%;
            width: 100%;
            height: 100%;
            padding: 0;
            border : none;
            cursor: pointer; 
        }
        
        .mainArea1 {
            width: 100%;
            float: left;
            margin: 0;
            padding: 0;
            position: relative;
            height: 380px;
            overflow: hidden;
        }

        .notice {
            width: 23%;
            height: 350px;
            float: left;
            margin-top: 30px;
            margin-left: 10%;
        }

        #notice td {
            height: 40px;
            padding: 3px;
        }

        .line1 > td {
            font-size: 18px;
            font-weight: 550;
            padding: 10px;
            border-bottom: 2px solid pink;
        }

        .ntitle {
        	display: block;
            width: 250px;
            font-size: 15px;
        }

        .ndate {
            width: 100px;
            font-size: 15px;
        }

        .ntitle:hover {
            cursor: pointer;
        }

        .quickMenu {
            width: 20%;
            height: 350px;
            float: left;
            margin-top: 20px;
            margin-left: 7%;
            border: 2px solid pink;
            border-radius: 10px;
        }

        .imgNews {
            width: 23%;
            height: 350px;
            float: left;
            margin-top: 20px;
            margin-left: 7%;
            margin-right: 6%;
            border: 2px solid pink;
            border-radius: 10px;
            padding: 5px;
        }

        .mainArea2 {
            width: 100%;
            float: left;
            margin: 0;
            padding: 0;
            position: relative;
            height: 300px;
            overflow: hidden;
            margin-bottom: 100px;
        }

        .schedule {
            width: 23%;
            height: 300px;
            float: left;
            margin-top: 30px;
            margin-left: 10%;
        }

        .sInner {
            width: 100%;
            height: 250px;
            float: left;
            padding: 5px;
        }

        .newBook {
            width: 50%;
            height: 450px;
            float: left;
            margin-top: 30px;
            margin-left: 7%;
        }
        
        .bimg{
            padding: 20px;
        }

        .btitle {
            font-size: 12px;
            font-weight: 550;
            color: rgb(80, 80, 80);
        }
		
		.nno {
			display : none;
		}
    </style>
</head>
<body>
	<% if(nlist == null){ %>
	<script>
	window.onload=function(){
	    location.href="<%= request.getContextPath() %>/main";
	}
	</script>
	<% } %>
	<%@ include file="views/common/mainbar-basic.jsp" %>
	
	<div id="mainContent">
    <div id="mainImg">
        <img src="<%=request.getContextPath() %>/resources/image/yw/mainbanner2.png" >
    </div>
    <div class="mainSearch">
        <form action="<%=request.getContextPath() %>/simple/search" method="get">
        	<input type="hidden" name="searchSelect" value="total">
            <div class="label">
            <p>통합검색</p>
            </div>
            <div id="msearch">
            <input type="search" id="search" name="search" placeholder="검색어를 입력해주세요">
            </div>
            <div id="mainbtn">
            <button type="submit" id="msbtn"></button>
            </div>
        </form>      
    </div>
    <div class="mainArea1">
        <div class="notice">
            <table id="notice" width="100%" style="border-collapse:collapse">
                <tr class="line1">
                    <td>공지사항</td>
                    <td class="moreView" align="right">
                    <a href="<%= request.getContextPath() %>/notice">
                        <img src="<%=request.getContextPath() %>/resources/image/yw/plus3.png" width="17px" height="15px">
                    </a>
                    </td>
                </tr>
                <% if(nlist != null) {%>
                <% for(Notice n : nlist) { %>
                <tr>
                	<td class="nno"><%= n.getnNo() %></td>
                    <td class="ntitle" style="white-space: nowrap; overflow:hidden; text-overflow:ellipsis"><%= n.getnTitle() %></td>
                    <td class="ndate" align="center"><%= n.getC_Date() %></td>
                </tr>
                <% } %>
                <% } %>
            </table> 
        </div>
        <script>
        	$(".ntitle").click(function(){
        		var td = $(this).parent();
        		var nno = td.children().eq(0).text();
        		location.href="<%=request.getContextPath() %>/notice/detail?nno=" + nno;
        	});
        </script>     
        <div class="quickMenu">
            <table id="quickMenu" border="0" width="100%" style="border-collapse:collapse">
            <% if(loginUser!=null && !loginUser.getUser_id().equals("admin")) {%>
            <tr>
                <td align="center"><a href="<%= request.getContextPath() %>/mylib/lblist"><img src="<%=request.getContextPath() %>/resources/image/yw/qm1.jpg" width="110px" height="110px"></a></td>
                <td align="center"><a href="<%= request.getContextPath() %>/views/search/wishBookInfo.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm2.jpg" width="110px" height="110px"></a></td>
            </tr>
            <tr>
                <td align="center"><a href="<%= request.getContextPath() %>/views/board/faq.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm3.jpg" width="110px" height="110px"></a></td>
                <td align="center"><a href="<%= request.getContextPath() %>/mylib/lblist"><img src="<%=request.getContextPath() %>/resources/image/yw/qm4.jpg" width="110px" height="110px"></a></td>
            </tr>
            <tr>
                <td align="center"><a href="<%= request.getContextPath() %>/views/libInfo/libMap.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm5.jpg" width="110px" height="110px"></a></td>
                <td align="center"><a href="<%= request.getContextPath() %>/views/board/qna.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm6.jpg" width="110px" height="110px"></a></td>
            </tr>
            <% } else { %>
            <tr>
                <td align="center"><a href="javascript:alert('접근 권한이 없습니다. 로그인 해주세요.');" onfocus="this.blur()"><img src="<%=request.getContextPath() %>/resources/image/yw/qm1.jpg" width="110px" height="110px"></a></td>
                <td align="center"><a href="<%= request.getContextPath() %>/views/search/wishBookInfo.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm2.jpg" width="110px" height="110px"></a></td>
            </tr>
            <tr>
                <td align="center"><a href="<%= request.getContextPath() %>/views/board/faq.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm3.jpg" width="110px" height="110px"></a></td>
                <td align="center"><a href="javascript:alert('접근 권한이 없습니다. 로그인 해주세요.');" onfocus="this.blur()"><img src="<%=request.getContextPath() %>/resources/image/yw/qm4.jpg" width="110px" height="110px"></a></td>
            </tr>
            <tr>
                <td align="center"><a href="<%= request.getContextPath() %>/views/libInfo/libMap.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm5.jpg" width="110px" height="110px"></a></td>
                <td align="center"><a href="<%= request.getContextPath() %>/views/board/qna.jsp"><img src="<%=request.getContextPath() %>/resources/image/yw/qm6.jpg" width="110px" height="110px"></a></td>
            </tr>
            <% } %>
            </table>
        </div>
        <div class="imgNews">
            <div id="carouselExampleFade" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="3000">
                    <img src="<%=request.getContextPath() %>/resources/image/yw/crs1.png" class="d-block w-100" alt="알림사항1" width="300px" height="334px">
                  </div>
                  <div class="carousel-item">
                    <img src="<%=request.getContextPath() %>/resources/image/yw/crs2.png" class="d-block w-100" alt="알림사항2" width="300px" height="334px">
                  </div>
                  <div class="carousel-item">
                    <img src="<%=request.getContextPath() %>/resources/image/yw/crs3.png" class="d-block w-100" alt="알림사항3" width="300px" height="334px">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"  data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"  data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
        </div>
    </div>
    <div class="mainArea2">
        <div class="schedule">
            <table id="schedule" border="0" width="100%" style="border-collapse:collapse">
                <tr class="line1">
                    <td>도서관 일정</td>
                    <td class="moreView" align="right">
                    <a href="">
                        <img src="<%=request.getContextPath() %>/resources/image/yw/plus3.png" width="17px" height="15px">
                    </a>
                    </td>
                </tr>
            </table>
            <div class="sInner">
            <div id="carouselExampleControlsNoTouching" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-interval="false">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="<%=request.getContextPath() %>/resources/image/yw/3.jpg" class="d-block w-100" alt="3월">
                  </div>
                  <div class="carousel-item">
                    <img src="<%=request.getContextPath() %>/resources/image/yw/4.jpg" class="d-block w-100" alt="4월">
                  </div>
                  <div class="carousel-item">
                    <img src="<%=request.getContextPath() %>/resources/image/yw/5.jpg" class="d-block w-100" alt="5월">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>
        </div>
        <div class="newBook">
            <table id="newBook1" border="0" width="100%" style="border-collapse:collapse">
                <tr class="line1">
                    <td>이달의 신간</td>
                    <td class="moreView" align="right">
                    <a href="<%= request.getContextPath() %>/newbooks">
                        <img src="<%=request.getContextPath() %>/resources/image/yw/plus3.png" width="17px" height="15px">
                    </a>
                    </td>
                </tr>
            </table>
            <table id="newBook2" border="0" width="100%" style="border-collapse:collapse">
            	<% if(blist != null) {%>
                <tr>
                 <% for(Book b : blist) { %>
                    <td class="bimg"><a href="<%= request.getContextPath() %>/simple/search?searchSelect=name&search=<%= b.getbName() %>"><img src="<%=request.getContextPath() %>/<%= b.getImgPath() %>/<%= b.getImgName() %>" width="100px" height="150px"></a></td>
               	 <% } %>
                </tr>
                <tr>
                <% for(Book b : blist) { %>
                	<% if(b.getbName().length() < 9) { %>
                    <td class="btitle" name="btitle" align="center"><%= b.getbName() %></td>
                    <% } else { %>
                    <td class="btitle" name="btitle" align="center"><%= b.getbName().substring(0,9) %>...</td>
                    <% } %>
                <% } %>
                </tr> 
                <% } %>
             </table>
        </div>
    </div>
    </div>
	<%@ include file="views/common/footer.jsp" %>
</body>
</html>