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
<!-- Bootstrap -->
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- custom css (blue color by default) -->
<link href="<%=cp%>/resources/css/style.css?ver=1" rel="stylesheet"
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
<link href="<%=cp%>/resources/css/yamm.css" rel="stylesheet"
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
							</c:if>
							<c:if test="${!empty authInfo }">
								<li>${authInfo.name }님,환영합니다.</li>
								<li><a href="<c:url value='/logout' />"><i class="fa fa-user"></i> Logout</a></li>
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
							<!-- 메뉴 -->
							<li class="dropdown"><a
								href="<c:url value="/quest/questList"/>">Quest </a></li>
							<li class="dropdown"><a href="<c:url value ="/my/myPage"/>">My page</a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!--container-->
			</div>
		</div>
		<!--navbar-default-->


		<!--carousel slider-->
		<div id="page-wrapper">
			<div id="page-inner-wrapper">
				<div id="carousel-slider"
					class="carousel carousel-slider-wrapper slide" data-ride="carousel">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-slider" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-slider" data-slide-to="1"></li>
						<li data-target="#carousel-slider" data-slide-to="2"></li>
					</ol>
					<!-- Carousel items -->
					<div class="carousel-inner">


						<div class="item active" id="carousel-slide-1">
							<div class="carousel-overlay">
								<div class="carousel-item-content">


									<div class="container">
										<div class="animated fadeInDown delay-1">
											<h1>제발..</h1>
										</div>
										<div class="animated fadeInUp delay-2">
											<p>여자친구가 태어나긴 했나요?</p>
										</div>
									</div>


								</div>
							</div>
						</div>
						<!--item-->
						<div class="item " id="carousel-slide-2">
							<div class="carousel-overlay">
								<div class="carousel-item-content">
									<div class="container">
										<div class="animated fadeInLeft delay-1">
											<h1>최고의 성형은 다이어트다.</h1>
										</div>
										<div class="animated fadeInRight delay-2">
											<p>성형미인으로 다시 태어나겠다.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--item-->
						<div class="item " id="carousel-slide-3">
							<div class="carousel-overlay">
								<div class="carousel-item-content">
									<div class="container">
										<div class="animated fadeInUp delay-1">
											<h1>물러서지 않겠다.</h1>
										</div>
										<div class="animated fadeInUp delay-2">
											<p>두려움을 이겨내는 용기를 가질 수 있기를</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--item-->
					</div>
					<!--carousel inner-->
					<!-- Carousel nav -->
					<a class="carousel-control left" href="#carousel-slider"
						data-slide="prev"> <i class="fa fa-angle-left"></i>
					</a> <a class="carousel-control right" href="#carousel-slider"
						data-slide="next"> <i class="fa fa-angle-right"></i>
					</a>
				</div>
				<!--carousel slider-->

				<div class="divide70"></div>

				<div class="main-place">

					<div class="sugo2day-logo">
						<img class="img-responsive" src="<%=cp%>/resources/images/Logo.png">
					</div>

					<div id="main-text" style="text-align: center;">
					<br>
					
					<div><hr><br><h2>Welcome</h2></div>
						<p>수고했어, 오늘도는 이러쿵 저러쿵 해서 어쩌구저쩌구 스웩스웩</p>
						<p>그렇기 때문 이러이러합니다. 그런데 말입니다.</p>
						<p>성호 언제올껀데?</p>
					<br>
					</div>
				</div>

				<div class="main-content-1">
					<div>
						<img src="<%=cp%>/resources/images/use.png">
					</div>
				</div>
				
				
				<div class="main-content-2" style="text-align: center;">
					<br>
					<br>
					<hr>
					<br>
					<br>
					<h1>상세 사용설명서가 들어갈 영역입니다.</h1>
					 <img src="http://placehold.it/1000x600/FF0000/FFFFFF?text=상세 사용 설명서">
					 <br>
					 <br>
					 <br>
				</div>


			</div>
		</div>
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
	<!--default footer end here-->
	<!--scripts and plugins -->
	<!--must need plugin jquery-->
	<script src="<%=cp%>/resources/js/jquery.min.js"></script>
	<!--bootstrap js plugin-->
	<script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
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

	<!--on scroll animation-->
	<script src="<%=cp%>/resources/js/wow.min.js" type="text/javascript"></script>
	<!--owl carousel slider-->
	<script src="<%=cp%>/resources/owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>

</body>
</html>
