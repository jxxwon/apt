<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class = "subMenu">
		<div class = "title">마이페이지</div>
		<div class = "menu">
			<div class = "userManage">
				<p>회원 정보</p>
				<ul>
					<li><a href = "${context}user/myPage">회원 정보 수정</a></li>
				</ul>
			</div>
			<div class = "boardManage">
				<p>활동내역</p>
				<ul>
					<li><a href = "#">작성한 게시글</a></li>
					<li><a href = "#">작성한 댓글</a></li>
					<li><a href = "#">1:1문의</a></li>
				</ul>
			</div>
			<div class = "costManage">
				<p>내 관리비</p>
				<ul>
					<li><a href = "#">납부 내역 조회</a></li>
					<li><a href = "#">my pay</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>