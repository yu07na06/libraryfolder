<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- header -->
<jsp:include page="../../header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
	<section>
		<div class="wrap">
			<div class="notice_side">
				<div class="side_detail">
					<div class="current_menu">마이페이지</div>
					<div class="line"></div>
					<a href="mypage"><div class="side_detail">마이페이지</div></a>
					<hr>
					<a href="checkout"><div class="side_detail">대출현황</div></a>
					<hr>
					<a href="reservation"><div class="side_detail">예약현황</div></a>
					<hr>
					<a><div class="side_detail">회원정보수정</div></a>
				</div>
			</div>
			<div class="main_wrap">
				<!-- 마이페이지 -->
				<div class="border">
					<fieldset class="border1">
						<legend>MY</legend>
						 <div>이름</div>
						 <div>전화번호</div>
					</fieldset>
				</div>
				<!-- 대출현황 -->
				<div class="border">
					<fieldset class="border1 checkout">
						<legend>대출현황</legend>
						<div class="test"> 대출한 책 :</div> 
					</fieldset>
				</div>
				<!-- 예약현황 -->
				<div class="border">
					<fieldset class="border1 reservation">
						<legend>예약현황</legend>
						<div> 예약한 책 :</div> 
					</fieldset>
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
<jsp:include page="../../footer.jsp" />
	
<script>
	$(".checkout").on("click",function(){
		location.href="checkout";
	})
	$(".reservation").on("click",function(){
		location.href="reservation";
	})
</script>


</body>
</html>