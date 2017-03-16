<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<!-- Title 왼쪽 아이콘 삽입 -->
<!-- 
    <link rel="icon" href="../../favicon.ico">
	 -->

<title>Insert title here</title>
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=cp%>/resources/bootstrap/css/else/loginForm.css"
	rel="stylesheet">

</head>

<body>
	<div class="container">
		<form:form commandName="loginCommand" class="form-signin">
			<h2 class="form-signin-heading">로그인 하세요</h2>

			<label for="inputEmail" class="sr-only">Email address</label>
			<form:input path="email" id="inputEmail" class="form-control"
				placeholder="Email address" />
			<form:errors path="email" />

			<label for="inputPassword" class="sr-only">Password</label>
			<form:password path="password" id="inputPassword" class="form-control"
				placeholder="Password" />
				
			<div class="checkbox">
				<label> <form:checkbox path="rmbEmail" /> Remember me</label>
			</div>
			
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors /></span>
			</div>
			
			<button class="btn btn-primary btn-block" type="submit">Login</button>
		</form:form>
	</div>
	<!-- /container -->

</body>
</html>
