<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="context" value = "/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 회원관리</title>
<c:import url = "${context}header"/>
<link href="${context}css/admin.css" rel="stylesheet" type="text/css"/>
<script src = "${context}javaScript/admin.js"></script>
</head>
<body>
<div class = "adminContainer">
	<div class = "subContainer">
		<c:import url = "${context}admin/subMenuAdmin"/>
	</div>
	<div class = "innerContainer">
		<p>회원 조회</p>
		<div class = "manageContainer">
			<form action="userAuth" method="post" id="f" class="userTable">
				<table>
					<tr>
						<th>아이디</th>
						<td>${user.id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${user.name}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${user.email}</td>
					</tr>
					<tr>
						<th>승인상태</th>
						<td>
							<c:if test = "${user.status == 'D'}">승인대기</c:if>
							<c:if test = "${user.status == 'A'}">승인</c:if>
							<c:if test = "${user.status == 'R'}">반려</c:if>
						</td>
					</tr>
				</table>
				<input type="hidden" name="id" value="${user.id}">
				<div class = "btnDiv">
					<c:choose>
						<c:when test = "${user.status == 'D' || user.status == 'R'}">
							<input type = "button" value = "승인" id="userAuthBtn">
							<input type = "button" value = "반려" id="userRejectBtn">
						</c:when>
						<c:otherwise>
							<input type = "button" value = "탈퇴" id="userDeleteBtn">
						</c:otherwise>
					</c:choose>
					<input type = "button" value = "목록" id="userListBtn">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>