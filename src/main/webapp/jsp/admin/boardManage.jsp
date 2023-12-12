<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 관리자페이지 : 회원관리</title>
<link href="${context}css/common.css" rel="stylesheet" type="text/css"/>
<link href="${context}css/admin.css" rel="stylesheet" type="text/css"/>
<c:import url = "${context}header"/>
</head>
<body>
	<div class = "adminContainer">
		<div class = "subContainer">
			<c:import url = "${context}admin/subMenuAdmin"/>
		</div>
		<div class = "innerContainer">
			<div class = innerTopContainer>
				<h2>회원관리</h2>
				<div class = "tabMenu">
					<ul>
						<li><a href = "#">입주민 승인</a></li>
						<li><a href = "#">회원 조회</a></li>
					</ul>
				</div>
			</div>
			<div class = "manageContainer">
				<div>검색조건</div>
				<div>목록</div>
			</div>
		</div>
	</div>
<c:import url = "${context}footer"/>
</body>
</html>