<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 관리자페이지 : 관리비관리</title>
<c:import url="${context}header" />
<link href="${context}css/common.css" rel="stylesheet" type="text/css" />
<link href="${context}css/admin.css" rel="stylesheet" type="text/css" />
<script src="${context}javaScript/admin.js"></script>
</head>
<body>
	<div class="adminContainer">
		<div class="subContainer">
			<c:import url="${context}admin/subMenuAdmin" />
		</div>
		<div class="innerContainer">
			<p>관리비 조회</p>
			<div class="manageContainer">
				<div class="list">
					<form action="">
						<div class="condition">
							<div class="conditionLeft">
								<div>
									<select name="year" id="year">
										<option value="all">연도 전체</option>
										<c:forEach var="i" begin="0" end="4">
											<option value="${year-i}" ${year-i eq year ? 'selected' : ''}>${year-i}년</option>
										</c:forEach>
									</select> <select name="month" id="month">
										<option value="all">월 전체</option>
										<c:forEach var="i" begin="1" end="12">
											<option value="${i}" ${i eq month ? 'selected' : ''}>${i}월</option>
										</c:forEach>
									</select>
								</div>
								<div>
									<select name="complex" id="complex">
										<option value="all">동 선택</option>
										<option value="101" ${complex eq '101' ? 'selected' : ''}>101동</option>
										<option value="102" ${complex eq '102' ? 'selected' : ''}>102동</option>
										<option value="103" ${complex eq '103' ? 'selected' : ''}>103동</option>
										<option value="104" ${complex eq '104' ? 'selected' : ''}>104동</option>
									</select> <select name="unit" id="unit">
										<option value="all" selected>호수 선택</option>
									</select>
								</div>
							</div>
							<div class="conditionBtn">
								<input type="button" value="검색">
							</div>
						</div>
						<table>
							<tr>
								<th>연도</th>
								<th>월</th>
								<th>세대</th>
								<th>관리비 합계</th>
								<th>납부구분</th>
							</tr>
							<c:choose>
								<c:when test="${empty users}">
									<tr>
										<td colspan=5>조회된 내역이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="user" items="${users}">
										<tr
											onclick="location.href='${context}admin/userManageContent?id=${user.id}'">
											<td>${user.id}</td>
											<td>${user.name}</td>
											<td><c:if test="${user.status == '1'}">관리자</c:if> <c:if
													test="${user.status == 'D'}">
													<span style="color: red;">승인대기</span>
												</c:if> <c:if test="${user.status == 'A'}">승인</c:if> <c:if
													test="${user.status == 'R'}">
													<span style="color: blue;">반려</span>
												</c:if> <c:if test="${user.status == '0'}">탈퇴</c:if></td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan=3>
											<div class="page">${result}</div>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</form>
				</div>
				<div class = "btn">
					<input type="button" value="세대별 관리비 등록" id="costRegBtn">
				</div>
			</div>
		</div>
	</div>
	<c:import url="${context}footer" />
</body>
</html>