<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="context" value="/"/>
<!DOCTYPE html>
<html>
<head>
    <c:url var="context" value="/"/>
    <link href="${context}css/common.css" rel="stylesheet" type="text/css">
    <link href="${context}css/home.css" rel="stylesheet" type="text/css">
    <script src = "${context}javaScript/home.js"></script>
    <script>
    function headerLoginChk(){
    	var id = "${sessionScope.id}";
    	var status = "${sessionScope.status}";
    	var defaultMenu = document.getElementById('defaultMenu');
    	var loginMenu = document.getElementById('loginMenu');
    		if(id != ''){
    			document.getElementById('welcome').style.display = 'block';
    			defaultMenu.style.display = 'none';
    			loginMenu.style.display = 'block';
    		}
    		if(status != 'M'){
    			document.getElementById('adminMenu').style.display = 'none';
    		} else {
    			document.getElementById('userMenu').style.display = 'none';
    		}
    }
    </script>
</head>
<body onload="headerLoginChk()">
	<div id="wrap">
		<div class = "homeContainer">
			<div class = "headerTopContainer">
				<div class = "logo">
					<a href = "/main" class = "logo">
						<img src = "${context}image/logo.png">
						<h1>트리더힐</h1>
					</a>
				</div>
				<div class = "headerMenu">
					<div id = "welcome" class = "welcome" style = "display:none">
						${sessionScope.id}님 환영합니다.
					</div>
					<ul id = "defaultMenu">
						<li><a href = "/main">메인</a></li>
						<li><a href = "${context}member/login">로그인</a></li>
						<li><a href = "${context}member/register">회원가입</a></li>
					</ul>
					<ul id = "loginMenu" style = "display:none">
						<li><a href = "/main">메인</a></li>
						<li id = "userMenu"><a href = "/main">마이페이지</a></li>
						<li id = "adminMenu"><a href = "/main">관리자페이지</a></li>
						<li><a href = "/main">알림</a></li>
						<li><a href = "/main">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<div class = "headerNav">
				<ul>
					<li><a href = "#">공지사항</a></li>
					<li><a href = "#">커뮤니티</a></li>
					<li><a href = "#">관리비</a></li>
				</ul>
			</div>
		</div>
    </div>
</body>
</html>