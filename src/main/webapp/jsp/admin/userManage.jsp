<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 관리자페이지 : 회원관리</title>
<c:import url = "${context}header"/>
<link href="${context}css/common.css" rel="stylesheet" type="text/css"/>
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
				<div class = "list">
					<form action="">
						<div class = "condition">
							<select id = "select" name = "select">
								<option value = "status">승인상태</option>
								<option <c:if test = "${param.select == 'id'}">selected = 'selected'</c:if>value = "id">아이디</option>
							</select>
							<select id = "status" name = "status" class = "status">
								<option <c:if test = "${param.status == 'all'}">selected = 'selected'</c:if>value = "all">전체</option>
								<option <c:if test = "${param.status == 'D'}">selected = 'selected'</c:if>value = "D">승인대기</option>
								<option <c:if test = "${param.status == 'A'}">selected = 'selected'</c:if>value = "A">승인</option>
								<option <c:if test = "${param.status == 'R'}">selected = 'selected'</c:if>value = "R">반려</option>
								<option <c:if test = "${param.status == '0'}">selected = 'selected'</c:if>value = "0">탈퇴</option>
							</select>
							<input type = "text" id = "search" name = "search" class = "search" placeholder = "동-호수 ex) 000-000" style = "display:none;">
							<input type = "submit" id = "searchBtn" value = "검색">
						</div>
						<table>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>승인상태</th>
							</tr>
							<c:choose>
								<c:when test = "${empty users}">
									<tr>
										<td colspan=3>조회된 회원이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var = "user" items = "${users}">
										<tr onclick = "location.href='${context}admin/userManageContent?id=${user.id}'">
											<td>${user.id}</td>
											<td>${user.name}</td>
											<td>
												<c:if test = "${user.status == '1'}">관리자</c:if>
												<c:if test = "${user.status == 'D'}">
													<span style = "color:red;">승인대기</span>
												</c:if>
												<c:if test = "${user.status == 'A'}">승인</c:if>
												<c:if test = "${user.status == 'R'}">
													<span style = "color:blue;">반려</span>
												</c:if>
												<c:if test = "${user.status == '0'}">탈퇴</c:if>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan=3>
											<div class = "page">
												${result}
											</div>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</form>
			</div>
		</div>
	</div>
</div>
<c:import url = "${context}footer"/>
</body>
</html>