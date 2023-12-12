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
	<div class = "subMenuAdmin">
		<div class = "title">관리자페이지</div>
		<div class = "menu">
			<div class = "userManage">
				<p>회원관리</p>
				<ul>
					<li><a href = "${context}admin/userManage">회원 조회</a></li>
				</ul>
			</div>
			<div class = "boardManage">
				<p>게시판관리</p>
				<ul>
					<li><a href = "#">공지사항 관리</a></li>
					<li><a href = "#">1:1문의 관리</a></li>
				</ul>
			</div>
			<div class = "costManage">
				<p>관리비관리</p>
				<ul>
					<li><a href = "#">관리비 조회</a></li>
					<li><a href = "#">세대별 관리비 등록</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>