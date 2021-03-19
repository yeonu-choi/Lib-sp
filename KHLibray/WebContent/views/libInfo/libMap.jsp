<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            margin-top: 0;
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
        
        .menuTitle {
            margin-left: 25%;
            margin-bottom: 50px;
            padding-top : 90px;
            padding-bottom: 20px;
            padding-left: 20px;
            width: 65%;
            border-bottom: 1.5px solid rgb(230, 230, 230);
        }

        .menuTitle span {
            font-weight: 600;
            font-size: 28px;
            padding-bottom: 5px;

        }

        #map {
            margin-left: 27%;
            width:60%;
            height:450px;
        }

        .addinfo {
            width: 60%;
            margin-left: 27%;
            margin-top: 30px;
        }
        #addinfo tr {
            height: 50px;
        }

        #addinfo {
            width: 100%;
            border-top: 2px solid black;
        }

        #addinfo th {
            background-color: rgb(248, 248, 247);
            color: rgb(102, 101, 101);
        }

        #addinfo td {
            font-weight: 550;
            color: rgb(146, 144, 144);
        }

        #fline > th, #fline > td {
            border-bottom: 1px solid rgb(230, 230, 230);
            font-size: 14px;
        }

        #sline > th, #sline > td {
            border-bottom: 2px solid rgb(206, 205, 205);
            font-size: 14px;
        }

        .subt1{
            font-weight: 600;
            font-size: 14px;

        }

        .parkinfo {
            width: 60%;
            margin-left: 27%;
            margin-top: 30px;
            margin-bottom: 100px;
        }

        .subc1 {
            font-size: 14px;
            color: rgb(146, 144, 144);
            font-weight: 550;
        }
        #footer {
        padding-bottom: 0;
        color:#eaeaea;
        background-color:#515665;
        width: 100%;
        margin-left: 0;
        bottom: 0;
        overflow: hidden;
        }

    .fnb {
        position:relative;
        height: 50px;
        border-bottom:1px solid #737685
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
        float:left;
        vertical-align:top;
        padding-left:21px;
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
        text-decoration:underline;
        color: rgb(106, 164, 212);
        }

    .fInner {
        width: 100%;
        margin: 0;
        padding: 40px 50px 60px 150px;
        position:relative;
    }

    .fAdd {
        overflow:hidden;
        }

    .fAdd span {
        display:inline-block;
        font-size: 18px;
        opacity: 0.9;
        }

    .fAdd span:last-child {
        margin-top: 10px;
    }

	 #sideMenu a {
       	text-decoration: none;
       	color: black;
    }

    </style>
    <script>
        $(document).ready(function() {
            $("tr").on("click", function() { 
                    $(this).children().each(function() {
                        $("#subName").text($(this).text());
                    });
                });
            });
    </script>
</head>
<body>
	<%@ include file="../common/mainbar-basic.jsp" %>
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">도서관 안내</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">오시는 길</a></span>
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
    <div class="menuTitle">
        <span>오시는길</span>
    </div>
    <div id="map"></div>
    <div class="addinfo">
        <p class="subt1"><img src="<%=request.getContextPath()%>/resources/image/yw/dot-black.jpg" width="10px">&nbsp;&nbsp;주소 및 연락처</p>
        <table id="addinfo" style ="border-collapse: collapse">
            <tr id="fline">
                <th>주소</th>
                <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울특별시 테헤란로14길 6(역삼동)</td>
            </tr>
            <tr id="sline">
                <th>우편번호</th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;06234</td>
                <th>팩스번호</th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;02)123-4568</td>
            </tr>
        </table>
    </div>
    <div class="parkinfo">
        <p class="subt1"><img src="<%=request.getContextPath()%>/resources/image/yw/dot-black.jpg" width="10px">&nbsp;&nbsp;주차 안내</p>
        <p class="subc1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주차장 운영시간 : 09:00 - 18:00<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주차 요금 : 도서관 이용자에 한해 30분까지는 무료이며, 30분 이후 부터는 5분당 400원씩 가산 (일요일, 공휴일은 무료)<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1일 주차는 시행하지 않음<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴관일은 개방하지 않음<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대외기관 공무로 내관시 무료 (방문부서 확인을 받은 경우에 한함)<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주차요금 감면<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-장애인 (80% 할인) :<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 장애인 복지법 제19조의 규정에 의한 장애인수첩 소지자<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 장애인 자동차 표시부착차량<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;국가유공자 (80% 할인) :<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;국가유공자예우 등에 관한 법률 시행령 제101조 9항에 의한 국가유공자 증서소지자<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경차 (50% 할인) : 800cc 이하<br>
        </p>
    </div>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=32ff15fd0e2ca7132abc803871f6a548"></script>
	<script>
		var mapContainer = document.getElementById('map'), 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.49954630159734, 127.03160610501202), 
		        level: 3, 
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP 
		    }; 

		var map = new kakao.maps.Map(mapContainer, mapOption); 

		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.499066949381934, 127.03291750797112), 
		    map: map 
		});

		var infowindow = new kakao.maps.InfoWindow({
		    content : '<div style="padding-left:40px; font-weight:600"><p id="infow">KH도서관</p></div>' 
		});

		infowindow.open(map, marker);

	</script>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>