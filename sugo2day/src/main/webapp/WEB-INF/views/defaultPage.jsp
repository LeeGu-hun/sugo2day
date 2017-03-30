<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- Context Path 경로를 String cp 로 정의--%>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>assan - Professional theme</title>
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

							<li><a href="<c:url value="/login" />"><i class="fa fa-lock"></i> Login</a></li>
							<li><a href="<c:url value="/register/registerTerm" />"><i class="fa fa-user"></i> Sign Up</a></li>
							<li><a class="topbar-icons" href="#"><span><i
										class="fa fa-search top-search"></i></span></a></li>
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
							<li class="dropdown active "><a href="index.jsp"
								class="dropdown-toggle" data-toggle="dropdown">Home <i
									class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu multi-level" role="menu"
									aria-labelledby="dropdownMenu">
									<li class="dropdown-submenu"><a tabindex="-1" href="#">Sliders
									</a>
										<ul class="dropdown-menu">
											<li><a href="index.html">Revolution Full-width</a></li>
											<li><a href="home-revolution-boxed.html">Revolution
													Boxed</a></li>
											<li><a href="home-revolution-fullscreen.html">Revolution
													Fullscreen</a></li>
											<li><a href="ken-burns.html">Ken burns Slider</a></li>
											<li><a href="home-carousel.html">Carousel Slider</a></li>
											<li><a href="home-flexslider.html">Flex slider</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1" href="#">Revolution
											5</a>
										<ul class="dropdown-menu">
											<li><a href="r5-classic.html">Carousel classic</a></li>
											<li><a href="r5-gym.html">Slider Gym</a></li>
										</ul></li>

									<li><a href="home-parallax.html">Home - Parallax</a></li>
									<li><a href="home-youtube-hero.html">Home -Youtube
											hero</a></li>
									<li><a href="home-self-video.html">Home - Self Video</a></li>
									<li><a href="home-boxed.html">Home - Boxed</a></li>
									<li><a href="home-construction.html">Home -
											Construction</a></li>
									<li><a href="home-portfolio.html">Home - Portfolio</a></li>

									<li class="dropdown-submenu"><a tabindex="-1" href="#">Multi
											level menu </a>
										<ul class="dropdown-menu">
											<li><a href="#"> menu level 2</a></li>
											<li class="dropdown-submenu"><a tabindex="-1" href="#">menu
													level 2 </a>
												<ul class="dropdown-menu">
													<li><a href="#"> menu level 3</a></li>
													<li><a href="#"> menu level 3</a></li>
												</ul></li>
										</ul></li>
								</ul></li>
							<!--menu home li end here-->
							
							<!--menu Portfolio li end here-->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Quest <i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu" role="menu">
									
								</ul></li>
							<!--menu blog li end here-->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Pages <i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu" role="menu">
									
										<ul class="dropdown-menu">
											
										</ul></li>
									<li><a href="search-results.html">Search Results</a></li>
									<li><a href="career.html">Career</a></li>
									<li><a href="gallery.html">Gallery</a></li>

									<li><a href="process.html">Our Process</a></li>

								</ul></li>
							<!--menu pages li end here-->

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Features <i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu">
									<li class="dropdown-submenu"><a tabindex="-1" href="#">Headers
									</a>
										<ul class="dropdown-menu">
											<li><a href="index.html">Header 1 - Default</a></li>
											<li><a href="header-dark.html">Header 2 - dark </a></li>
											<li><a href="header-transparent.html">header 3 -
													transparent </a></li>
											<li><a href="header-center-logo.html">header 4 -
													Logo center </a></li>
											<li><a href="header-side-panel.html">header 5 - Side
													panel </a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1" href="#">Footers
									</a>
										<ul class="dropdown-menu">
											<li><a href="index.html">Footer dark - 1</a></li>
											<li><a href="footer-2.html">Footer dark - 2</a></li>
											<li><a href="footer-3.html">Footer dark - 3 </a></li>
											<li><a href="footer-light-1.html">Footer Light - 1</a></li>
											<li><a href="footer-light-2.html">Footer Light - 2</a></li>
											<li><a href="footer-light-3.html">Footer Light - 3 </a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1" href="#">Page
											Templates </a>
										<ul class="dropdown-menu">
											<li><a href="full-width.html">Full Width</a></li>
											<li><a href="left-sidebar.html">Left Sidebar</a></li>
											<li><a href="right-sidebar.html">Right sidebar</a></li>
											<li><a href="both-sidebar.html">Both Sidebar</a></li>
											<li><a href="both-right-sidebar.html">Both Right
													sidebar</a></li>
											<li><a href="both-left-sidebar.html">Both Left
													Sidebar</a></li>
										</ul></li>
									<li class="dropdown-submenu"><a tabindex="-1" href="#">Coming
											Soon </a>
										<ul class="dropdown-menu">
											<li><a href="coming-soon-1.html">Coming soon 1</a></li>
											<li><a href="coming-soon-2.html">Coming soon 2</a></li>
											<li><a href="coming-soon-3.html">Coming soon 3</a></li>
										</ul></li>
									<li><a href="side-nav.html">side navigation </a></li>
									<li><a href="maintenance-page.html">Maintenance page </a></li>
									<li><a href="blank.html">Blank Page</a></li>
									<li><a href="error.html">Error - 404</a></li>
									<li><a href="login-ragister.html">Login / Register</a></li>
									<li><a href="login-ragister-classic.html">Login /
											Register - Classic </a></li>
									<li><a href="invoice.html">Invoice</a></li>
									<li><a href="site-map.html">Site Map</a></li>
								</ul></li>
							<!--features-->

							<!--mega menu-->
							<li class="dropdown yamm-fw"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">Shortcodes <i
									class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu">
									<li>
										<div class="yamm-content">
											<div class="row">

												<div class="col-sm-3">
													<h3 class="heading">Shortcode 1</h3>
													<ul class="nav mega-vertical-nav">

														<li><a href="typography.html"><i
																class="fa fa-text-height"></i> Typography</a></li>
														<li><a href="grid-system.html"><i
																class="fa fa-bars"></i> Grid System</a></li>
														<li><a href="testimonials.html"><i
																class="fa fa-comment-o"></i> testimonials </a></li>
														<li><a href="tabs-accordian.html"><i
																class="fa fa-table"></i> tabs & Accordions </a></li>
													</ul>

												</div>
												<div class="col-sm-3">
													<h3 class="heading">Shortcode 2</h3>
													<ul class="nav mega-vertical-nav">
														<li><a href="buttons.html"><i class="fa fa-cog"></i>
																Buttons</a></li>
														<li><a href="social-buttons.html"><i
																class="fa fa-share"></i> Social Buttons</a></li>
														<li><a href="alerts.html"><i class="fa fa-bell"></i>
																Alerts </a></li>
														<li><a href="other-elements.html"><i
																class="fa fa-cogs"></i> Other Elements </a></li>
													</ul>
												</div>
												<div class="col-sm-3">
													<h3 class="heading">Shortcode 3</h3>
													<ul class="nav mega-vertical-nav">
														<li><a href="font-awesome.html"><i
																class="fa fa-flag"></i> Font Awesome icons</a></li>
														<li><a href="pe-icons.html"><i class="pe-7s-like"></i>
																Pe icons</a></li>
														<li><a href="carousel-shortcodes.html"><i
																class="fa fa-sliders"></i> Carousel Sliders </a></li>
														<li><a href="tables.html"><i class="fa fa-table"></i>
																Tables </a></li>
													</ul>
												</div>
												<div class="col-sm-3">
													<h3 class="heading">Shortcode 4</h3>
													<ul class="nav mega-vertical-nav">
														<li><a href="pricing-tables.html"><i
																class="fa fa-usd"></i> Pricing tables</a></li>
														<li><a href="videos.html"><i class="fa fa-image"></i>
																Responsive videos</a></li>
														<li><a href="cta.html"><i class="fa fa-map-pin"></i>
																call to cations </a></li>
														<li><a href="maps.html"><i
																class="fa fa-map-marker"></i> Google maps </a></li>
													</ul>
												</div>
											</div>
										</div>
									</li>
								</ul></li>
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
											<h1>Ultimate Flexible</h1>
										</div>
										<div class="animated fadeInUp delay-2">
											<p>Clean & Creative Multipurpose Theme</p>
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
											<h1>Responsive at all</h1>
										</div>
										<div class="animated fadeInRight delay-2">
											<p>Fully responsive creative template</p>
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
											<h1>Ultimate Flexible</h1>
										</div>
										<div class="animated fadeInUp delay-2">
											<p>Clean & Creative Multipurpose Theme</p>
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

				<div class="main-content-1">
					<div class="how_to_use">
						<img class="img-responsive" src="http://placehold.it/230x400">
					</div>
					<div class="how_to_use">
						<img class="img-responsive"
							src="<%=cp%>/resources/images/use2.png">
					</div>
					<div class="how_to_use">
						<img class="img-responsive"
							src="<%=cp%>/resources/images/use3.png">
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
