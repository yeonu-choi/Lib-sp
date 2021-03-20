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
    <title>useGuide</title>
    <style>
         
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

        .guide {
            margin-top: 50px;
            margin-left: 25%;
            width: 65%;
        }

        #tabOuter{
            width: 100%;
            border-bottom: 2px solid rgb(226, 223, 223);
        }

        .tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}

		.tab li {
			float: left;
            border-left: 1px solid rgb(163, 163, 163);
            border-right: 1px solid rgb(163, 163, 163);
            border-top: 1px solid rgb(163, 163, 163);
		}

        .current-tab{
            background-color: rgb(175, 175, 172);
        }

        .current-tab a {
            display: inline-block;
			color: white;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 15px;
            font-weight: 600;
			transition:0.1s;
        }
        
        .current-tab a:hover {
        	color: white;
        }

		.tab li:not(.current-tab) a {
			display: inline-block;
			color: #000;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 15px;
			transition:0.1s;
		}

		.tabcontent {
			display: none;
			padding: 30px 12px;
			color:rgb(56, 56, 56);
		}

		.current {
			display: block;
		}

        .ctitle {
            font-size: 18px;
            font-weight: 600;
        }

        #infoT {
            width: 100%;
            border-top: 2px solid black;
            text-align: center;
        }

        #tab1 {
            margin-top: 30px;
            margin-bottom: 100px;
            margin-left: 50px;
            width:93%;
            height:100%;
        }

        #tab2 {
            margin-top: 30px;
            margin-bottom: 100px;
            margin-left: 50px;
            width:93%;
            height:100%;
        }

        #infoT th, #infoT td:not(.place) {
            height: 60px;
            border-bottom: 1px solid rgb(194, 193, 193);
        }

        #infoT tr:first-child {
            background-color: rgb(236, 244, 253);
            border-bottom: 1px solid rgb(117, 116, 116);
        }
       
        #infoT tr:last-child {
            border-bottom: 2px solid rgb(138, 137, 137);
        }

        #infoT td:not(#infoT td:first-child) {
            border-left: 1px solid rgb(194, 193, 193);
        }

        .place {
            border-bottom: 2px solid rgb(138, 137, 137);
        }

        #info2 {
            margin-top: 50px;
        }

        #infoT td:first-child {
            font-weight: 600;
            background-color: rgb(247, 246, 246);
            color: rgb(107, 106, 106);
        }

        #infoT tr:nth-child(2) td:nth-child(2), 
        #infoT tr:nth-child(5) td:nth-child(2) {
            background-color: rgb(247, 246, 246);
            font-weight: 600;
            color: rgb(107, 106, 106);
        }

        .infoP {
            line-height: 30px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/mainbar-basic.jsp" %>
	<%@ include file="../common/sidebar.jsp" %>
	<div class="menuTitle">
        <span>이용안내</span>
    </div>
    <div class="guide">
        <div id="tabOuter">
        <ul class="tab">
			<li class="current-tab" name="tab1"><a href="#">대출이용안내</a></li>
			<li name="tab2"><a href="#">이용시간 및 휴관일</a></li>
		</ul>
        </div>
        <div id="tab1" class="tabcontent current">
			<p class="ctitle"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="20px">&nbsp;대출대상</p>
            <p><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;KH도서관 대출회원증 소지자<br>
            &nbsp;&nbsp;홈페이지에서 회원 가입 후 방문시 별도의 절차 없이 대출회원증 발급 가능</p>
            <br>
            <p class="ctitle"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="20px">&nbsp;대출예약</p>
            <p><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;대출 가능 상태인 도서(비도서 제외)에 한해 예약 가능</p>
            <br>
            <p class="ctitle"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="20px">&nbsp;대출기한</p>
            <p><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;도 서 → 1인 5권 7일간<br>
                <img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;비도서, 잡지 → 대출총합 1인4점 7일간(과월호만 대출 가능)</p>
            <br>
            <p class="ctitle"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="20px">&nbsp;도서반납</p>
            <p><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;기간내에 반납하여야 하며, 3회 이상 연체자는 KH도서관의 규칙에 따라 대출 정지</p>
            <br>
        </div>

		<div id="tab2" class="tabcontent">
            <div id="info1">
                <p class="ctitle"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="20px">&nbsp;이용시간</p>
                <table id="infoT" style="border-collapse: collapse;">
                    <tr>
                        <th colspan="3">구분</th>
                        <th width="35%">평일</th>
                        <th>토·일요일</th>
                    </tr>
                    <tr>
                        <td class="place" rowspan="6">본관</td>
                        <td colspan="2">문헌정보실</td>
                        <td>09:00 ~ 20:00</td>
                        <td rowspan="2">09:00 ~ 17:00</td>
                    </tr>
                    <tr>
                        <td colspan="2">디지털·간행물실
                            어린이·다누리실</td>
                        <td>09:00 ~ 18:00</td>
                    </tr>
                    <tr>
                        <td colspan="2">시각장애인실</td>
                        <td>09:00 ~ 18:00</td>
                        <td>09:00 ~ 17:00</td>
                    </tr>
                    <tr>
                        <td rowspan="2" width="100px">자율학습실</td>
                        <td>하절기(3월~10월)</td>
                        <td>07:00 ~ 22:00</td>
                        <td>07:00 ~ 22:00</td>
                    </tr>
                    <tr>
                        <td width="200px">동절기(11월~다음해 2월)</td>
                        <td>08:00 ~ 22:00</td>
                        <td>08:00 ~ 22:00</td>
                    </tr>
                    <tr>
                        <td colspan="2">평생학습교실</td>
                        <td>10:00 ~ 21:00</td>
                        <td>10:00 ~ 18:00<br>
                            * 일요일은 운영하지 않습니다.</td>
                    </tr>
                </table>
            </div> 
            <div id="info2">
                <p class="ctitle"><img src="<%=request.getContextPath()%>/resources/image/yw/bicon.png" width="20px">&nbsp;휴관일</p>
                <p class="infoP"><img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;자료실 및 자율학습실 : 매월 둘째, 넷째 월요일 휴관, 법정공휴일(일요일을 제외한 관공서의 공휴일)<br>
                    &nbsp;&nbsp;&nbsp;단, 일요일과 다른 공휴일이 겹칠 경우 휴관<br>
                    <img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;평생학습교실 : 법정 공휴일과 매주 월요일, 일요일 휴강<br>
                    <img src="<%=request.getContextPath()%>/resources/image/yw/dot-gray.jpg" width="10px">&nbsp;임시휴관일 : 관장이 도서의 정리, 보수공사, 장서점검 및 기타의 사유로 휴관이 필요하다고 인정하는 날
                </p>
            </div>   
    </div>
    </div>
    <script>
		$(function() {
			$('ul.tab li').click(function() {
				var active = $(this).attr('name');
                $('.tab li').removeClass('current-tab');
				$('.tabcontent').removeClass('current');
                $(this).addClass('current-tab');
				$('#' + active).addClass('current');
			})
		});
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>