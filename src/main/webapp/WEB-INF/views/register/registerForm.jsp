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
<!-- font awesome for icons -->
<link href="<%=cp%>/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!--mega menu -->
<link href="<%=cp%>/resources/css/yamm.css" rel="stylesheet"
	type="text/css">
<!-- Head CSS -->
<link href="<%=cp%>/resources/css/style.css" rel="stylesheet">
<!--must need plugin jquery-->
	<script src="<%=cp%>/resources/js/jquery.min.js"></script>
<!--bootstrap js plugin-->
<script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
<!--sticky header-->
<script type="text/javascript"
		src="<%=cp%>/resources/js/jquery.sticky.js"></script>	


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
	function registerCancel(){
		location.href = "<c:url value='/' />";
	}
</script>
<style>
body {
	background-color: #eee;
}

.pg-container {
	padding-top: 40px;
	padding-bottom: 40px;
}

.form-horizontal {
	max-width: 600px;
	padding: 15px;
	margin: 0 auto;
}

.form-horizontal .form-join-heading {
	margin-bottom: 10px;
}

.form-horizontal .input-group {
	margin-top: 3px;
	margin-bottom: 3px;
}

.form-horizontal .error-message {
	font-weight: normal;
}

.form-horizontal .error-message {
	margin-top: 1px;
	margin-bottom: 2px;
}

.form-horizontal .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-horizontal .form-control:focus {
	z-index: 2;
}

.form-horizontal #inputEmail {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-horizontal #inputPassword {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

</style>

</head>
<body>
		<div class="top-bar-light">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 hidden-xs">
						<div class="top-bar-socials"></div>
					</div>
					<div class="col-sm-7 text-right">
						<ul class="list-inline top-dark-right">
							<c:if test="${empty authInfo }">
								<li><a href="<c:url value="/login" />"><i
										class="fa fa-lock"></i> Login</a></li>
								<li><a href="<c:url value="/register/registerTerm" />"><i
										class="fa fa-user"></i> Sign Up</a></li>
							</c:if>
							<c:if test="${!empty authInfo }">
								<li>${authInfo.name }님,환영합니다.</li>
								<li><a href="<c:url value='/logout' />">
								<i class="fa fa-user"></i> Logout</a></li>
								<li><a href="javascript:void(window.open('<c:url value='/edit/changePassword' />', '_blank', 'width=350, height=400'))">
								<i class="fa fa-lock"></i> ChangePW</a></li>
							</c:if>
						</ul>

					</div>
				</div>
			</div>
		</div>
		<!--top-bar end here-->
		<!--navigation -->
		<div id="nav-wrapper">
			<div class="navbar navbar-default navbar-static-top yamm sticky"
				role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<div id="brandLogo">
							<a class="navbar-brand" href="<c:url value="/main" />"><img
								src="<%=cp%>/resources/images/Logo.png" alt=""></a>
						</div>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a
								href="<c:url value="/letter/letterWrite" />">MyPage </a></li>
						</ul>


					</div>
					<!--/.nav-collapse -->
				</div>
				<!--container-->
			</div>
		</div>
		<!--navbar-default-->

	<div class="pg-container">
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