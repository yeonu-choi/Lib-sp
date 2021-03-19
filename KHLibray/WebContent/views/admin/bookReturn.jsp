<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.khlibrary.admin.model.vo.*, com.khlibrary.common.model.vo.*" %>
<% 
   	ArrayList<ReturnBook> list = (ArrayList<ReturnBook>)request.getAttribute("list");
   	PageInfo pi = (PageInfo)request.getAttribute("pi");
   	
   	String rank = request.getParameter("rank");
   	String[] rankSelected = new String[2];
   	if(rank != null){
   		if(rank.equals("asc")){
   			rankSelected[0] = "selected";
   		} else {
   			rankSelected[1] = "selected";
   		}
   	}
   	String viewCondition = request.getParameter("viewCondition");
	String[] viewSelected = new String[2];
	if(viewCondition != null){
		if(viewCondition.equals("lid"))
			viewSelected[0] = "selected";
		else
			viewSelected[1] = "selected";
	}
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
        
        .userList {
            margin-top: 50px;
            margin-left: 28%;
            width: 60%;
            height: 350px;
        }

        #subselect {
            width: 100%;
        }

        #viewCondition, #rank, #view {
            float: right;
        }
        
         #viewCondition, #rank {
        	margin-right : 2px;
        	margin-top : 2px;
        }

        #returnbtn {
            background-color: white;
            border: 1px solid gray;
            color: rgb(73, 73, 73);
            border-radius : 3px;
        }

        #userlist {
            margin-top: 3px;
            width: 100%;
            text-align : center;
        }

        #userlist th {
            height: 40px;
            background-color: rgb(139, 138, 138);
            font-size: 14px;
            border-bottom: 2px solid rgb(121, 120, 120);
            border-top : 2px solid rgb(73, 73, 73);
            color: white;
        }

        #blank td {
            height: 250px;
            border-bottom: 2px solid rgb(228, 228, 228);
            background-color: #f8f7f7;
        }
        
        #userlist td:not(#blank td) {
        	height: 40px;
        	background-color: #f8f7f7;
        	border-bottom : 1px solid #c2c2c2;
        }
        
       #userlist tr:not(#blank):last-child{
            border-bottom: 2px solid rgb(121, 120, 120);
        }

        #paging {
            margin-top: 50px;
            margin-left: 28%;
            margin-bottom : 100px;
            width: 60%;
            text-align: center;
        }
        
        #paging button {
        	background-color: white;
            border: 1px solid gray;
            color: rgb(73, 73, 73);
            border-radius : 3px;
        }

        #view {
            background-color: white;
            border: 1px solid gray;
            color: rgb(73, 73, 73);
            border-radius : 3px;
        }
    </style>
</head>
<body>
<%@ include file="../common/mainbar-basic.jsp" %>
<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">관리자</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="<%= request.getContextPath() %>/views/admin/bookReturn.jsp">반납처리</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>관리자</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                   <tr>
                       <td align="center"><p class="subm1"><a href="<%= request.getContextPath() %>/views/admin/bookInsert.jsp">도서 등록</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%= request.getContextPath() %>/admin/manage">회원 관리</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="<%= request.getContextPath() %>/admin/rblist">반납 처리</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%= request.getContextPath() %>/wish/list">희망 도서 확인</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
 <div class="menuTitle">
        <span>반납처리</span>
    </div>
    <div class=userList>
        <table id=subselect style="border-collapse: collapse;">
            <tr>
                <td><button id="returnbtn" name="returnbtn">반납처리</button></td>
                <td>
                <form action="<%= request.getContextPath() %>/admin/rbsort" method="get">
                <button id="view" type="submit">보기</button>
                <select id="rank" name="rank">
                    <option value="desc" <%= rankSelected[1] %>>내림차순</option>
                    <option value="asc" <%= rankSelected[0] %>>오름차순</option>
                </select>
                <select id="viewCondition" name="viewCondition">
                    <option value="lid" <%= viewSelected[0] %>>대출번호</option>
                    <option value="ldate" <%= viewSelected[1] %>>대출일</option>
                </select>   
                </form>
           	 	</td>  
            </tr>
        </table>
        <table id="userlist" style="border-collapse: collapse;">
            <tr>
                <th width="5%"><input type="checkbox" id="chkAll" name="chkAll"></th>
                <th width="10%">대출번호</th>
                <th width="15%">회원아이디</th>
                <th width="30%">도서명</th>
                <th width="20%">대출일</th>
                <th width="20%">상태</th>
            </tr>
            <% if(list.isEmpty()) { %>
            <tr id="blank">
                <td colspan="6" align="center">반납 신청 내역이 없습니다.</td>
            </tr>
            <% } else {%>
					<% for(ReturnBook rb : list) { %>
					<tr>
						<td><input type="checkbox" name="returnChk" class="returnChk"></td>
						<td><%= rb.getLid() %></td>
						<td><%= rb.getUser_id() %></td>
						<td><%= rb.getBk_name() %></td>
						<td><%= rb.getLoan_date() %></td>
						<td><%= rb.getStatus() %></td>
					</tr>
					<% } %>
				<% } %>			
        </table>
    </div>
    
    <script>
    	$("#chkAll").click(function(){
    		$(".returnChk").prop('checked', this.checked);
    	})
    	
    	$("#returnbtn").click(function(){
			var lidList = "";
			
			var chk = $(".returnChk:checked");
    		
    		chk.each(function(i){
    			var tr = chk.parent().parent().eq(i);
    			var td = tr.children();
    			
    			var lid = td.eq(1).text();
    			
    			lidList += lid + "/";
    		});
    		
    		lidList = lidList.substring(0, lidList.length-1);

    	 location.href="<%= request.getContextPath() %>/admin/return?lidList=" + lidList;
    	
    	});
    </script>
    
    <div id="paging">
       		 <!-- 맨 처음으로(<<) -->
       		<% if(pi.getCurrentPage() == 1) { %>
			<button disabled> &lt;&lt; </button>
			<%} else if(viewCondition == null) { %>
			<button onclick="location.href='<%= request.getContextPath() %>/admin/rblist?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/admin/rbsort?currentPage=1&rank=<%=rank%>&viewCondition=<%=viewCondition%>'"> &lt;&lt; </button>
			<% } %>
			<!-- 이전 페이지로(<) -->
			<% if(pi.getCurrentPage() == 1) { %>
			<button disabled> &lt; </button>
			<% } else if(viewCondition == null){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/admin/rblist?currentPage=<%= pi.getCurrentPage() -1 %>'"> &lt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/admin/rbsort?currentPage=<%= pi.getCurrentPage() -1 %>&rank=<%=rank%>&viewCondition=<%=viewCondition%>'"> &lt; </button>
			<% } %>
			<!-- 숫자로 된 페이지 목록 (최대 10개) -->
			<% for(int p = pi.getStartPage(); p<= pi.getEndPage(); p++) { %>
				<% if(p == pi.getCurrentPage()) { %>
				<button style="background:#ececec;" disabled> <%= p %></button>
				<% } else if(viewCondition == null) { %>
				<button onclick="location.href='<%=request.getContextPath()%>/admin/rblist?currentPage=<%= p %>'"><%= p %></button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/admin/rbsort?currentPage=<%= p %>&rank=<%=rank%>&viewCondition=<%=viewCondition%>'"><%= p %></button>
				<% } %>
			<% } %>
			<!--  다음 페이지로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
			<button disabled> &gt; </button>
			<% } else if(viewCondition == null) { %>
			<button onclick="location.href='<%=request.getContextPath()%>/admin/rblist?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/admin/rbsort?currentPage=<%= pi.getCurrentPage() + 1 %>&rank=<%=rank%>&viewCondition=<%=viewCondition%>'"> &gt; </button>
			<% } %>
			<!-- 맨 끝으로(>>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
			<button disabled> &gt;&gt; </button>
			<% } else if(viewCondition == null) { %>
			<button onclick="location.href='<%=request.getContextPath()%>/admin/rblist?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<% } else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/admin/rbsort?currentPage=<%= pi.getMaxPage() %>&rank=<%=rank%>&viewCondition=<%=viewCondition%>'"> &gt;&gt; </button>
			<% } %>
		</div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>