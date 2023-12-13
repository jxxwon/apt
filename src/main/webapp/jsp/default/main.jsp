<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트리더힐에 오신 것을 환영합니다.</title>
<c:import url = "${context}header"/>
<link href="${context}css/common.css" rel="stylesheet" type="text/css"/>
<link href="${context}css/home.css" rel="stylesheet" type="text/css"/>
</head>
<body>
		<div class = "mainContainer">
			<div class = "visual">
				공지사항
				일정
			</div>
		</div>
		<c:import url = "${context}footer"/>
</body>
</html>