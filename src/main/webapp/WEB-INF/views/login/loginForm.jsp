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
<style>
body {
  background-color: #eee;
}

#nav-form-wrapper {
  padding-top: 40px;
  padding-bottom: 40px;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}

.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}

.form-signin .checkbox,
.form-signin .error-message {
  font-weight: normal;
}

.form-signin .error-message {
	margin-bottom: 10px;
}

.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}

.form-signin #inputEmail {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin #inputPassword {
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
							<li><a href="<c:url value='/logout' />"><i
									class="fa fa-user"></i> Logout</a></li>
							<li><a
								href="javascript:void(window.open('<c:url value='/edit/changePassword' />', '_blank', 'width=350, height=400'))">
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
						<li class="dropdwon"><a
							href="<c:url value="/letter/letterWrite" />">MyPage </a></li>	
					</ul>


				</div>
				<!--/.nav-collapse -->
			</div>
			<!--container-->
		</div>
	</div>
	<!--navbar-default-->

	<div id="nav-form-wrapper">
		<form:form commandName="loginCommand" class="form-signin">
			<h2 class="form-signin-heading">로그인 하세요</h2>

			<label for="inputEmail" class="sr-only">Email address</label>
			<form:input path="email" id="inputEmail" class="form-control"
				placeholder="Email address" />
			<form:errors path="email" />

			<label for="inputPassword" class="sr-only">Password</label>
			<form:password path="password" id="inputPassword"
				class="form-control" placeholder="Password" />

			<div class="checkbox">
				<label> <form:checkbox path="rmbEmail" /> Remember me
				</label>
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
