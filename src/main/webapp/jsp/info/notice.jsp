<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 정보마당</title>
<c:import url = "${context}header"/>
<link href="${context}css/common.css" rel="stylesheet" type="text/css"/>
<link href = "${context}css/info.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class = "infoContainer">
		<div class = "subContainer">
			<c:import url = "${context}info/subMenuInfo"/>
		</div>
		<div class = "innerContainer">
			<p>공지사항</p>
			<div class = "noticeContainer">
				<div class = "noticeList">
					<form action="confirmProc" method = "post" class = "comfirmPwForm" id = "f" >
						<div class = "btn">
							<input type = "button" value = "등록" id = "noticeWriteBtn"/>
						</div>
						<div class = "condition">
							<select id = "select" name = "select">
								<option value = "status">승인상태</option>
								<option <c:if test = "${param.select == 'id'}">selected = 'selected'</c:if>value = "id">아이디</option>
							</select>
							<select id = "status" name = "status">
								<option <c:if test = "${param.status == 'all'}">selected = 'selected'</c:if>value = "all">전체</option>
								<option <c:if test = "${param.status == 'D'}">selected = 'selected'</c:if>value = "D">승인대기</option>
								<option <c:if test = "${param.status == 'A'}">selected = 'selected'</c:if>value = "A">승인</option>
								<option <c:if test = "${param.status == 'R'}">selected = 'selected'</c:if>value = "R">반려</option>
								<option <c:if test = "${param.status == '0'}">selected = 'selected'</c:if>value = "0">탈퇴</option>
							</select>
							<input type = "text" id = "search" name = "search" placeholder = "동-호수 ex) 000-000" style = "display:none;">
							<input type = "submit" id = "searchBtn" value = "검색">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<c:import url = "${context}footer"/>
</html>