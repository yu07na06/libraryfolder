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
						<div>��������</div>
						<div>�ݳ�����</div>
						<div>����</div>
					</div>
					<div class="line"></div>
					<c:if test= "${checkCount ne 0}"> 
							
						<c:forEach var = "list" items="${checkList}">
							<div class="book_subject">
								<div class="book">��ȣ</div>
								<input type="hidden" value="${list.bookBean.ISBN}">
								<div>${list.bookBean.bookName }</div>
								<div>${list.bookBean.author }</div>
								<div>${list.bookBean.publisher }</div>
								<div>${list.checkOutDate}</div>
								<div>${list.checkInDate}</div>
								<div>${list.bookBean.reservationState}</div>
								<div>
									<input type="button" value="�����ϱ�" onClick="delayCheck('${list.bookBean.reservationState}','${list.checkNum}')">
									<input type="hidden" value="${list.bookBean.reservationState}" class="reserState">
									<input type="hidden" value="${list.checkNum}" class="checkNum">
								</div> 
							</div>
						</c:forEach>	 
									
					</c:if> 
					<c:if test = "${checkCount eq 0 }"> 
						<div class="nolist">����� �����ϴ�.</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
<jsp:include page="../../footer.jsp" />

<script>
$(".book").on("click",function(){
	var ISBN = $(this).next().val();
	location.href="bookDetail?ISBN="+ISBN;
})
function delayCheck(reservationState,checkNum) {

	if(reservationState == "X" || reservationState == "D"){
		alert("���� �� �� �����ϴ�.");
	}else{
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/delay",
			data : {
				checkNum : checkNum
			},
			success:function(data){
				if(data != 0){
					alert("���� �����Ͽ����ϴ�.");
					location.reload();
				}else{
					alert("���� �����Ͽ����ϴ�.")
				}
			}, error:function(data){
				alert("������ �߻��߽��ϴ�.")
				return false;
			}
		});
	}
}

</script>
</body>
</html>