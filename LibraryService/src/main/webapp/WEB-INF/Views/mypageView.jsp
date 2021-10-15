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
					<div class="current_menu">����������</div>
					<div class="line"></div>
					<a href="mypage"><div class="side_detail">����������</div></a>
					<hr>
					<a href="checkout"><div class="side_detail">������Ȳ</div></a>
					<hr>
					<a href="reservation"><div class="side_detail">������Ȳ</div></a>
					<hr>
					<a><div class="side_detail">ȸ����������</div></a>
				</div>
			</div>
			<div class="main_wrap">
				<!-- ���������� -->
				<div class="border">
					<fieldset class="border1">
						<legend>MY</legend>
						 <div>�̸�</div>
						 <div>��ȭ��ȣ</div>
					</fieldset>
				</div>
				<!-- ������Ȳ -->
				<div class="border">
					<fieldset class="border1 checkout">
						<legend>������Ȳ</legend>
						<div class="test"> ������ å :</div> 
					</fieldset>
				</div>
				<!-- ������Ȳ -->
				<div class="border">
					<fieldset class="border1 reservation">
						<legend>������Ȳ</legend>
						<div> ������ å :</div> 
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