<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 마이페이지 : 정보수정</title>
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
			<p>회원 정보 수정</p>
			<div class = "myPageContainer">
				<div class = "myInfoContainer">
					<form action="updateInfo" method = "post" id = "f" class = "myInfoTable">
						<table>
							<tr>
								<th>이름</th>
								<td>${user.name}</td>
							</tr>
							<tr>
								<th>새 비밀번호</th>
								<td><input type = "password" id = "newPw" name="newPw"></td>
							</tr>
							<tr>
								<th>새 비밀번호 확인</th>
								<td>
									<input type = "password" id = "confirmNewPw" name = "confirmPw"><br>
									<p id = "confirmNewPwP"></p>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type = "text" value = "${user.phone}" id = "phone" name = "phone"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<input type = "text" value = "${user.email}" id = "email" name = "email">
									<input type = "button" value = "인증번호 전송" id = "sendEmailBtn"><br>
									<p id = "emailP"></p>
								</td>
							</tr>
							<tr>
								<th>인증번호</th>
								<td>
									<input type = "text" placeholder = "인증번호 입력" name = "authNum" id = "authNum">
									<input type = "button" value = "인증번호 확인" id = "authNumBtn"><br>
									<p id = "authP"></p>
								</td>
							</tr>
						</table>
						<div class="btnDiv">
							<input type = "button" value = "수정" id = "updateInfoBtn"> 
							<input type = "button" value = "취소"> 
						</div>
					</form>
				</div>
		</div>
	</div>
</div>
<c:import url = "${context}footer"/>
</body>
</html>