<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
	<header>
		<div class="parent">
			<h1>해운대 도서관</h1>
			<c:if test="${sessionScope.SessionID eq null }">
				<div class="child">
					<input type="button" value="로그인" onclick="location.href='login'" />
					<input type="button" value="회원가입" onclick="location.href='join'"/>
				</div>
			</c:if>
			<c:if test="${sessionScope.SessionID ne null }">
			<div class="child">
				${sessionScope.SessionID}님이 로그인 하셨습니다.
				<input type="button" value="로그아웃" onclick="location.href='logout'"/>
			</div>
			</c:if>
		</div>
		<nav>
		<div class="category">
			<ul>
				<li>
					<a href="introduce">도서관</a>
				<li> | </li>
				</li>
				<li>
					<a href="search">자료검색</a>
					<li> | </li>	
				</li>
				<li>
					<a href="bestBook">베스트 셀러</a>
					<li> | </li>
				</li>
				<li>
					<c:if test="${sessionScope.flag eq 'U'}">
						<a href="mypage">마이페이지</a>
					</c:if>
					<c:if test="${sessionScope.flag eq 'A'}">
						<a href="adminPage">관리자페이지</a>
					</c:if>
					<c:if test="${sessionScope.flag eq null}">
						<a href="mypage">마이페이지</a>
					</c:if>
				</li>
				<li>
					<a href="notice">공지사항</a>
					<li> | </li>
				</li>
				<li>
					<a href="load">오시는 길</a>	
				
				</li>
			</ul>
		</div>
		</nav>
	</header>