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
		<div class ="wrap">
			<div class="notice_side">
				<div class="side_detail">
					<div class="current_menu">�����ϱ�</div>
					<div class="line"></div>
					<a href="notice"><div>��������</div></a>
					<hr>
					<a href="help"><div class="side_detail">�����ϱ�</div></a>
					<hr>
					<a href="faq"><div class="side_detail">FAQ</div></a>
				</div>	
				<hr>
			</div>
			<div class="notice_main">
				<div><h2>�����ϱ�</h2></div>
				<div>
					<div class="subject">
						<div>No.</div>
						<div>����</div>
						<div>�ۼ���</div>
						<div>��¥</div>
					</div>
					<c:if test= "${count != 0} }">
						<c:forEach var = "list" items="${requestScope.list} ">

						</c:forEach>					
					</c:if>
					<c:if test = "${count eq null }"> <!-- �������� ����Ʈ ����� 0���� �ٲٱ� -->
						<div class="nolist">����� �����ϴ�.</div>
					</c:if>
				
					<div class="write_button">
						<%-- <c:if test=""> --%>
							<button onclick="noticeWrite">�� �ۼ��ϱ�</button>
						<%-- </c:if> --%>
					</div>
				
				
				
				
				</div>
			</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div>
	</section>
	
	
	
<!-- footer -->
<jsp:include page="../../footer.jsp" />


</body>
</html>