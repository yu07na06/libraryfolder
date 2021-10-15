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
<script type="text/javascript">
	function reserCheck() {
		
	}
</script>
<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>

<!-- header -->
<jsp:include page="../../header.jsp" />
<section>
<%-- 
<div>å ���� : ${detailBook.getBookName()}</div>
<div>å �з� : ${detailBook.getBookClass()}</div>
<div>å ���� : ${detailBook.getAuthor() }</div>
<div>å ���ǻ� : ${detailBook.getPublisher()}</div>
<div>�� ���� : ${detailBook.getDetail()}</div> --%>

<%-- <c:forEach var="list" items="${detailBook}">
	<div>å ���� : ${list.bookName }</div>
	<div>å �з� : ${list.bookClass}</div>
	<div>å ���� : ${list.author}</div>
	<div>å ���ǻ� : ${list.publisher}</div>
	<div>�� ���� : ${list.detail}</div>
</c:forEach> --%>
	<div>
		<div>å ���� : ${detailBook[0].bookName }</div>
		<div>å �з� : ${detailBook[0].bookClass}</div>
		<div>å ���� : ${detailBook[0].author}</div>
		<div>å ���ǻ� : ${detailBook[0].publisher}</div>
		<div>�� ���� : ${detailBook[0].detail}</div>
	</div>
	<hr>
	<div>
		<c:forEach var="list" items="${detailBook}">
			<div>${list.bookID}</div>
			<div>${list.reservationState}</div>
			<div>�ݳ����� : ${list.checkOutBean.checkInDate}</div>
			<c:if test="${list.reservationState eq 'X'}">
				<div>������</div>
				<div><input type="button" value="�����ϱ�" onclick="reserCheck(<%-- '${sessionScope.userID}', --%>'${list.bookID }')"></div>
			</c:if>
			
			
			<c:if test="${list.reservationState eq 'O' || list.reservationState eq 'D'}">
				<div>���� ����</div>
				<div><input type="button" value="���� �Ұ���"disabled></div>			
			</c:if>
			
			
			<hr>
		</c:forEach>
		
	</div>

</section>


<!-- footer -->
<jsp:include page="../../footer.jsp" />
</body>
</html>