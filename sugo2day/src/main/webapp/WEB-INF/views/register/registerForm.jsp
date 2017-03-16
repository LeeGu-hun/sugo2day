<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; harset=UTF-8">
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
<link href="<%=cp%>/resources/bootstrap/css/else/registerForm.css" rel="stylesheet">
<script>
	function registerCancel(){
		location.href = "<c:url value='/' />";
	}
</script>
</head>
<body>
	<div class="container">
		<form:form action="registerSuccess" commandName="registerRequest" class="form-horizontal">
			<h2 class="form-join-heading">회원 가입 양식</h2>
			<div class="input-group">
				<label for="inputEmail" class="sr-only">Email address</label>
				<span class="input-group-addon" id="input-email">#</span>
				<input type="hidden" id="inputEmail" class="form-control" aria-describedby="input-email">
				<form:input path="email" class="form-control" placeholder="이메일 주소를 입력하세요" />	
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="email" /></span>
			</div>

			<div class="input-group">
				<label for="inputName" class="sr-only">Nick name</label>
				<span class="input-group-addon" id="input-name">#</span>	
				<input type="hidden" id="inputName" class="form-control" aria-describedby="input-name">
				<form:input path="name" class="form-control" placeholder="사용할 닉네임을 입력하세요(한글,영문,숫자)"/>	
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="name" /></span>
			</div>

			<div class="input-group">
				<label for="inputPassword" class="sr-only">Password</label>
				<span class="input-group-addon" id="input-password">#</span>	
				<input type="hidden" id="inputPassword" class="form-control" aria-describedby="input-password">
				<form:password path="password"  class="form-control" placeholder="사용할 비밀번호을 입력하세요(영문,숫자)" />		
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="password" /></span>
			</div>

			<div class="input-group">
				<label for="inputConfirmPassword" class="sr-only">Confirm Password</label>
				<span class="input-group-addon" id="input-confirm-password">#</span>	
				<input type="hidden" id="inputConfirmPassword" class="form-control" aria-describedby="input-confirm-password">
				<form:password path="confirmPassword" class="form-control" placeholder="비밀번호를 한 번 더 입력하세요" />	
			</div><div class="error-message">
				<span class="label label-danger label-large"><form:errors path="confirmPassword" /></span>
			</div>

			<div class="input-group">
				<label for="inputBirthday" class="sr-only">Birthday</label>
				<span class="input-group-addon" id="input-birthday">#</span>	
				<input type="hidden" id="inputBirthday" class="form-control" aria-describedby="input-birthday">
				<form:input path="birthday" class="form-control"
					placeholder="생년월일을 YYYY-MM-DD 의 형식으로 입력하세요" />	
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="birthday" /></span>
			</div>

			<div class="input-group">
				<label for="inputGender" class="sr-only">Gender</label>
				<span class="input-group-addon" id="input-gender">#</span>	
				<input type="hidden" id="inputGender" class="form-control" aria-describedby="input-gender">
				<form:input path="gender" class="form-control"
					placeholder="남성은 male, 여성은 female 을 입력하세요" />	
			</div>
			<div class="error-message">
				<span class="label label-danger label-large"><form:errors path="gender" /></span>
			</div>
			
			<div class="btn-group btn-group-justified" role="group">
				<div class="btn-group" role="group">
					<button class="btn btn-primary btn-block" type="submit">가입하기</button>
				</div>
				<div class="btn-group" role="group">
					<button class="btn btn-warning btn-block" type="button"
						onclick="registerCancel();">취소하기</button>
				</div>		
			</div>
		</form:form>
	</div>	
</body>
</html>