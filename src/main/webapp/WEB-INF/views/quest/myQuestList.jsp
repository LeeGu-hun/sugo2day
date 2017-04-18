<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<%
	String cp = request.getContextPath();
%>

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
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- font awesome for icons -->
<link href="<%=cp%>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!--mega menu -->
<link href="<%=cp%>/resources/css/yamm.css" rel="stylesheet"
	type="text/css">

<!-- Custom CSS -->
<link href="<%=cp%>/resources/css/style.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/myList.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/letterLayout.css" rel="stylesheet">
<link href="<%=cp%>/resources/css/file-upload-css.css" rel="stylesheet">

<!-- JQuery Main -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Dpick -->
<script src="<%=cp%>/resources/dpick/moment.js"></script>
<script src="<%=cp%>/resources/dpick/bootstrap.min.js"></script>
<script src="<%=cp%>/resources/dpick/bootstrap-datetimepicker.min.js"></script>
<link rel="<%=cp%>/resources/dpick/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<script src="<%=cp%>/resources/dpick/ko.js"></script>

<!-- Custom Script -->
<script src="<%=cp%>/resources/customJS/imageUp.js"></script>
<script src="<%=cp%>/resources/customJS/questToggle.js"></script>
<script src="<%=cp%>/resources/customJS/showSelectedList.js"></script>

<script>
	$(function() {
		var position = $('.body-footer').offset();
		$('html, body').animate({
			scrollTop : position.top-200
		}, 100); 
	});

	function goBack() {
		location.href = "<c:url value='/letter/myLetter' />";
	}

	function goQM() {
		location.href = "<c:url value='/letter/letterManage' />";
	}

	function showN() {
		location.href = "<c:url value='/letter/myLetterN' />";
		$("#fake-focus").focus();
	}

	function showA() {
		location.href = "<c:url value='/letter/myLetter' />";
	}

	$(function() {
		$('#goLetterW').click(function() {
			var position = $('.body-content').offset();
			$('html,body').animate({
				scrollTop : position.top-200
			}, 100);
		});
	});
</script>

</head>
<body>
	<!-- 본문 상단 공통 고정 메뉴 -->
	<div class="wrapper-top-bar">
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
								<li><a href="<c:url value='/logout' />"> <i
										class="fa fa-user"></i> Logout
								</a></li>
								<li><a
									href="javascript:void(window.open('<c:url value='/edit/changePassword' />', '_blank', 'width=350, height=400'))">
										<i class="fa fa-lock"></i> ChangePW
								</a></li>
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
							<li class="dropdwon"><a
								href="<c:url value="/letter/myLetter" />">MyPage </a></li>
							<li class="dropdown"><a
								href="<c:url value="/quest/myQuest" />">Quest Manage</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 본문 내용 -->
	<div id="page-wrapper">
		<div class="body-wrapper">
			<div class="body-header">
			</div>
			<h3>퀘스트 등록</h3>
			<hr>

				<div class="body-content">
					<div id="letter-reg">
						<!-- 글 작성 페이지 -->
						<%@include file="questRegist.jsp"%>
					</div>
				</div>

				<h3>퀘스트 글 목록</h3>
				<hr>

				<div class="body-footer">
					<!-- 검색 폼 들어갈 곳 -->
					<div id="qlist-space">
						<select id="select-QList" style="width: 300px;">
							<option value="1" selected="selected">선택하세요</option>
							<option value="걷기">30분 걷기</option>
							<option value="줄넘기">줄넘기 100개</option>
							<option value="달리기">1km 달리기</option>
						</select> <span style="padding-right: 70px;"></span>
						<button class="btn btn-default btn-xs" type="button"
							onclick="showN()">일반글 보기</button>
						<button class="btn btn-default btn-xs" type="button"
							onclick="showA()">전체글 보기</button>
						<button id="goLetterW" class="btn btn-default btn-xs"
							type="button">글 작성</button>
					</div>
				</div>

				<div class="body-list">
					<!-- 기본적으로 보여줄 글 목록 리스트 -->
					<div id="all-list" class="show">
					<%@include file="questAllList.jsp"%>
					</div>
					<!-- 검색 셀렉트가 될 때 보여질 글 페이지 -->
					<div id="qselected-list" class="hidden"></div>
				</div>
			</div>
		</div>

</body>
</html>