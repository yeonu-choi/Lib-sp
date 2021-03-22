<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        .memJoin p {
            padding-top: 13px;
            padding-left: 20px;
            color: rgb(255, 255, 255);
        }

        .empa {
            color: red;
            font-size: 14px;
        }

        .passchk {
            margin-top: 50px;
            margin-left: 28%;
            margin-bottom : 200px;
            width: 60%;
            overflow: hidden;
        }
        #tablejoin {
            border-top: 2px solid rgb(68, 68, 68);
            margin-bottom: 20px;
            width: 100%;
        }

        #tablejoin th {
           background-color: rgb(243, 243, 243);
           border-right: 1px solid rgb(214, 214, 214);
           text-align: center;
        }

        #tablejoin tr {
            height: 50px;
            border-bottom: 2px solid rgb(190, 189, 189);
        }

        #tablejoin input {
            width: 90%;
            height: 30px;
            margin-left : 15px;
            background-color: rgb(243, 243, 243);
            border: 1px solid rgb(126, 125, 125);
        }

        .btnArea {
            width: 100%;
            text-align: center;
        }
        sub {
        	color : #1E82FF;
        }
      .starclass {
      	float : right;
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
                        <td align="center"><p class="subm3"><a href="<%=request.getContextPath()%>/views/member/idSearch.jsp">아이디 찾기</a></p></td>
                    </tr>
                    <tr>
                        <td align="center"><p class="subm4"><a href="<%=request.getContextPath()%>/views/member/pwdSearch.jsp">비밀번호 찾기</a></p></td>
                    </tr>
                </table>
            </div>
    </div>
</div>
   

   <div class="menuTitle">
        <span>회원가입</span>
    </div>

    <div class="passchk">
        <form class="passout" id="joinForm" action="<%= request.getContextPath() %>/member/insert"
            method="post" onsubmit="return joinValidate();">
        <div class="starclass">(<span class="empa">*</span>)는 필수 입력사항입니다.</div>
        <table id="tablejoin" style="border-collapse: collapse;">
            <tr>
                 <th width="20%">아이디(<span class="empa">*</span>)</th>
                 <td><input type="text" maxlength="12" name="user_id" required> </td>
           		 <td><button id="idCheck" type="button">중복확인</button></td>
            	 <td><sub>아이디는 영소문자로 시작해서 4~12자 입력(숫자포함 가능)</sub></td>
            </tr>
            <tr>
            	 <th class="join_title">비밀번호(<span class="empa">*</span>)</th>
            	 <td> <input type="password" maxlength="12" name="user_pwd" required> </td>
           		 <td colspan="2"><sub>비밀번호는 영소문자로 시작해서 4~12자 입력(숫자포함 가능)</sub></td>
       		</tr>
        	<tr>
            	 <th class="join_title">비밀번호 확인(<span class="empa">*</span>)</th>
            	 <td><input type="password" maxlength="12" name="user_pwd2" required> </td>
            	 <td></td>
        	</tr>
        	<tr>
            	 <th class="join_title">이름(<span class="empa">*</span>)</th>
            	 <td><input type="text" maxlength="10" name="user_name" required></td>
            	 <td colspan="2"><sub>이름은 한글로 2글자 이상 입력</sub></td>
        	</tr>
        	<tr>   
            	 <th class="join_title">이메일(<span class="empa">*</span>)</th>
            	 <td><input type="email" name="email" size="20" required></td>
            	 <td></td><td></td>
         
        	</tr> 
        	<tr>
            	 <th class="join_title">생년월일</th>
            	 <td><input type="text" name="birth_date" maxlength="8" placeholder="(-없이)"></td>
            	 <td colspan="2"><sub>8자리 숫자로 입력하시오 예시) 19950510</sub></td>
        	</tr>
        	<tr>
           	     <th class="join_title">휴대폰번호</th>
            	 <td><input type="tel" maxlength="11" name="phone" placeholder="(-없이)"></td>
            	 <td></td><td></td>
        	</tr>
        	
        	<tr>   
            	 <th class="join_title">우편번호</th>
            	 <td><input type="text" name="address" class="postcodify_postcode5" readonly></td>   
            	 <td><button id="postcodify_search_button" type="button">검색</button></td><td></td>      
        	</tr> 
        	<tr>   
            	 <th class="join_title">도로명 주소</th>
            	 <td><input type="text" name="address" class="postcodify_address" readonly></td> 
            	 <td></td><td></td>        
        	</tr> 
        	<tr>   
            	 <th class="join_title">상세 주소</th>
            	 <td><input type="text" name="address" class="postcodify_details"></td>
            	 <td></td><td></td>         
        	</tr>  
       </table>
    	<div class="btnArea">
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
         // 비밀번호
         if (!(/^[a-z][a-z\d]{3,11}$/.test($("#joinForm input[name=user_pwd]").val()))) {
             alert("비밀번호는 영소문자로 시작해서 4~12자 입력(숫자포함 가능)");
             $("#joinForm input[name=user_pwd]").select();
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

