<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  5초 뒤 메인으로 이동 -->
<meta http-equiv="refresh" content="5; url=<c:url value='/'/>">

<title>수고했어, 오늘도!</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/successPage.css"
	rel="stylesheet">
</head>
<body>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="inner cover">
					<h1 class="cover-heading">가입 성공</h1>
					<br>
					<p class="lead">
						<spring:message code="register.done" arguments="${registerRequest.name }" />
					</p>	
					<p class="lead">5초 후, 자동으로 메인 페이지로 이동합니다.</p>
					<br>
					<br>
					<p class="lead">
						<a href="<c:url value='/'/>" class="btn btn-lg btn-default">즉시 이동</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>