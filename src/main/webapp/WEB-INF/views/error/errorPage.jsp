<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!--  5초 뒤 메인으로 이동 
<meta http-equiv="refresh" content="5; url=<c:url value='/letter/myLetter'/>">
-->

<title>Insert title here</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/successPage.css"
	rel="stylesheet">
</head>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="inner cover">
					<h1 class="cover-heading">글 작성 실패...</h1>
					<br>
					<p class="lead">제목 혹은 내용을 입력하지 않으셨나요?</p>
					<br>
					<p class="lead">제목과 내용은 필수입력 사항입니다.</p>
					<br>
					<br>
					<p class="lead">5초 후, 자동으로 창이 닫힙니다.</p>
					<br>
					<br>
					<p class="lead">
						<a href="<c:url value='/letter/myLetter'/>" class="btn btn-lg btn-default">즉시 이동</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>