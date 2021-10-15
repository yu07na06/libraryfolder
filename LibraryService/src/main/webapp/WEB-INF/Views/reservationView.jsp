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

<!-- header -->
<jsp:include page="../../header.jsp" />

	<section>
		<div class="wrap">
			<div class="notice_side">
				<div class="side_detail">
					<div class="current_menu">������Ȳ</div>
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
			<div class="notice_main">
				<div><h2>������Ȳ</h2></div>
				<div>
					<div class="book_subject">
						<div>No.</div>
						<div>å ����</div>
						<div>����</div>
						<div>���ǻ�</div>
						<div>���� ��û��</div>
						<div>�Ⱦ� ����</div>
						<div>�Ⱦ� ���� ����</div>
						<div>���</div>
					</div>
					<c:if test= "${count != 0} }">
						<c:forEach var = "list" items="${requestScope.list} ">

						</c:forEach>					
					</c:if>
					<c:if test = "${count eq null }"> <!-- �������� ����Ʈ ����� 0���� �ٲٱ� -->
						<div class="nolist">����� �����ϴ�.</div>
					</c:if>
				
				
				
				
				
				
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
<jsp:include page="../../footer.jsp" />
</body>
</html>