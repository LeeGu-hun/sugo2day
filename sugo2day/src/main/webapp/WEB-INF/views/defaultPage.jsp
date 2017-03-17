<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap 사용을 위한 meta tag -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
	
	<title>Insert title here</title>

	<!-- Bootstrap 적용 -->
	<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
	
	 <!-- Custom styles for this template -->
    <link href="<%=cp%>/resources/bootstrap/css/else/dashboard.css" rel="stylesheet">
</head>

<body>
	<!-- 테스트용 주석-->
	<div id="wrapper">
		<div id="header">
			<%@ include file="/WEB-INF/views/include/header.jsp"%>
		</div>
		<div id="left">
			<%@ include file="/WEB-INF/views/include/left.jsp"%>
		</div>
		<div id="content">
			<%@ include file="/WEB-INF/views/include/right.jsp"%>
		</div>
		<div id="footer">
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		</div>
	</div>
	
	
	 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	
</body>
</html>	
