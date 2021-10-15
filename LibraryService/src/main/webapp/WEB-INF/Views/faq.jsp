<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<!-- header -->
<jsp:include page="../../header.jsp" />

	<section>
		<div class ="wrap">
			<div class="notice_side">
				<div class="side_detail">
					<div class="current_menu">FAQ</div>
					<div class="line"></div>
					<a href="notice"><div class="side_detail">��������</div></a>
					<hr>
					<a href="help"><div class="side_detail">�����ϱ�</div></a>
					<hr>
					<a href="faq"><div class="side_detail">FAQ</div></a>
				</div>
				<hr>
			</div>
			<div class="notice_main">
				<div><h2>���ֹ�������</h2></div>
				<div class="qna_wrap">
					<div class="qna_menu1">���� ��Ҵ� ��� �ϳ���?</div>
	        			<div class="qna_menu1-1">
	        			<br>
	        			1. MyPage > ���� ��Ȳ > ��� ��ư ������ ���  ó���� �˴ϴ�.
	        		
	        			</div>
	        			<hr>
	        		<div class="qna_menu2">��й�ȣ�� ��Ծ���� !</div>
	        			<div class="qna_menu1-2">
	        			<br>
	        			1. Login ���������� ���̵�/��й�ȣ ã�⸦ �̿����ּ���
	        		
	        			</div>
	        			<hr>
				</div>
			</div>		
		
		</div>
	</section>
	
	
<!-- footer -->
<jsp:include page="../../footer.jsp" />

<script>
$(".qna_menu1").on("click", function () {
	
	if($('.qna_menu1-1').css("display") == 'none'){
		$('.qna_menu1-1').css("display",'block');
		$('.qna_menu1-1').animate({height : "300px"},500);
	} else{
		$('.qna_menu1-1').animate({height : "0px"},500, function () {
			$('.qna_menu1-1').css("display",'none');
		})
	}
})
$(".qna_menu2").on("click", function () {
		
		if($('.qna_menu1-2').css("display") == 'none'){
			$('.qna_menu1-2').css("display",'block');
			$('.qna_menu1-2').animate({height : "300px"},500);
		} else{
			$('.qna_menu1-2').animate({height : "0px"},500, function () {
				$('.qna_menu1-2').css("display",'none');
			})
		}
	})


</script>

</body>
</html>