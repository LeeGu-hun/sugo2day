<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- Context Path 경로를 String cp 로 정의--%>
<% String cp = request.getContextPath(); %>
        
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		
<!-- div 보여주기 script -->
<script>
	function toggle_div() {
		if ($("intput:checkbox[id='quest-show']").is(":checked") == true) {
			$("#all-list").removeClass("hidden");
			$("#quest-list").addClass("show");
		}
		
		if ($("intput:checkbox[id='quest-show']").is(":checked") == false) {
			$("#all-list").removeClass("show");
			$("#quest-list").addClass("hidden");
		}
		
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
			</div>
		</div>
	</div>
	
	<!-- 본문 내용 -->
	<div class="body-wrapper">
		<div class="body-header">
			<h3>퀘스트 관리</h3>
		</div>	
		<div class="body-content">
			<h3>퀘스트 등록 창</h3>
			<!-- 금재 작업한 jsp 파일 인클루드 시키기 -->
			<!-- <jsp:include page="" /> -->
		</div>	
		<div class="body-footer">
			<input type="checkbox" id="quest-show" value="true"
				onclick="toggle_div()">
			<h3>퀘스트 보기</h3>
		</div>	
		<div class="body-list">
			<h3>작성 글 목록</h3>
			<div id="all-list" class="show">
				<!-- 기본적으로 보여줄 글 리스트 -->
				<jsp:include page="incAllList.jsp" />
			</div>
			<div id="quest-list" class="hidden">
				<!-- 퀘스트 보기를 선택하면 보여줄 리스트 -->
				<jsp:include page="IncQList.jsp" />
			</div>
		</div>	
	</div>	
		
</body>
</html>