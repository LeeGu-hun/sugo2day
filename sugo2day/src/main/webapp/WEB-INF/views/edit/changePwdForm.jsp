<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cp%>/resources/bootstrap/css/else/changePwd.css" rel="stylesheet">
</head>
<body>
	<div class="container">

	<form:form class="form-pwdChange">
		<h2 class="form-pwdChange-heading">비밀번호 변경</h2>
	
		<label for="inputCurPassword" class="sr-only">현재 비밀번호</label>
		<form:password path="currentPassword" id="curPassword" class="form-control"
			placeholder="현재 비밀번호"/>
		<form:errors path="currentPassword" />
	
		<label for="inputNewPassword" class="sr-only">새 비밀번호</label>
		<form:password path="newPassword" id="newPassword" class="form-control"
			placeholder="새 비밀번호"/>
		<form:errors path="newPassword" />	
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">변경하기</button>
	</form:form>
	
	</div>	
</body>
</html>