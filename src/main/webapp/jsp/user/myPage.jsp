<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐 - 마이페이지 : 정보수정</title>
<c:import url="${context}header" />
<link href="${context}css/common.css" rel="stylesheet" type="text/css" />
<link href="${context}css/user.css" rel="stylesheet" type="text/css" />
<script src="${context}javaScript/user.js"></script>
</head>
<body>
	<div class="userContainer">
		<div class="subContainer">
			<c:import url="${context}user/subMenuUser" />
		</div>
		<div class="innerContainer">
			<p>회원 정보 수정</p>
			<div class="myPageContainer">
				<div class="myInfoContainer">
					<form action="confirmProc" method="post" class="comfirmPwForm"
						id="f">
						<label>비밀번호</label> <input type="password" name="confirmPw"
							id="confirmPw"><br>
						<div class="btn">
							<input type="button" value="확인" id="confirmBtn"> <input
								type="button" value="취소" id="cancelBtn">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<c:import url="${context}footer" />
</html>