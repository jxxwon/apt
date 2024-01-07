<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 마이페이지 : 1:1문의</title>
<c:import url = "${context}header"/>
<link href="${context}css/common.css" rel="stylesheet" type="text/css"/>
<link href="${context}css/user.css" rel="stylesheet" type="text/css"/>
<script src = "${context}javaScript/user.js"></script>
</head>
<body>
	<div class = "userContainer">
		<div class = "subContainer">
			<c:import url = "${context}user/subMenuUser"/>
		</div>
		<div class = "innerContainer">
			<p>1:1문의</p>
			<div class = "myPageContainer">
				<div class = "myInquiryContainer">
					<form action = "inquiryWriteProc" id = "f" method = "post">
						<table class = "inquiry">
							<tr>
								<th colspan="4" align="left" style="padding-bottom:20px;">${title}</th>
							</tr>
							<tr style = "border-bottom:1px solid #ddd">
								<th width="40px" style="padding-bottom:40px;">작성일</th>
								<td width="100px" style="padding-bottom:40px;">${writeTime}</td>
								<th width="80px" style="padding-bottom:40px;">답변여부</th>
								<c:if test = "${reply == 'N'}">
									<td align="left" style="padding-bottom:40px;">답변대기</td>
								</c:if>
								<c:if test = "${reply == 'Y'}">
									<td align="left" style="padding-bottom:40px;">답변완료</td>
								</c:if>
							</tr>
							<tr>
								<td colspan="4" align="left" style = "padding-top:40px;">${content}</td>
							</tr>
						</table>
						<div class = "btn">
							<c:if test = "${reply == 'N'}">
								<input type = "button" value = "수정">
								<input type = "button" value = "삭제">
							</c:if>
							<input type = "button" value = "목록" id = "myInquiryBtn">
						</div>
					</form>
				</div>
		</div>
	</div>
</div>
<c:import url = "${context}footer"/>
</body>
</html>