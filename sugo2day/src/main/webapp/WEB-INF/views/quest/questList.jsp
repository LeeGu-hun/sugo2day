<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>assan - Professional theme</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap -->
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- custom css (blue color by default) -->
<%-- <link href="<%=cp%>/resources/css/style.css" rel="stylesheet" --%>
<!-- 	type="text/css" media="screen"> -->
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
<style>
</style>
<script>
	function go() {
		location.href = '<c:url value="/quest/questRegister"/>';
	}
</script>
</head>
<body>
	<div class="top-bar-light">

		<input type="button" value="+" onclick="go(); "
			style="border-radius: 10px; width: 30px; height: 30px;" />

		<!--  <c:if test="${! empty quest}">
			<table>
				<c:forEach var="quest" items="${quest}">
					<tr>
						<td>${quest.NAME}</td>
						<td><a
							href="<c:url value="/member/detail/${quest.SUBJECT}"/>"> <label>${quest.STARTDATE}</label>
								~ <label>${quest.ENDDATE}</label>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<ul class="pageUL">
							<c:if test="${pageMaker.prev }">
								<li><a href='#' onclick='pageGo(${pageMaker.page-1});'>이전</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}"
								var="idx">
								<li
									class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
									<a href='#' onclick='pageGo(${idx});'>${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li><a href='#' onclick='pageGo(${pageMaker.page+1});'>다음</a></li>
							</c:if>
						</ul>
					</td>
				</tr>
			</table>
		</c:if>-->

		<div class="container" >
			<div class="row">
				<div class="col-sm-5 hidden-xs">
					<div class="top-bar-socials">
						<a href="#"
							class="social-icon-sm si-gray si-gray-round si-facebook"> <i
							class="fa fa-facebook"></i> <i class="fa fa-facebook"></i>
						</a> <a href="#"
							class="social-icon-sm si-gray si-gray-round si-twitter"> <i
							class="fa fa-twitter"></i> <i class="fa fa-twitter"></i>
						</a> <a href="#"
							class="social-icon-sm si-gray si-gray-round si-g-plus"> <i
							class="fa fa-google-plus"></i> <i class="fa fa-facebook"></i>
						</a> <a href="#"
							class="social-icon-sm si-gray si-gray-round si-g-plus"> <i
							class="fa fa-youtube"></i> <i class="fa fa-youtube"></i>
						</a> <a href="#"
							class="social-icon-sm si-gray si-gray-round si-instagram"> <i
							class="fa fa-instagram"></i> <i class="fa fa-instagram"></i>
						</a>
					</div>
				</div>
				<div class="col-sm-7 text-right">
					<ul class="list-inline top-dark-right">
						<li class="hidden-sm hidden-xs"><i class="fa fa-envelope"></i>
							Support@mail.com</li>
						<li class="hidden-sm hidden-xs"><i class="fa fa-phone"></i>
							+01 1800 453 7678</li>
						<li><a href="#"><i class="fa fa-lock"></i> Login</a></li>
						<li><a href="#"><i class="fa fa-user"></i> Sign Up</a></li>
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
				<a class="navbar-brand" href="index.html"><img
					src="<%=cp %>/resources/img/logo.png" alt="ASSAN" style="width:180px; position: absolute; bottom: 2px;"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Home <i class="fa fa-angle-down"></i></a>
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
							<li><a href="home-youtube-hero.html">Home -Youtube hero</a></li>
							<li><a href="home-self-video.html">Home - Self Video</a></li>
							<li><a href="home-boxed.html">Home - Boxed</a></li>
							<li><a href="home-construction.html">Home - Construction</a></li>
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
					<li class="dropdown"><a href="#" class="dropdown-toggle "
						data-toggle="dropdown">Portfolio <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu multi-level" role="menu">
							<li class="dropdown-submenu"><a tabindex="-1" href="#">Cube
									Portfolio </a>
								<ul class="dropdown-menu">
									<li><a href="juicy-portfolio.html"> Juicy Projects</a></li>
									<li><a href="cube-fullwidth.html"> Full Width</a></li>
									<li><a href="cube-masonry.html"> Masonry</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a tabindex="-1" href="#">Grid
									Text Boxed </a>
								<ul class="dropdown-menu">
									<li><a href="portfolio-2.html"> 2 Columns</a></li>
									<li><a href="portfolio-3.html"> 3 Columns</a></li>
									<li><a href="portfolio-4.html"> 4 Columns</a></li>

								</ul></li>
							<li class="dropdown-submenu"><a tabindex="-1" href="#">Grid
									Boxed </a>
								<ul class="dropdown-menu">
									<li><a href="grid-portfolio-2-no-text.html">2 Columns</a></li>
									<li><a href="grid-portfolio-3-no-text.html">3 Columns</a></li>
									<li><a href="grid-portfolio-4-no-text.html">4 Columns</a></li>

								</ul></li>
							<li class="dropdown-submenu"><a tabindex="-1" href="#">No
									space Full width </a>
								<ul class="dropdown-menu">
									<li><a href="portfolio-full-width-2.html">2 columns</a></li>
									<li><a href="portfolio-full-width-3.html">3 columns</a></li>
									<li><a href="portfolio-full-width-4.html">4 columns</a></li>
									<li><a href="portfolio-full-width-5.html">5 columns</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a tabindex="-1" href="#">No
									Space Boxed </a>
								<ul class="dropdown-menu">
									<li><a href="portfolio-no-space-bx-2.html"> 2 Columns</a></li>
									<li><a href="portfolio-no-space-bx-3.html"> 3 Columns</a></li>
									<li><a href="portfolio-no-space-bx-4.html"> 4 Columns</a></li>

								</ul></li>
							<li class="dropdown-submenu"><a tabindex="-1" href="#">Portfolio
									Masonry </a>
								<ul class="dropdown-menu">
									<li><a href="masonry-portfolio-3.html"> 3 Columns</a></li>
									<li><a href="masonry-portfolio-4.html"> 4 Columns</a></li>
									<li><a href="masonry-portfolio-full.html"> Full Width</a></li>

								</ul></li>
							<li class="dropdown-submenu"><a tabindex="-1" href="#">Portfolio
									Items</a>
								<ul class="dropdown-menu">
									<li><a href="portfolio-single.html">Single item</a></li>
									<li><a href="portfolio-single-2.html">Single item 2</a></li>
								</ul></li>

						</ul></li>
					<!--menu Portfolio li end here-->
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown">Blog <i
							class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="blog-full.html">Blog - full width</a></li>
							<li><a href="blog-leftimg.html">Blog - left image</a></li>
							<li><a href="blog-sidebar.html">Blog - sidebar</a></li>
							<li><a href="blog-2col.html">Blog - 2 column</a></li>
							<li><a href="blog-timeline.html">Blog - Timeline</a></li>
							<li><a href="blog-masonary.html">Blog - Masonry</a></li>
							<li><a href="blog-single.html">Blog - Single</a></li>
						</ul></li>
					<!--menu blog li end here-->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Pages <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="about.html">About</a></li>
							<li><a href="me.html">About - Me</a></li>
							<li><a href="services.html">Services</a></li>
							<li><a href="team.html">Our Team</a></li>
							<li><a href="pricing.html">Our Pricing</a></li>
							<li><a href="faq.html">FAQS</a></li>
							<li><a href="email-template.html">Email Template</a></li>
							<li class="dropdown-submenu"><a tabindex="-1" href="#">Contact
							</a>
								<ul class="dropdown-menu">
									<li><a href="contact.html"> Contact default</a></li>
									<li><a href="contact-advanced.php">Contact advanced</a></li>
									<li><a href="contact-option.php">Contact option</a></li>
									<li><a href="contact-flat.php">Contact Flat</a></li>
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
									<li><a href="header-center-logo.html">header 4 - Logo
											center </a></li>
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
									<li><a href="both-left-sidebar.html">Both Left Sidebar</a></li>
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
												<li><a href="maps.html"><i class="fa fa-map-marker"></i>
														Google maps </a></li>
											</ul>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
					<!--menu Features li end here-->
					<!--mega menu end-->
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		<!--container-->
	</div>
	<!--breadcrumbs-->
	<div class="divide80"></div>
	<!--=== Content Part ===-->
	<div class="container" style="background-color: #f5f5f5;'">
		<ul class="timeline">
			<c:forEach var="quest" items="${quest}">
				<li>
					<div class="timeline-badge primary">
					</div>
					<div class="timeline-panel wow animated fadeInUp">
						<div class="timeline-heading">
							<!-- <img class="img-responsive" src="img/img-6.jpg" alt="" /> -->
						</div>
						<div class="timeline-body">
							<h2>
								<a href="#">${quest.NAME}</a>
							</h2>
							<ul class="list-inline post-detail">
								<li>by <a href="#">${quest.NAME}</a></li>
								<li><i class="fa fa-calendar"></i> ${quest.STARTDATE}</li>
							</ul>

							<tr>
								<td>${quest.NAME}</td>
								<td><a href="#"/>${quest.SUBJECT }</a></td>  
								<td><label class="list-inline post-detail"><h2>${quest.STARTDATE}</h2></label>~ 
								<label class="list-inline post-detail"><h2>${quest.ENDDATE}</h2></label></td>
							</tr>

							<a class="btn border-theme" href="<c:url value="/member/detail/${quest.NUM}"/>">퀘스트 상세 보기</a>
						</div>
			</c:forEach>
	</div>
	</li>
	</ul>
	</div>
	<!--/container-->
	<!-- End Content Part -->
	<div class="divide60"></div>
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6 margin30"></div>
			</div>
		</div>
	</footer>
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
	<script src="js/custom.js" type="text/javascript"></script>
</body>
</html>

</html>