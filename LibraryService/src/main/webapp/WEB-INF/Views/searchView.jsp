<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewprot" content="width=device-with, inital-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
   var request = new XMLHttpRequest();
   function searchFunction() {
	  var searchItem = document.getElementById("searchItem").value;
	  var searchText = document.getElementById("searchText").value;
      var url = "./bookSearch?searchItem="+searchItem+"&searchText="+searchText;
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
               var cell = row.insertCell(j);
           	   if(j == 1){
            	   cell.innerHTML ='<img alt="오류데쓰!" src="'+a+'">';
               }else{
               cell.innerHTML = result[i][j].value;
               } 
            }
         }
      }
   }
   window.onload = function() {
	   searchFunction();
	}
</script>
</head>
<body>
<!-- header -->
<jsp:include page="../../header.jsp" />
   <br>
   <div class="container">
      <div class="form-group row pull-right">
         <div class='col-xs-8'>
            <select name="searchItem" id="searchItem" onclick="searchFunction()">
                  <option value="BookName">책제목</option>
                  <option value="Author">저자</option>
                  <option value="Publisher">출판사</option>
            </select>
         </div>
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
               <th style="background-color: #fafafa; text-align: center;">등록 번호</th>
               <th style="background-color: #fafafa; text-align: center;">표지</th>
               <th style="background-color: #fafafa; text-align: center;">분류</th>
               <th style="background-color: #fafafa; text-align: center;">책 이름</th>
               <th style="background-color: #fafafa; text-align: center;">저자</th>
               <th style="background-color: #fafafa; text-align: center;">출판사</th>
               <th style="background-color: #fafafa; text-align: center;">대출가능 권수</th>
               <th style="background-color: #fafafa; text-align: center;">예약가능 여부</th>
               <th style="background-color: #fafafa; text-align: center;">요약</th>
            </tr>
         </thead>
         <tbody id="ajaxTable">
         
         </tbody>
      </table>
   </div>
      <!-- footer -->
<jsp:include page="../../footer.jsp" />
</body>