<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐에 오신 것을 환영합니다.</title>
</head>
<body>
	<c:import url = "${context}header"/>
		<div class = "mainContainer">
			<div class = "inner visual">
				공지사항
				일정
			</div>
		</div>
		<c:import url = "${context}footer"/>
</body>
</html>