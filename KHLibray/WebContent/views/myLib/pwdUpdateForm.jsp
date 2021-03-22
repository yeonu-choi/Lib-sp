<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% if(request.getAttribute("result") != null) {
	if(request.getAttribute("result").equals("success")){
%>
	<script>
		alert("성공적으로 비밀번호를 변경했습니다.");
		window.close();
	</script>
<% } else { %>
<script>
	alert("비밀번호 변경에 실패했습니다. 현재 비밀번호를 확인해주세요.");
</script>

<%
	}
}
%>
<style>
   h3 {
      text-align:center;
   }
   /* 테이블 스타일 */
   table{
      margin:auto;
   }
   td {
      text-align:right;
   }
   /* 버튼 관련 스타일 */
   button:hover {
      cursor:pointer
   }
   
   button {
      margin-top:5px;   
      width:110px;
      height:25px;
      color:white;
      background:lightblue;
      border:lightblue;
      border-radius:5px;
   }
</style>
</head>
<body>

<h3>비밀번호 변경</h3>
	<br>
	
	<form id="updatePwdForm" action="<%= request.getContextPath() %>/member/updatePwd"
	method="post" onsubmit="return checkPwd();">
	<table>
		<tr>
			<td> <label>현재 비밀번호</label></td>
			<td width="50"></td>
			<td><input type="password" name="user_pwd" id="user_pwd"
			maxlength="15"></td>			
		</tr>
		<tr>
			<td> <label>변경할 비밀번호</label></td>
			<td width="50"></td>
			<td><input type="password" name="new_pwd" id="new_pwd"
			maxlength="15"></td>			
		</tr>
		<tr>
			<td> <label>변경할 비밀번호 확인</label></td>
			<td width="50"></td>
			<td><input type="password" name="new_pwd2" id="new_pwd2"
			maxlength="15"></td>			
		</tr>
	</table>
	<br><br>
	
	<div class="btns" align="center">
	<button id="updatePwdBtn"> 변경하기</button>
	
	</div>

	</form>

	<script>
	function checkPwd(){
        // 정규표현식을 이용한 유효성 검사 등은 추가할 것
        let user_pwd = document.getElementById('user_pwd');
        let new_pwd = document.getElementById('new_pwd');
        let new_pwd2 = document.getElementById('new_pwd2');
        
        if(user_pwd.value == "" || new_pwd.value == "" || new_pwd2.value == ""){
           alert("비밀번호를 입력해주세요");
           return false;
        }
        
        if(new_pwd.value != new_pwd2.value){
           alert("비밀번호가 다릅니다.");
           new_pwd2.select();
           return false;
        }
        
        return true;
     }
	</script>




</body>
</html>