<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
body {
	margin: 0;
	padding: 0;
}

#footer {
	padding-bottom: 0;
	color: #eaeaea;
	background-color: #515665;
	width: 100%;
	margin-left: 0;
	bottom: 0;
	overflow: hidden;
}

.fnb {
	position: relative;
	height: 50px;
	border-bottom: 1px solid #737685
}

.fnb ul {
	list-style-type: none;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 90px;
	right: 0;
}

.fnb li {
	float: left;
	vertical-align: top;
	padding-left: 21px;
	margin-top: 10px;
}

.fnb a {
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	font-weight: 550;
	opacity: 0.8;
}

.fnb a:hover {
	text-decoration: underline;
	color: rgb(106, 164, 212);
}

.fInner {
	width: 100%;
	margin: 0;
	padding: 40px 50px 60px 150px;
	position: relative;
}

.fAdd {
	overflow: hidden;
}

.fAdd span {
	display: inline-block;
	font-size: 15px;
	opacity: 0.9;
}

.fAdd span:last-child {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div id="footer">
		<div class="fnb">
			<ul class="info">
				<li><a href="">이용약관</a></li>
				<li><img
					src="<%=request.getContextPath()%>/resources/image/yw/borderline3.jpg"></li>
				<li><a href="">개인정보처리방침</a></li>
				<li><img
					src="<%=request.getContextPath()%>/resources/image/yw/borderline3.jpg"></li>
				<li><a href="">영상정보처리기기방침</a></li>
				<li><img
					src="<%=request.getContextPath()%>/resources/image/yw/borderline3.jpg"></li>
				<li><a href="">이메일무단수집거부</a></li>
			</ul>
		</div>
		<div class="fInner">
			<div class="fAdd">
				<span>(우)06234 서울특별시 강남구 테헤란로14길 6&nbsp;&nbsp;</span> <img
					src="<%=request.getContextPath()%>/resources/image/yw/borderline3.jpg">
				<span class="tel">&nbsp;&nbsp;TEL. 02-123-4567&nbsp;&nbsp;</span> <img
					src="<%=request.getContextPath()%>/resources/image/yw/borderline3.jpg">
				<span class="tel">&nbsp;&nbsp;FAX. 02-123-4568</span><br> <span>Copyright©
					2021. KH Library. All Rights Reserved.</span>
			</div>
		</div>
	</div>
</body>
</html>