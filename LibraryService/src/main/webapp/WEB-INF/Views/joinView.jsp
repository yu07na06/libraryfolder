<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Pack01.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- header -->
<jsp:include page="../../header.jsp" />
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<h2>회원가입</h2>
	<form name="login" action="joinPro" method="post" onsubmit="return check()">
 	 	<table width='300px' cellpadding='3' cellspacing='1' align='center'>
 	 		<tr> <td>이름</td> </tr>
 			<tr> <td><input type="text" name="userName" placeholder="이름 입력" value="박유나" required></td> </tr>
 			
 			<!-- 아이디 중복 확인 -->
 	 		<tr> <td>아이디</td> </tr>
 	 		<tr> <td><input type="text" name="userID" id="userID" required> </td> </tr>
 	 		<tr> <td> <span id = "idcheck"></span> </td> </tr>
 	 		
 	 		<tr> <td>비밀번호</td> </tr>
 	 		<tr> <td><input type="password" name="userPW" placeholder="비밀번호 입력" value="1234" required></td> </tr>
 			<tr> <td>휴대전화</td> </tr>
 			<tr> <td><input type="text" name="phone" placeholder="010-****-****" value="010-9298-1199" required></td> </tr>
 			<tr> <td>이메일</td> </tr>
 			<tr> <td><input type="email" name="email" placeholder="이메일 입력" value="yu07na06@naver.com" required></td> </tr>
 			<tr> <td>주소</td> </tr>
 			<tr> <td><input type="text" name="address" placeholder="주소 입력" value="부산광역시" required></td> </tr>
 			<tr> <td>우편번호</td> </tr>
 			<tr> <td><input type="text" name="postNum" placeholder="우편번호 입력" value="12345" required></td> </tr>
 			<tr> <td>생년월일(8자리)</td> </tr>
 			<tr> <td><input type="text" name="birthday" placeholder="19941234"  value="19990706" required></td> </tr>
			<tr> <td> <button id="completeButton" style='background-color:#FFC0CB; color:#ffffff; border:0; border-radius:20px; width:100px; height:30px;'>가입완료</button></td> </tr>
 	 	</table>
 	 </form>

<!-- footer -->
<jsp:include page="../../footer.jsp" />

<script>
	$(function(){
		$("#userID").on('keyup', idcheck);
	})
</script>

<script>
	var localresp;
	function idcheck(){
	    let userid = $("#userID").val();
	    let sendData = {"userID":userid};
	    $.ajax({
	        method : 'POST',
	        url : 'idcheck',
	        data : sendData,
	        success : function(resp){
	        	localresp=resp
	            if(resp=='fail'){
	                $('#idcheck').css('color','red')
	                $('#idcheck').html("사용할 수 없는 아이디입니다.")
	            }else{
	                $('#idcheck').css('color','blue')
	                $('#idcheck').html("사용할 수 있는 아아디입니다.")
	            }}
	    })	
	}
	
	function check(){
		if(localresp=="fail"){
			return false;
		}return true;
	}
</script>


</body>
</html>