<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.khlibrary.member.model.vo.Member"%>
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
   String loginId = (String)session.getAttribute("login_id");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainbar-basic</title>
    
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script> -->
    
     <% if(session.getAttribute("msg") != null) { %>
	<script>
	alert(" <%= session.getAttribute("msg")%> ");
	</script>
	<% 
	session.removeAttribute("msg");
	} %>
    <style>
       body {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        #topbar {
            height: 30px;
            border: 1px solid #dddddd;
            background: #f6f6f6;
            position: relative;
        }
        #topmenu {
            list-style-type: none;
            position: absolute;
            right: 150px;
            margin: 3px 0;
        }
        #topmenu li {
            float: right; 
            color: black;
            font-size: 12px;
            font-weight: 700;
        }
        #topmenu li a {
            text-decoration: none;
            color: black;
            font-size: 12px;
            font-weight: 700;
        }
        #top-main {
            height: 130px;
            width: 100%;
        }
       
        #top-logo {
            float: left;
            height: 100%;
            width: 21%;
            position: relative;
        }
  
        #logo {
        	position: absolute;
			top : 25px;
            bottom: 0;
            left: 50px;
            right: 0;
        }
        
        #MenuArea {
            position: relative;
            width: 70%;
            float: left;
            height: 100%;
        }
        .mainMenu {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 25%;
            right: 0;
            margin: auto;
            list-style-type: none;
            overflow: hidden;
        }
        .mainMenu > li {
            float: left;
            padding: 45px;
            display: inline-block;
            color: black;
            text-align: center;
            text-decoration: none;
            font-size: 20px;
            font-weight: 400;
            margin-top: 20px;
        }
        
        .mainMenu > li:hover {
           font-weight : 600;
           color: rgb(209, 31, 114);
           cursor: pointer;
        }
        #top-sub {
            display: none;
            width: 100%;
            height: 40px;
            background-color: rgb(163, 163, 163);
            position: relative;
        }
        #top-sub a {
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
        }
        #top-sub a:hover {
            color: rgb(66, 66, 66);
            font-weight: 600;
        }
        .sub01 {
            list-style-type: none;
            position: absolute;
            left: 38%;
            overflow: hidden;
            margin: 8px 0;
        }
        .sub02 {
            list-style-type: none;
            position: absolute;
            left: 47%;
            overflow: hidden;
            margin: 8px 0;
        }
        .sub03 {
            list-style-type: none;
            position: absolute;
            left: 56%;
            overflow: hidden;
            margin: 8px 0;
        }
        .sub04 {
            list-style-type: none;
            position: absolute;
            left: 64%;
            overflow: hidden;
            margin: 8px 0;
        }
        #top-sub > ul > li {
            float: left;
        }
    </style>
    <script>
         function ShowSub(subNum, e){
            $("#top-sub").slideDown(300);
            $("#top-sub ul").hide(0);
            $(".sub"+subNum).show(0);	
        }
        function HideSub(){
            $("#top-sub").slideUp(300);
        }
    </script>
</head>
<body>
    <div id="topbar">
        <div class="loginArea">
                <ul id="topmenu">
                <% if(loginUser==null) { %>
                    <li><a href="<%=request.getContextPath() %>/views/member/loginForm.jsp">로그인</a></li>
                    <li>&nbsp;&nbsp;<img src="<%=request.getContextPath() %>/resources/image/yw/border_line.jpg">&nbsp;&nbsp;</li>
                    <li><a href="<%=request.getContextPath() %>/views/member/memberJoinForm.jsp">회원가입</a></li>
                <% } else { %>
                	<li><a href="<%= request.getContextPath()%>/member/logout">로그아웃</a></li>
                	<li>&nbsp;&nbsp;<img src="<%=request.getContextPath() %>/resources/image/yw/border_line.jpg">&nbsp;&nbsp;</li>
                	<li><%=loginUser.getUser_name() %>(<%= loginUser.getUser_id() %>) 님 환영합니다</li>
                <% } %>
                </ul>
        </div>
    </div>
    <div id="top-main">
        <div id="top-logo">
            <a id="logo" href="<%= request.getContextPath() %>"><img src="<%=request.getContextPath() %>/resources/image/yw/logo2.jpg" width="80%" height="80%"></a>
        </div>
        <div id="MenuArea">
            <ul class="mainMenu">
                <li class="searchmain" onmouseover="javascript:ShowSub('01', this);">도서검색</li>
                <li class="boardmain" onmouseover="javascript:ShowSub('02', this);">열린공간</li>
                <li class="infomain" onmouseover="javascript:ShowSub('03', this);">도서관안내</li>
                <% if(loginUser!=null && loginUser.getUser_id().equals("admin")) {%> 
                <li class="mylibmain" onmouseover="javascript:ShowSub('04', this);">관리자</li>  
                <% } else { %>
                <li class="mylibmain" onmouseover="javascript:ShowSub('04', this);">내서재</li> 
                <% } %>
            </ul>
        </div>
    </div>
    <div id="top-sub" onmouseleave="javascript:HideSub();">
            <ul class="sub01">
                        <li><a href="<%= request.getContextPath() %>/views/search/simpleSearch.jsp">간략검색</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/views/search/detailSearch.jsp">상세검색</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/views/search/wishBookInfo.jsp">희망도서신청</a>&nbsp;&nbsp;&nbsp;</li>
                        
            </ul>
            <ul class="sub02">
                        <li><a href="<%= request.getContextPath() %>/notice">공지사항</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/faq/list">FAQ</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/qna/list">Q&A</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/newbooks">이달의신간</a>&nbsp;&nbsp;&nbsp;</li>
            </ul>
            <ul class="sub03">
                        <li><a href="<%= request.getContextPath() %>/views/libInfo/useGuide.jsp">이용안내</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/views/libInfo/bookStatus.jsp">도서현황</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/views/libInfo/libSchedule.jsp">도서관일정</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/views/libInfo/libMap.jsp">오시는길</a>&nbsp;&nbsp;&nbsp;</li>
             </ul>
             <ul class="sub04">
             			<% if(loginUser!=null && !loginUser.getUser_id().equals("admin")) {%>
                        <li><a href="<%= request.getContextPath() %>/views/myLib/userUpdate.jsp">회원정보수정</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/mylib/wlist">희망도서신청내역</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/mylib/lblist">대출내역</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/views/myLib/userleave.jsp">회원탈퇴</a>&nbsp;&nbsp;&nbsp;</li>
                        <% } else if(loginUser!= null && loginUser.getUser_id().equals("admin")) {%>
                        <li><a href="<%= request.getContextPath() %>/views/admin/bookInsert.jsp">도서등록</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/admin/manage">회원관리</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/admin/rblist">반납처리</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<%= request.getContextPath() %>/wish/list">희망도서확인</a>&nbsp;&nbsp;&nbsp;</li>
                        <% } else { %>
                        <li><a href="javascript:alert('접근 권한이 없습니다. 로그인 해주세요.');" onfocus="this.blur()">회원정보수정</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="javascript:alert('접근 권한이 없습니다. 로그인 해주세요.');" onfocus="this.blur()">희망도서신청내역</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="javascript:alert('접근 권한이 없습니다. 로그인 해주세요.');" onfocus="this.blur()">대출내역</a>&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="javascript:alert('접근 권한이 없습니다. 로그인 해주세요.');" onfocus="this.blur()">회원탈퇴</a>&nbsp;&nbsp;&nbsp;</li>
                        <% } %>
             </ul>
    </div>
</body>
</html>