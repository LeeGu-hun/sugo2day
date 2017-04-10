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
function goBack() {
	location.href = "<c:url value='/' />";
}



function toggle_btn() {
	if ($("input:checkbox[id='agree_check']").is(":checked") == true) {
		$("#btn-agree").removeClass("hidden");
		$("#btn-agree").addClass("show");
	}
	
	if ($("input:checkbox[id='agree_check']").is(":checked") == false) {
		$("#btn-agree").removeClass("show");
		$("#btn-agree").addClass("hidden");
	}
}

</script>
<style>
body {
  background-color: #eee;
}

#con-wrap {
  padding-top: 40px;
  padding-bottom: 40px;
  min-height: 100%;
  margin: 0 auto;
}

.page-container {
  max-width: 600px;
  margin: 0 auto;
  padding: 0 15px;
}

.form-agree {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}

.form-agree .checkbox {
  margin-bottom: 10px;
}

.form-agree .checkbox {
  font-weight: normal;
  font-size: 14px;
}

.show {
  display: block !important;
}

.hidden {
  display: none !important;
  visibility: hidden !important;
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
						<!--menu Portfolio li end here-->
						<li class="dropdown"><a
							href="<c:url value="/quest/questList"/>">Quest </a></li>
						<!-- mega menu -->
						<li class="dropdown"><a
							href="<c:url value="/board/boardList" />">board </a></li>
						<!-- mega menu -->
						<li class="dropdwon"><a
							href="<c:url value="/my/myPage" />">MyPage </a></li>	
					</ul>


					</div>
					<!--/.nav-collapse -->
				</div>
				<!--container-->
			</div>
		</div>
		<!--navbar-default-->
	<div id="con-wrap">
	<div class="page-container">
		<fieldset>
     	<div class="page-header text-center">
        	<h1>이용 약관</h1>
      	</div>
      	</fieldset>
      	
      	<form class="form-agree" action="registerForm" method="post">
      	<fieldset class="text-left">
     		<p class="lead">약관 내용 솰라솰롸</p>
     		<p class="lead">개인정보를 제공하는데 동의함?</p>
      		<div class="checkbox">
      		<label>
            	<input type="checkbox" name="agree" id="agree_check" value="true"
            		onclick="toggle_btn()">
            	 네, 약관에 동의합니다.
          	</label>
          	</div>
        </fieldset>
        <!-- 
        <div class="btn-group btn-group-justified" role="group">
         -->
			<div id="btn-agree" class="hidden" role="group">
				<button class="btn btn-primary btn-block" type="submit">동의</button>
			</div>
			<div class="show" role="group">
				<button class="btn btn-warning btn-block" type="button"
						onclick="goBack();">거부</button>
			</div>		
		<!-- </div>  -->
        </form>
    </div>
    </div>
</body>
</html>