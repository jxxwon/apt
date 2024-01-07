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
					<div class = "list">
						<table>
							<c:choose>
								<c:when test = "${empty myInquiry}">
									등록한 문의가 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var = "inquiry" items = "${myInquiry}">
										<tr>
											<td style = "width:30px; text-align:center;">${inquiry.rn}</td>
											<td style = "width:400px;">
												<a href = "${context}user/myInquiryContent?rn=${inquiry.rn}">
													${inquiry.title}
												</a>
											</td>
											<td style = "width:100px;">${inquiry.writeTime}</td>
											<td style = "width:25px;">
												<c:if test = "${inquiry.reply == 'N'}">
													<span style = "color:red;">답변대기</span>
												</c:if>
												<c:if test = "${inquiry.reply == 'Y'}">
													<span style = "color:blue;">답변완료</span>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<div class = "btn">
						<input type = "button" value = "등록" id = "inquiryWriteBtn">
					</div>
				</div>
		</div>
	</div>
</div>
<c:import url = "${context}footer"/>
</body>
</html>