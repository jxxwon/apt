<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
    <link href="${context }css/common.css" rel="stylesheet" type="text/css">
    <link href="${context }css/home.css" rel="stylesheet" type="text/css">
    <c:url var="context" value="/"/>
</head>
<body>
	<div id="wrap">
		<div class = "homeContainer">
			<div class = "headerTopContainer">
				<div class = "logo">
					<a href = "/main" class = "logo">
						<img src = "${context}image/logo.png">
						<h1>트리더힐</h1>
					</a>
				</div>
				<div class = "headerMenu">
					<ul>
						<li><a href = "/main">메인</a></li>
						<li><a href = "${context}member/login">로그인</a></li>
						<li><a href = "#">회원가입</a></li>
					</ul>
				</div>
			</div>
			<div class = "headerNav">
				<ul>
					<li><a href = "#">공지사항</a></li>
					<li><a href = "#">커뮤니티</a></li>
					<li><a href = "#">관리비</a></li>
				</ul>
			</div>
		</div>
    </div>
</body>
</html>