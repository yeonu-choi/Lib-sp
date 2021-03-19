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
<link href='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/list/main.css' rel='stylesheet' />
<script src='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/core/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/interaction/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/daygrid/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/list/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/google-calendar/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/api/fullcalendar/packages/core/locales/ko.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {

      plugins: [ 'interaction', 'dayGrid', 'list', 'googleCalendar' ],

      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listYear'
      },
      locale: 'ko',
      displayEventTime: false, 
      googleCalendarApiKey: 'AIzaSyAWY8-kKod7rbpoUcLq2Gu3WBZDDKqVlfU',

      eventSources: [
          {
            googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
            color: '#a73d3d',
          },
          {
            googleCalendarId: 'nalchip88@gmail.com',
            className: 'KH도서관일정',
            color: '#5f5f5f'
          }
        ],
        
        eventClick: function(arg) {
            window.open(arg.event.url, 'google-calendar-event', 'width=400,height=300,left=600,top=300');

            arg.jsEvent.preventDefault() 
          }
    });

    calendar.render();
  });
  </script>
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
        
        .schedule {
        width : 60%;
        margin-left: 27%;
        margin-top : 50px;
        margin-bottom : 100px;
   		padding: 0;
   		font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    	font-size: 16px;
    	}
        
        
        #calendar {
   		width: 100%;
   		margin: 0 auto;
 		 }
    </style>
</head>
<body>
	<%@ include file="../common/mainbar-basic.jsp" %>
	<div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">도서관 안내</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">도서관일정</a></span>
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
        <span>도서관일정</span>
    </div>
    <div class="schedule">
    <div id='calendar'></div>
 	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>