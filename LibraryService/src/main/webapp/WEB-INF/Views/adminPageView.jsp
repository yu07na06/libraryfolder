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
					<b>관리자 페이지</b>
					</div>	
					<div class="side_detail">
					책 등록하기
					</div>					
					<div class="side_detail">
					회원 정보
					</div>	
				</div>			
		</div>
		<div>
		<select name="searchItem" id="searchItem" onclick="searchFunction()">
                  <option value="BookName">책제목</option>
                  <option value="Author">저자</option>
                  <option value="Publisher">출판사</option>                  
            </select>
            <div class='col-xs-8'>
            <input class="form-control" type="text" id="searchText" onkeyup="searchFunction()" size="20" placeholder="검색어를 입력해주세요">
         </div>
         <div class="col-xs-2">
            <button type="button" class="btn btn-primary" onclick="searchFunction();">검색</button>
         </div>
		</div>
		<table class="table"
         style="text-align: center; border: 1px solid #dddddd;">
         <thead>
            <tr>
               <th style="background-color: #fafafa; text-align: center;">ISBN</th>
               <th style="background-color: #fafafa; text-align: center;">등록번호</th>               
               <th style="background-color: #fafafa; text-align: center;">분류</th>
               <th style="background-color: #fafafa; text-align: center;">책 이름</th>
               <th style="background-color: #fafafa; text-align: center;">저자</th>
               <th style="background-color: #fafafa; text-align: center;">출판사</th>
               <th style="background-color: #fafafa; text-align: center;">대출상태</th>
               <th style="background-color: #fafafa; text-align: center;">예약상태</th>
               <th style="background-color: #fafafa; text-align: center;">등록일자</th>
               <th style="background-color: #fafafa; text-align: center;">등록자</th>
               <th style="background-color: #fafafa; text-align: center;">비고</th>
            </tr>
         </thead>
         <tbody id="ajaxTable">
        	
         </tbody>
      </table>
	</section>
	
	<button><a href="adminEdit">추가</a></button>
	<input type="button" value="삭제" />
	
<jsp:include page="../../footer.jsp" />

</body>
</html>