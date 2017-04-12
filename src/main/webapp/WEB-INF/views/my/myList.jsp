<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>
           
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

<!-- Bootstrap main -->
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome for icons -->
<link href="<%=cp%>/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!--mega menu -->
<link href="<%=cp%>/resources/css/yamm.css" rel="stylesheet" type="text/css">
<!-- Custom CSS -->
<link href="<%=cp%>/resources/css/style.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/myList.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/letterLayout.css" rel="stylesheet">

<!-- JQuery Main -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Dpick -->
<script src="<%=cp %>/resources/dpick/moment.js"></script>
<script src="<%=cp %>/resources/dpick/bootstrap.min.js"></script>
<script src="<%=cp %>/resources/dpick/bootstrap-datetimepicker.min.js"></script>
<link rel="<%=cp %>/resources/dpick/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="<%=cp %>/resources/dpick/ko.js"></script>

<!-- Custom Script -->
<script>
	function divToggle() {
		if ($('input:checkbox[id="quest-show"]').is(":checked") == true) {
			$("#all-list").removeClass("show");
			$("#all-list").addClass("hidden");
			$("#quest-list").removeClass("hidden");
			$("#quest-list").addClass("show");
		}
		
		if ($('input:checkbox[id="quest-show"]').is(":checked") == false) {
			$("#quest-list").removeClass("show");
			$("#quest-list").addClass("hidden");
			$("#all-list").removeClass("hidden");
			$("#all-list").addClass("show");
		}
	}
	
	function questToggle() {
		if ($('input:radio[id="isquest"]').is(":checked") == true && $('input:radio[id="isnormal"]').is(":checked") == false) {
			$("#datepick-div").removeClass("hidden");
			$("#datepick-div").addClass("show");
		} else if ($('input:radio[id="isquest"]').is(":checked") == false && $('input:radio[id="isnormal"]').is(":checked") == true) {
			$("#datepick-div").removeClass("show");
			$("#datepick-div").addClass("hidden");
		} else {
			$("#datepick-div").removeClass("show");
			$("#datepick-div").addClass("hidden");
		}
	}
		
	function goBack() {
		location.href = "<c:url value='/letter/myLetter' />";
	}
</script>		

</head>
<body>
<!-- 본문 상단 공통 고정 메뉴 -->
	<div class="top-bar-light">
		<div class="container">
			<div class="row">
				<div class="col-sm-5 hidden-xs">
					<div class="top-bar-socials"></div>
				</div>
				<div class="col-sm-7 text-right">
					<ul class="list-inline top-dark-right">
						<c:if test="${empty authInfo }">
							<li><a href="<c:url value='/login' />"><i
									class="fa fa-lock"></i> Login</a></li>
							<li><a href="<c:url value='/register/registerTerm' />"><i
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
						<li class="dropdwon"><a href="<c:url value="/letter/myLetter" />">MyPage </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 본문 내용 -->
	<div class="body-wrapper">
		<div class="body-header">
			<!-- B 페이지에서 사용 
			<button type="button" class="btn btn-default btn-lg ">퀘스트 등록</button>
			 -->
			<button type="button" class="btn btn-default btn-lg ">퀘스트 관리</button>
			<hr>
		</div>	
		
		<div class="body-content">
			<div id="letter-reg">
				<!-- 글 작성 페이지 -->
				<%@include file="letterRegist.jsp" %>
			</div>
		</div>	
		
		<h3>작성 글 목록</h3>
		<hr>
		
		<div class="body-footer">
			<input type="checkbox" id="quest-show" value="true" onclick="divToggle()" />
			<span class="lead">퀘스트글 보기</span>
		</div>	
		
		<div class="body-list">
			<div id="all-list" class="show">
				<!-- 기본적으로 보여줄 글 리스트 -->
				<%@include file="incAllList.jsp" %>
			</div>
			<div id="quest-list" class="hidden">
				<!-- 퀘스트 글 리스트 -->
				<%@include file="incQList.jsp" %>
			</div>
		</div>	
	</div>	
	
</body>
</html>