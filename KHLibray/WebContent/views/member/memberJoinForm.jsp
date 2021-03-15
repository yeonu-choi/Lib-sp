<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   /* 바깥 영역 */
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
            width: 252px;
        }

        #sideMenu td {
            border: 1px solid rgb(201, 201, 201);
            cursor: pointer;
        }

        #sideMenu td:first-child {
            border-top: none;
        }

        #sideMenu td p {
          
            font-size: 16px;
            font-weight: 600;
        }
        
        
        #subTitle {
            float: left;
            margin-left: auto;
            width: 250px;
            height: 80px;
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
        .outer{
           margin-left : 25%;
    		width : 65%;
      		height : 85%;   
                   
        }
        .join_table {
             margin-top : 6%;
          margin-bottom : 5%;           
            border : 1px solid rgba(0, 0, 0, 0.308);
            align : "center";
            width :100%;    
        }
        .join_title{
         
            background: #dcdcdc;
            font-weight: 400;
            height : 50px;
        }

        button{
   	  		 width:80px;
      		 height:40px;
     		 color:white;
     		 background: #aaaaaa;
     		 border: #aaaaaa;
      		 border-radius:5px;  
   		}   
        sub{
            font-size: 15px;
            color: rgba(0, 81, 255, 0.733);
        }
      
     	input {
  			width:350px;
  			height:40px;
  			font-size:20px;
		}
		h1 {
   		margin-top : 7%;
   	}	
   	
   	
   	
   	
    </style>
</head>
<body>
   <%@ include file="../common/mainbar-basic.jsp" %>

   
   <div class="submArea">
    <div class="bcrumb">
        <span><a id="homebtn" href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/image/yw/homebtnw.png" width="20px" height="20px"></a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="mName" href="">회원가입 및 로그인</a></span>&nbsp;&nbsp;&nbsp;
        <span><a id="subName" href="">회원가입</a></span>
    </div>
    <div class="sidebar">
            <div class="sideMenu">
                <div id="subTitle">
                    <span>회원 가입</span>
                </div>
                <table id="sideMenu" border="0" style="border-collapse:collapse">
                  <tr>
                        <td align="center"><p class="subm1"><a href="<%=request.getContextPath() %>/views/member/loginForm.jsp">로그인</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm2"><a href="<%=request.getContextPath() %>/views/member/memberJoinForm.jsp">회원가입</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm3"><a href="">아이디 찾기</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="">비밀번호 찾기</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
   
   <div class="outer">
        <form id="joinForm" action="<%= request.getContextPath() %>/member/insert"
            method="post" onsubmit="return joinValidate();">
    <h1> 회원가입</h1>
        <hr>
    	<table class = "join_table">
        <tr>
            <th class="join_title">아이디(*)</th>
            <td><input type="text" maxlength="20" name="user_id" required> </td>
            <td><button id="idCheck" type="button">중복확인</button></td>
            <td><sub>아이디는 영소문자로 시작해서 4~12자 입력(숫자포함 가능)</sub></td>
        </tr>
        <tr>
            <th class="join_title">비밀번호(*)</th>
            <td> <input type="password" maxlength="12" name="user_pwd" required> </td>
            <td colspan="2"><sub>!!유효성검사 추후 추가 예정!!</sub></td>
        </tr>
        <tr>
            <th class="join_title">비밀번호 확인(*)</th>
            <td> <input type="password" maxlength="12" name="user_pwd2" required> </td>
        </tr>
        <tr>
            <th class="join_title">이름(*)</th>
            <td><input type="text" maxlength="10" name="user_name" required></td>
            <td colspan="2"><sub>이름은 한글로 2글자 이상 입력</sub></td>
        </tr>
        <tr>
            <th class="join_title">생년월일</th>
            <td><input type="text" name="birth_date" placeholder="(-없이)"></td>
            <td colspan="2"><sub>8자리 숫자로 입력하시오 예시) 19950510</sub></td>
        </tr>
        <tr>
            <th class="join_title">휴대폰번호</th>
            <td><input type="tel" maxlength="11" name="phone" placeholder="(-없이)"></td>
        </tr>
        <tr>   
            <th class="join_title">이메일</th>
            <td><input type="email" name="email" size="20"></td>
         
        </tr> 
        <tr>   
            <th class="join_title">우편번호</th>
            <td><input type="text" name="address" class="postcodify_postcode5" readonly></td>   
            <td><button id="postcodify_search_button" type="button">검색</button></td>      
        </tr> 
        <tr>   
            <th class="join_title">도로명 주소</th>
            <td><input type="text" name="address" class="postcodify_address" readonly></td>         
        </tr> 
        <tr>   
            <th class="join_title">상세 주소</th>
            <td><input type="text" name="address" class="postcodify_details"></td>         
        </tr>  
    </table>
    <div class="btnArea" align="center">
        <button id="goMainBtn" type="button">메인으로</button>
        <button id="joinBtn">가입하기</button>
        </div>
    <br>
    </form>
</div>
   
   <!-- postcodify -->
   <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

   <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
   <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
   
	<script>
      // 1. 메인으로 돌아가기
      const goMainBtn = document.getElementById("goMainBtn");
      goMainBtn.addEventListener("click", function(){
         location.href='<%= request.getContextPath()%>';
      });
      
   // 2. 유효성 검사
      function joinValidate() {
         // 아이디
         if (!(/^[a-z][a-z\d]{3,11}$/.test($("#joinForm input[name=user_id]").val()))) {
            alert("아이디는 영소문자로 시작해서 4~12자 입력(숫자포함 가능)");
            $("#joinForm input[name=user_id]").select();
            return false;
         }
         
         // 비밀번호 일치여부
         if ($("#joinForm input[name=user_pwd]").val() != $("#joinForm input[name=user_pwd2]").val()) {
            $("#pwdResult").text("비밀번호불일치").css("color", "red");
            return false;
         }
         
         // 이름
         if (!(/^[가-힣]{2,}$/.test($("#joinForm input[name=user_name]").val()))) {
            alert("이름은 한글로 2글자 이상 입력");
            $("#joinForm input[name=user_name]").select();
            return false;
         }
         
         return true;
      }
   
 
   	$(function(){
   		
   	
   		var isUsable = false;
   		
   	
   		$("#idCheck").click(function(){
   			   			
   		
   			var user_id = $("#joinForm input[name='user_id']");	
   			
   			if(!user_id || user_id.val().length < 4){
   				alert("아이디는 최소 4자리 이상이어야 합니다.");
   				user_id.focus();
   			} else {
   				$.ajax({
   					url : "<%= request.getContextPath()%>/member/idCheck",
   					type : "post",
   					data : { user_id : user_id.val() },
   					success : function(data){
   						if(data == "fail"){
   							alert("사용할 수 없는 아이디입니다.");
   							user_id.focus();
   						} else {
   							if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
   								user_id.prop('readonly', true); 
   								isUsable = true;
   							} else {
   								user_id.prop('readonly', false); 
   				
   								user_id.focus();
   								isUsable = false;
   							}
   						}
   						
   						if(isUsable){
   							$("#joinBtn").removeAttr("disabled");
   						} else {
   							$("#joinBtn").attr("disabled", true);
   						}  						
   					},
   					error : function(e){
   						console.log(e);
   					}
   					
   				});
   			}
   			
   		});
   	}); 
   </script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>

