<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }   
        #best{
            text-align: center;
        }

    </style>
</head>
<body>

<!-- header -->
<jsp:include page="../../header.jsp" />
    <div>
        <MARQUEE><img src= "https://ifh.cc/g/IJMHZb.jpg" width="900" height="300"><div> askjdasd</div></MARQUEE>
    </div>

    <div id="best">
        <div id="best_header">
            <h3>이달의 베스트 도서 정보</h3>
        </div>
        <!-- <div id="best_list" style="width: 600px; height: 600px;"> -->
            <div id="best_list">
             <div>
                 <ol>
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/MH5GWh.png" style="width:150; height:180px;" alt="erro">
                        </div>
                        <a href="#">초보자를위한 리액트 200제</a>
                    </li>
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/9lezDp.jpg" style="width:150; height:180px;" alt="erro">
                        </div>
                        <a href="#">자존감 수업</a>
                    </li>
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/F141u9.jpg" style="width:150; height:180px;" alt="erro">
                        </div >
                        <a href="#">이것이 자바다</a>
                    </li>
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/o74ErH.jpg" style="width:150; height:180px;" alt="erro">
                        </div>
                        <a href="#">나미야 잡화점의 기적</a>
                    </li>
                 </ol>
             </div>
             <div>
                <ol start="5">
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/91Nhyd.jpg" style="width:150; height:180px;" alt="erro">
                        </div>
                        <a href="#">코리아2022</a>
                    </li>
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/3FzACw.jpg" style="width:150; height:180px;" alt="erro">
                        </div>
                        <a href="#">작별하지 않는다</a>
                    </li>
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/XoS5xC.jpg" style="width:150; height:180px;" alt="erro">
                        </div>
                        <a href="#">햇빛은 찬란하고 인생은 귀하니까요</a>
                    </li>
                    <li>
                        <div class="bset_d">
                            <img src="https://ifh.cc/g/UErQmx.jpg" style="width:150; height:180px;" alt="erro">
                        </div>
                        <a href="#">지구끝의 온실</a>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    
    		<!-- footer -->
<jsp:include page="../../footer.jsp" />
</body>
</html>