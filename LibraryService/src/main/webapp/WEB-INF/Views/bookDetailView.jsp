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
<div>책 제목 : ${detailBook.getBookName()}</div>
<div>책 분류 : ${detailBook.getBookClass()}</div>
<div>책 저자 : ${detailBook.getAuthor() }</div>
<div>책 출판사 : ${detailBook.getPublisher()}</div>
<div>상세 보기 : ${detailBook.getDetail()}</div> --%>

<%-- <c:forEach var="list" items="${detailBook}">
	<div>책 제목 : ${list.bookName }</div>
	<div>책 분류 : ${list.bookClass}</div>
	<div>책 저자 : ${list.author}</div>
	<div>책 출판사 : ${list.publisher}</div>
	<div>상세 내용 : ${list.detail}</div>
</c:forEach> --%>
	<div>
		<div>책 제목 : ${detailBook[0].bookName }</div>
		<div>책 분류 : ${detailBook[0].bookClass}</div>
		<div>책 저자 : ${detailBook[0].author}</div>
		<div>책 출판사 : ${detailBook[0].publisher}</div>
		<div>상세 내용 : ${detailBook[0].detail}</div>
	</div>
	<hr>
	<div>
		<c:forEach var="list" items="${detailBook}">
			<div>${list.bookID}</div>
			<div>${list.reservationState}</div>
			<div>반납일자 : ${list.checkOutBean.checkInDate}</div>
			<c:if test="${list.reservationState eq 'X'}">
				<div>대출중</div>
				<div><input type="button" value="예약하기" onclick="reserCheck(<%-- '${sessionScope.userID}', --%>'${list.bookID }')"></div>
			</c:if>
			
			
			<c:if test="${list.reservationState eq 'O' || list.reservationState eq 'D'}">
				<div>대출 가능</div>
				<div><input type="button" value="에약 불가능"disabled></div>			
			</c:if>
			
			
			<hr>
		</c:forEach>
		
	</div>

</section>


<!-- footer -->
<jsp:include page="../../footer.jsp" />
</body>
</html>