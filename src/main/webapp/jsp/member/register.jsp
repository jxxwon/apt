<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head></head>
<meta charset="UTF-8">
<title>트리더힐 - 회원가입</title>
<c:import url = "${context}header"/>
<link href="${context}css/common.css" rel="stylesheet" type="text/css"/>
<link href="${context}css/member.css" rel="stylesheet" type="text/css"/>
<script src="${context}javaScript/member.js"></script>
</head>
<body>
	<div class = "memberContainer">
		<form class = "regForm" id = "f" action = "regProc" method = "post">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<select id = "complex" name = "complex">
							<option disabled selected>동 선택</option>
							<option>101</option>
							<option>102</option>
							<option>103</option>
							<option>104</option>
						</select>
						<span>동</span>
						<select id = "unit" name = "unit" disabled>
							<option disabled selected>호수 선택</option>
						</select>
						<span>호</span>
						<input type = "button" id = "idChkBtn" value = "중복확인"><br>
						<label id = "idLbl"></label>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type = "password" id = "pw" name = "pw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type = "password" id = "confirmPw" name = "confirmPw"><br>
						<label id = "pwLbl"></label>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type = "text" id = "name" name = "name"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type = "text" id = "email" name = "email">
						<input type = "button" id = "sendEmailBtn" value = "인증메일 전송"><br>
						<label id = "emailLbl"></label>
					</td>
				</tr>
				<tr>
					<th>인증번호</th>
					<td>
						<input type = "text" id = "authNum" disabled>
						<input type = "button" id = "authNumBtn" value = "인증번호 확인"><br>
						<label id = "authLbl"></label>
					</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input type = "text" id = "phone" name = "phone" placeholder = "010-0000-0000">
				</tr>
				<tr>
					<td colspan=2>
						<input type = "button" value = "회원가입" id = "regBtn">
						<input type = "button" value = "취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url = "${context}footer"/>
</body>
</html>