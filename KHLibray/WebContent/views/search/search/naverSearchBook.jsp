<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH도서관</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<style>

		.title {
        	font-weight: 500;
			font-size: 28px;
			padding: 0px 0px 5px 20px;
		}
		
        .searchArea {
            width: 80%;
            height: 30px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            padding: 30px;
            position: relative;
            border : 1px rgb(219, 219, 219) solid;
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
        
        
        #search, #searchBtn {
        	width : 100%;
            height: 28px;
            border : 1px rgb(207, 206, 206) solid;
            font-size: 16px;
        }

        #search {
            padding-left: 5px;
        }
        
        #searchBtn{
        	height: 32px;
        }
        
        label{
        	font-size: 18px;
        	padding : 0px 10px;
        }

</style>
</head>
<body>
	<div class="outer">
		<div><p class="title">희망 도서 검색</p><hr></div>
		<form action="<%= request.getContextPath() %>/wish/search" method="get" >
			<div class="searchArea">
				<div class="selectArea">
					<label>검색어</label>
				</div>
					<div class="textArea">
					<input type="text" name="search" id="search" placeholder="내용을 입력해주세요">
				</div>
				<div class="btnArea">
					<button id="searchBtn" type="submit"><i class="bi bi-search"></i></button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>