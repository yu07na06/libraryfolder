<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table {
		border: 5px solid red;
	}
	th{
		border: 5px solid blue;
	}
</style>
</head>
<body>
<jsp:include page="../../header.jsp" />
<section>
		<div class="wrap">
			<div class="notice_side">
				<div class="side_detail">
					<div class="side_detail">
					<b>������ ������</b>
					</div>	
					<div class="side_detail">
					å ����ϱ�
					</div>					
					<div class="side_detail">
					ȸ�� ����
					</div>	
				</div>			
		</div>		
		<div>
		<form method="post" action="bookjoin" id="form_value">
			<p>ISBN<input type="text" name="ISBN" id="ISBN"></p>
			<p>��Ϲ�ȣ<input type="text" name="bookID" id="bookID"></p>
			<p>�з�<input type="text" name="bookClass" id="bookClass"></p>
			<p>å�̸�<input type="text" name="bookName" id="bookName"></p>
			<p>����<input type="text" name="author" id="author"></p>
			<p>���ǻ�<input type="text" name="publisher" id="publisher"></p>
			<p>�������<input type="text" name="checkOutState" id="checkOutState"></p>
			<p>�������<input type="text" name="reservationState" id="reservationState"></p>
			<p>�������<input type="text"  name="registDate" id="registDate"></p>
			<p>�����<input type="text" name="register" id="register"></p>
			<p>���<input type="text"  name="detail" id="detail"></p>			
		</div>
		<input type="submit" value="���">
		<input type="button" value="����">
		</form>
	</section>
	


	
<jsp:include page="../../footer.jsp" />

</body>
</html>
