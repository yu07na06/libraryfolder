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
					<div class="current_menu">예약현황</div>
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
			<div class="notice_main">
				<div><h2>예약현황</h2></div>
				<div>
					<div class="book_subject">
						<div>No.</div>
						<div>책 제목</div>
						<div>저자</div>
						<div>출판사</div>
						<div>예약 신청일</div>
						<div>픽업 일자</div>
						<div>픽업 가능 여부</div>
						<div>취소</div>
					</div>
					<c:if test= "${count != 0} }">
						<c:forEach var = "list" items="${requestScope.list} ">

						</c:forEach>					
					</c:if>
					<c:if test = "${count eq null }"> <!-- 공지사항 리스트 만들면 0으로 바꾸기 -->
						<div class="nolist">목록이 없습니다.</div>
					</c:if>
				
				
				
				
				
				
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
<jsp:include page="../../footer.jsp" />
</body>
</html>