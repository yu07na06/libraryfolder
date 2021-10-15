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
<script type="text/javascript">
   var request = new XMLHttpRequest();
   function searchFunction() {
	  var searchItem = document.getElementById("searchItem").value;
	  var searchText = document.getElementById("searchText").value;
      var url = "./adminbooksearch?searchItem="+searchItem+"&searchText="+searchText;
      request.open("POST",url, true);
      request.onreadystatechange = searchProcess;
      request.send(null);
   }
   function searchProcess() {
      var table = document.getElementById("ajaxTable");
      table.innerHTML = "";
      if(request.readyState == 4 && request.status == 200){
         var object = eval('(' + request.responseText + ')');
         var result = object.result;
         for(var i = 0 ; i < result.length; i++){
            var row = table.insertRow(0);
            for(var j = 0; j < result[i].length; j++){
            	var a = result[i][j].value;
            	var b = result[i][1].value;
               var cell = row.insertCell(j);
               cell.innerHTML = '<a href="adminUpdate?bookID='+b+'">'+a+'</a>';
            }
         }
      }
   }
   window.onload = function() {
	   searchFunction();
	}
</script>
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
		<select name="searchItem" id="searchItem" onclick="searchFunction()">
                  <option value="BookName">å����</option>
                  <option value="Author">����</option>
                  <option value="Publisher">���ǻ�</option>                  
            </select>
            <div class='col-xs-8'>
            <input class="form-control" type="text" id="searchText" onkeyup="searchFunction()" size="20" placeholder="�˻�� �Է����ּ���">
         </div>
         <div class="col-xs-2">
            <button type="button" class="btn btn-primary" onclick="searchFunction();">�˻�</button>
         </div>
		</div>
		<table class="table"
         style="text-align: center; border: 1px solid #dddddd;">
         <thead>
            <tr>
               <th style="background-color: #fafafa; text-align: center;">ISBN</th>
               <th style="background-color: #fafafa; text-align: center;">��Ϲ�ȣ</th>               
               <th style="background-color: #fafafa; text-align: center;">�з�</th>
               <th style="background-color: #fafafa; text-align: center;">å �̸�</th>
               <th style="background-color: #fafafa; text-align: center;">����</th>
               <th style="background-color: #fafafa; text-align: center;">���ǻ�</th>
               <th style="background-color: #fafafa; text-align: center;">�������</th>
               <th style="background-color: #fafafa; text-align: center;">�������</th>
               <th style="background-color: #fafafa; text-align: center;">�������</th>
               <th style="background-color: #fafafa; text-align: center;">�����</th>
               <th style="background-color: #fafafa; text-align: center;">���</th>
            </tr>
         </thead>
         <tbody id="ajaxTable">
        	
         </tbody>
      </table>
	</section>
	
	<button><a href="adminEdit">�߰�</a></button>
	<input type="button" value="����" />
	
<jsp:include page="../../footer.jsp" />

</body>
</html>