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
			<p>관리비 등록</p>
			<div class="manageContainer">
				<div class="costRegContainer">
					<form action="" id="costRegSearchForm" method="post">
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
										<option value="all">호수 선택</option>
									</select>
								</div>
							</div>
							<div class="conditionBtn">
								<input type="button" value="검색" id="costRegSearchBtn">
							</div>
						</div>
						<form>
							<table>
								<tr>
									<th>일반관리비</th>
									<td><input type="text" value="0">원</td>
									<th>난방비</th>
									<td><input type="text" value="0">원</td>
								</tr>
								<tr>
									<th>청소비</th>
									<td><input type="text" value="0">원</td>
									<th>전기료</th>
									<td><input type="text" value="0">원</td>
								</tr>
								<tr>
									<th>경비비</th>
									<td><input type="text" value="0">원</td>
									<th>수도료</th>
									<td><input type="text" value="0">원</td>
								</tr>
								<tr>
									<th>승강기유지비</th>
									<td><input type="text" value="0">원</td>
									<th>입주자운영비</th>
									<td><input type="text" value="0">원</td>
								</tr>
								<tr>
									<td colspan=4>합계 <input type="text" disabled>원
									</td>
								</tr>
							</table>
						</form>
					</form>
				</div>
				<div class="btn">
					<input type="button" value="계산하기" id="calBtn"> <input
						type="button" value="초기화" id="resetBtn"> <input
						type="button" value="등록" id="costRegBtn"> <input type="button"
						value="목록" id="costListBtn">
				</div>
			</div>
		</div>
	</div>
	<c:import url="${context}footer" />
</body>
</html>