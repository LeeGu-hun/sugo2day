<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>수고했어, 오늘도</title>



<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- custom css (blue color by default) -->
<link href="<%=cp%>/resources/css/style.css" rel="stylesheet"
	type="text/css" media="screen">
<!-- font awesome for icons -->
<link href="<%=cp%>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- flex slider css -->
<link href="<%=cp%>/resources/css/flexslider.css" rel="stylesheet"
	type="text/css" media="screen">
<!-- animated css  -->
<link href="<%=cp%>/resources/css/animate.css" rel="stylesheet"
	type="text/css" media="screen">
<!--owl carousel css-->
<link href="<%=cp%>/resources/owl-carousel/assets/owl.carousel.css"
	rel="stylesheet" type="text/css" media="screen">
<link href="<%=cp%>/resources/owl-carousel/assets/owl.theme.default.css"
	rel="stylesheet" type="text/css" media="screen">
<!--mega menu -->
<link href="<%=cp%>/resources/css/yamm.css" rel="stylesheet"
	type="text/css">
<!--popups css-->
<link href="<%=cp%>/resources/css/magnific-popup.css" rel="stylesheet"
	type="text/css">


</head>


<body>
	<div class="wrapper">
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
								<li><a class="topbar-icons" href="#"><span><i
											class="fa fa-search top-search"></i></span></a></li>
							</c:if>
							<c:if test="${!empty authInfo }">
								<li>${authInfo.name }님,환영합니다.</li>
								<li><a href="<c:url value='/logout' />"><i
										class="fa fa-user"></i> Logout</a></li>
								<li><a href="<c:url value='/edit/changePassword' />"><i
										class="fa fa-lock"></i> ChangePW</a></li>
							</c:if>
						</ul>


						<div class="search">
							<form role="form">
								<input type="text" class="form-control" autocomplete="off"
									placeholder="Write something and press enter"> <span
									class="search-close"><i class="fa fa-times"></i></span>
							</form>
						</div>

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
							<a class="navbar-brand" href="../index.jsp"><img
								src="<%=cp%>/resources/images/Logo.png" alt=""></a>
						</div>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">

							<!--menu Portfolio li end here-->
							<li class="dropdown"><a
								href="<c:url value="/quest/questList"/>">Quest </a></li>

							<!--menu blog li end here-->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Ranking</a></li>


							<!--menu pages li end here-->

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">analysis </a></li>
							<!--features-->

							<!--mega menu-->
							<li class="dropdown yamm-fw"><a
								href="<c:url value="/board/boardList" />">board </a></li>
						</ul>


					</div>
					<!--/.nav-collapse -->
				</div>
				<!--container-->
			</div>
		</div>


		<div id="page-wrapper" style="margin-top: 10px;">
			<div id="quest-inner-wrapper" style="border: 1px solid #bebebe; padding-top: 10px; padding-bottom: 10px;">
				<c:if test="${ empty quest }">
					<a class="btn border-theme"
						href="<c:url value="/quest/questRegister"/>">퀘스트 등록</a>
					<h3>등록된 퀘스트가 없습니다.</h3>
				</c:if>
				<c:if test="${! empty quest }">
					<c:forEach var="quest" items="${quest}">
						<ul class="timeline">
							<li>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h3>
											<a href="#">${quest.SUBJECT }</a>
										</h3>
									</div>
									<div class="timeline-body">
																				
										<div id="Dday">Dday ->${countDday }</div>
										<ul class="list-inline post-detail">
											<li>by <a href="#">${quest.NAME }</a></li>
											<li><a><i class="fa fa-calendar"></i>
													${quest.STARTDATE } ~ <i class="fa fa-calendar"></i>
													${quest.ENDDATE } </a></li>
										</ul>

										
										<a class="btn border-theme"
											href="<c:url value="/quest/questDetail/${quest.NUM }"/>">퀘스트
											상세 보기</a>
									</div>

								</div>
							</li>

						</ul>
					</c:forEach>
				</c:if>

				
			
			<footer id="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<div class="footer-btm">
								<span>&copy;2017. Theme by Design_mylife</span>
							</div>
						</div>
					</div>
				</div>
			</footer>
			</div>
		</div>
	</div>

	<!--default footer end here-->
	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="<%=cp%>/resources/js/jquery.min.js"></script>
	<!--easing plugin for smooth scroll-->
	<script src="<%=cp%>/resources/js/jquery.easing.1.3.min.js"
		type="text/javascript"></script>
	<!--sticky header-->
	<script type="text/javascript"
		src="<%=cp%>/resources/js/jquery.sticky.js"></script>
	<!--flex slider plugin-->
	<script src="<%=cp%>/resources/js/jquery.flexslider-min.js"
		type="text/javascript"></script>
	<!--parallax background plugin-->
	<script src="<%=cp%>/resources/js/jquery.stellar.min.js"
		type="text/javascript"></script>


	<!--digit countdown plugin-->
	<script src="<%=cp%>/resources/js/waypoints.min.js"></script>
	<!--digit countdown plugin-->
	<script src="<%=cp%>/resources/js/jquery.counterup.min.js"
		type="text/javascript"></script>
	<!--on scroll animation-->
	<script src="<%=cp%>/resources/js/wow.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="<%=cp%>/resources/owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>
	<!--popup js-->
	<script src="<%=cp%>/resources/js/jquery.magnific-popup.min.js"
		type="text/javascript"></script>



</body>
</html>
