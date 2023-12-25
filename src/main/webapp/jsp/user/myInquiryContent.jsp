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
								<th>글제목</th>
								<td><input type = "text" id = "title" name = "title" placeholder = "100자 이내로 입력하세요."></td>
							</tr>
							<tr>
								<th>글내용</th>
								<td><textarea id = "content" name = "content" style = "height:400px; resize:none;" placeholder = "1000자 이내로 입력하세요."></textarea></td>
							</tr>
						</table>
						<div class = "btn">
							<input type = "button" value = "등록" id = "inquiryWriteProcBtn">
							<input type = "button" value = "취소" id = "myInquiryBtn">
						</div>
					</form>
				</div>
		</div>
	</div>
</div>
<c:import url = "${context}footer"/>
</body>
</html>