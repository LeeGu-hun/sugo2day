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
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


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
							<a class="navbar-brand" href="index.jsp"><img
								src="<%=cp%>/resources/images/Logo.png" alt=""></a>
						</div>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							
							<!--menu Portfolio li end here-->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Quest </a>
								</li>
							<!--menu blog li end here-->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Ranking</a>
								<ul class="" role="menu">
									</li>
						</ul>
						</li>
						<!--menu pages li end here-->

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">analysis </a>
							</li>
						<!--features-->

						<!--mega menu-->
						<li class="dropdown yamm-fw"><a href="<c:url value="/board/boardList" />"
							>board </a>
							</li>
						<!--menu Features li end here-->
						<!--mega menu end-->

						<!--                        <li class="dropdown">
                                                    <a href="#" class=" dropdown-toggle" data-toggle="dropdown"><i class="fa fa-lock"></i> Sign In</a>
                                                    <div class="dropdown-menu dropdown-menu-right dropdown-login-box animated fadeInUp">
                                                        <form role="form">
                                                            <h4>Signin</h4>
                        
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                                    <input type="text" class="form-control" placeholder="Username">
                                                                </div>
                                                                <br>
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                                    <input type="password" class="form-control" placeholder="Password">
                                                                </div>
                                                                <div class="checkbox pull-left">
                                                                    <label>
                                                                        <input type="checkbox"> Remember me
                                                                    </label>
                                                                </div>
                                                                <a class="btn btn-theme-bg pull-right">Login</a>
                                                                                                        <button type="submit" class="btn btn-theme pull-right">Login</button>                 
                                                                <div class="clearfix"></div>
                                                                <hr>
                                                                <p>Don't have an account! <a href="#">Register Now</a></p>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </li> menu login li end here-->
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


						<div class="item  active" id="carousel-slide-1">
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

				<div calss="main-place">
					<div class="sugo2day-logo">
						<img src="<%=cp%>/resources/images/Logo.png">
					</div>
					<div>
						<h1>Welcome</h1>
						<p>수고했어, 오늘도는 이러쿵 저러쿵 해서 어쩌구저쩌구 스웩스웩</p>
						<p>그렇기 때문 이러이러합니다. 그런데 말입니다.</p>
						<p>성배야 수술 잘하고 돌아오길 바래 꼭!</p>
						
					</div> 
				</div>

				<div class="main-content-1">
					<div>
						<img src="<%=cp%>/resources/images/use.png">
					</div>
				</div>

				<div class="divide60"></div>
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




	<!--customizable plugin edit according to your needs-->
	<script src="<%=cp%>/resources/js/custom.js" type="text/javascript"></script>
</body>
</html>
