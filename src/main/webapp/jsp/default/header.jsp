<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link href="${context}css/common.css" rel="stylesheet" type="text/css"/>
<link href="${context}css/home.css" rel="stylesheet" type="text/css"/>
<body>
	<div class = "homeContainer">
		<div class = "headContainer">
			<div class = "logo">
				<a href = "${context }main">트리더힐</a>
			</div>
			<div class = "headerMenu">
				<ul>
					<li><a href = "${context}main">메인</a></li>
					<li><a href = "#">로그인</a></li>
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
</body>
