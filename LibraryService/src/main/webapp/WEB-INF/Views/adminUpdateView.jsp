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
		</div>
		<div>
		<%
		System.out.println();
		%>
		
		<form method="post" action="bookupdate" id="form_value">
			<p>ISBN<input type="text" name="ISBN" id="ISBN" value="${mm.get(0).getISBN()}"></p>
			<p>��Ϲ�ȣ<input type="text" name="bookID" id="bookID" value="${mm.get(0).getBookID()}"></p>
			<p>�з�<input type="text" name="bookClass" id="bookClass" value="${mm.get(0).getBookClass()}" ></p>
			<p>å�̸�<input type="text" name="bookName" id="bookName" value="${mm.get(0).getBookClass()}" ></p>
			<p>����<input type="text" name="author" id="author"  value="${mm.get(0).getBookClass()}"></p>
			<p>���ǻ�<input type="text" name="publisher" id="publisher"  value="${mm.get(0).getBookClass()}"></p>
			<p>�������<input type="text" name="checkOutState" id="checkOutState" value="${mm.get(0).getBookClass()}" ></p>
			<p>�������<input type="text" name="reservationState" id="reservationState"  value="${mm.get(0).getBookClass()}"></p>
			<p>�������<input type="text"  name="registDate" id="registDate" value="${mm.get(0).getBookClass()}" ></p>
			<p>�����<input type="text" name="register" id="register"  value="${mm.get(0).getBookClass()}"></p>
			<p>���<input type="text"  name="detail" id="detail"  value="${mm.get(0).getBookClass()}"></p>			
		<input type="submit" value="���">
		<input type="button" value="����">
		</form>
		</div>
</section>
	
<jsp:include page="../../footer.jsp" />

</body>
</html>
