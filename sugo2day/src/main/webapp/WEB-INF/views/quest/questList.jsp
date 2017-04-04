<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>assan - Professional theme</title>

        <!-- Bootstrap -->
        <link href="<%=cp%>/resources/jj/sibal/css/bootstrap.min.css" rel="stylesheet">
        <!-- custom css (blue color by default) -->
        <link href="<%=cp%>/resources/jj/css/style2.css" rel="stylesheet" type="text/css" media="screen">
		<script src="<%=cp%>/resources/jj/js/jquery-1.11.0.js" type="text/javascript"></script>
        <!-- font awesome for icons -->
        <link href="<%=cp%>/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- flex slider css -->
        <link href="<%=cp%>/resources/css/flexslider.css" rel="stylesheet" type="text/css" media="screen">
        <!-- animated css  -->
        <link href="<%=cp%>/resources/css/animate.css" rel="stylesheet" type="text/css" media="screen">
        <!--owl carousel css-->
        <link href="<%=cp%>/resources/owl-carousel/assets/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
        <link href="<%=cp%>/resources/owl-carousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css" media="screen">
        <!--mega menu -->
        <link href="<%=cp%>/resources/css/yamm.css" rel="stylesheet" type="text/css">
        <!--popups css-->
        <link href="<%=cp%>/resources/css/magnific-popup.css" rel="stylesheet" type="text/css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
    	
    
               <div class="top-bar-light">            
            <div class="container">
                <div class="row">
                    <div class="col-sm-5 hidden-xs">
                        <div class="top-bar-socials">
                            <a href="#" class="social-icon-sm si-gray si-gray-round si-facebook">
                                <i class="fa fa-facebook"></i>
                                <i class="fa fa-facebook"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-gray si-gray-round si-twitter">
                                <i class="fa fa-twitter"></i>
                                <i class="fa fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-gray si-gray-round si-g-plus">
                                <i class="fa fa-google-plus"></i>
                                <i class="fa fa-facebook"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-gray si-gray-round si-g-plus">
                                <i class="fa fa-youtube"></i>
                                <i class="fa fa-youtube"></i>
                            </a>
                            <a href="#" class="social-icon-sm si-gray si-gray-round si-instagram">
                                <i class="fa fa-instagram"></i>
                                <i class="fa fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-7 text-right">
                        <ul class="list-inline top-dark-right">                      
                            <li class="hidden-sm hidden-xs"><i class="fa fa-envelope"></i> Support@mail.com</li>
                            <li class="hidden-sm hidden-xs"><i class="fa fa-phone"></i> +01 1800 453 7678</li>
                            <li><a href="#"><i class="fa fa-lock"></i> Login</a></li>
                            <li><a href="#"><i class="fa fa-user"></i> Sign Up</a></li>
                            <li><a class="topbar-icons" href="#"><span><i class="fa fa-search top-search"></i></span></a></li>
                        </ul>
                        <div class="search">
                            <form role="form">
                                <input type="text" class="form-control" autocomplete="off" placeholder="Write something and press enter">
                                <span class="search-close"><i class="fa fa-times"></i></span>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div><!--top-bar end here-->
        <!--navigation -->
        <div class="navbar navbar-default navbar-static-top yamm sticky" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img
								src="<%=cp%>/resources/images/Logo.png" alt=""></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                         <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Sliders </a>
                          
                                </li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Revolution 5</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="r5-classic.html">Carousel classic</a></li> 
                                        <li><a href="r5-gym.html">Slider Gym</a></li> 
                                    </ul>
                                </li>
                              
                                <li><a href="home-parallax.html">Home - Parallax</a></li>
                                <li><a href="home-youtube-hero.html">Home -Youtube hero</a></li><li><a href="home-self-video.html">Home - Self Video</a></li>
                                <li><a href="home-boxed.html">Home - Boxed</a></li>
                                <li><a href="home-construction.html">Home - Construction</a></li>
                                <li><a href="home-portfolio.html">Home - Portfolio</a></li>
                                  
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Multi level menu </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"> menu level 2</a></li>
                                        <li class="dropdown-submenu">
                                            <a tabindex="-1" href="#">menu level 2 </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#"> menu level 3</a></li>
                                                <li><a href="#"> menu level 3</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!--menu home li end here-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown">Portfolio <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu multi-level" role="menu">
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Cube Portfolio </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="juicy-portfolio.html"> Juicy Projects</a></li>
                                        <li><a href="cube-fullwidth.html"> Full Width</a></li>
                                        <li><a href="cube-masonry.html"> Masonry</a></li>                         
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Grid Text Boxed </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="portfolio-2.html"> 2 Columns</a></li>
                                        <li><a href="portfolio-3.html"> 3 Columns</a></li>
                                        <li><a href="portfolio-4.html"> 4 Columns</a></li>                         

                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Grid Boxed </a>
                                   
                                </li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">No space Full width </a>
                                  
                                </li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">No Space Boxed </a>
                                   
                                </li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Portfolio Masonry </a>
                                  
                                </li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Portfolio Items</a>
                                   
                                </li>

                            </ul>
                        </li>
                        <!--menu Portfolio li end here-->
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <i class="fa fa-angle-down"></i></a>
                         
                        </li>
                        <!--menu blog li end here-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="about.html">About</a></li>
                                <li><a href="me.html">About - Me</a></li>
                                <li><a href="services.html">Services</a></li>
                                <li><a href="team.html">Our Team</a></li>
                                <li><a href="pricing.html">Our Pricing</a></li>                                
                                <li><a href="faq.html">FAQS</a></li> 
                                <li><a href="email-template.html">Email Template</a></li>
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Contact </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="contact.html"> Contact default</a></li>
                                        <li><a href="contact-advanced.php">Contact advanced</a></li>
                                        <li><a href="contact-option.php">Contact option</a></li>
                                        <li><a href="contact-flat.php">Contact Flat</a></li>
                                    </ul>
                                </li>                                          
                                <li><a href="search-results.html">Search Results</a></li>                                
                                <li><a href="career.html">Career</a></li>
                                <li><a href="gallery.html">Gallery</a></li>

                                <li><a href="process.html">Our Process</a></li>

                            </ul>
                        </li>
                        <!--menu pages li end here-->

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Features  <i class="fa fa-angle-down"></i></a> 
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Headers </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="index.html">Header 1 - Default</a></li>
                                        <li><a href="header-dark.html">Header 2 - dark </a></li>
                                        <li><a href="header-transparent.html">header 3 - transparent </a></li>
                                        <li><a href="header-center-logo.html">header 4 - Logo center </a></li>
                                        <li><a href="header-side-panel.html">header 5 - Side panel </a></li>
                                    </ul>
                                </li> 
                                <li class="dropdown-submenu">
                                    <a tabindex="-1" href="#">Footers </a>
 
                        </li><!--features-->
                     
                        <!--mega menu-->
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
                </div><!--/.nav-collapse -->
            </div><!--container-->
        </div><!--navbar-default-->
         
        
        
        <div class="breadcrumb-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>Blog timeline</h4>
                    </div>
                    <div class="col-sm-6 hidden-xs text-right">
                        <ol class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li>Blank</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div><!--breadcrumbs-->
        
        
    <div id = "page-wrapper">
    <c:if test="${ empty quest }">
    	<a class="btn border-theme" href="<c:url value="/quest/questRegister"/>">퀘스트 등록</a>
    	<h3>등록된 퀘스트가 없습니다.</h3>
    </c:if>
    <c:if test="${! empty quest }">
     <c:forEach var="quest" items="${quest}">
        	  <ul class="timeline" >
                <li>
                    <div class="timeline-badge primary"></div>
                    <div class="timeline-panel wow animated fadeInUp" >
                        <div class="timeline-heading">
<%--                             <img class="img-responsive" src="<%=cp%>/resources/img/img-6.jpg" alt=""/> --%>
                        </div>
                        <div class="timeline-body">
                            <h2><a href="#">${quest.SUBJECT }</a></h2>
<%--                             <c:if test="${!coundDday > 0}"> --%>
<%--                             	<div>Dday ->${countDday }</div> --%>
<%--                             </c:if> --%>
                            
<%--                             <c:if test="${coundDday <= 0 }"> --%>
<!--                             	<div id="Dday"></div> -->
<%--                             </c:if> --%>
                            <div id="Dday">Dday ->${countDday }</div>
                            <ul class="list-inline post-detail">
                                <li>by <a href="#">${quest.NAME }</a></li>
                                <li><a><i class="fa fa-calendar"></i> ${quest.STARTDATE } ~ <i class="fa fa-calendar"></i> ${quest.ENDDATE } </a></li>                            
                            </ul>
                        	
<!--                             <p id="countdown">Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p> -->
                            <a class="btn border-theme" href="<c:url value="/quest/questDetail/${quest.NUM }"/>">퀘스트 상세 보기</a>
                        </div>

                    </div>
                </li>
                            
            </ul>
 </c:forEach>
 </c:if>
 <!--  <li class="timeline-inverted">
                    <div class="timeline-badge primary"><i class="fa fa-image invert"></i></div>
                    <div class="timeline-panel wow animated fadeInUp">
                        <div class="timeline-heading">
                            <img class="img-responsive" src="<%=cp%>/resources/img/img-5.jpg" alt=""/>
                        </div>
                        <div class="timeline-body">
                            <h2><a href="#">Standard image post</a></h2>
                            <ul class="list-inline post-detail">
                                <li>by <a href="#">assan</a></li>
                                <li><i class="fa fa-calendar"></i> 31st july 2014</li>                            
                            </ul>
                            <p>Lorem Ipsum is simply dummy text of the printing and type setting industry.printing and type setting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                            </p>

                            <a class="btn border-theme" href="#">Read More</a>
                        </div>

                    </div>
                </li>
                <li>
                    <div class="timeline-badge primarya"><i class="fa fa-sliders"></i></div>
                    <div class="timeline-panel wow animated fadeInUp">
    


                    </div>
                </li>-->               

       	

        <!-- End Content Part -->
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
        <!--scripts and plugins -->
        <!--must need plugin jquery-->
        <script src="<%=cp%>/resources/js/jquery.min.js"></script>        
        <!--bootstrap js plugin-->
        <script src="<%=cp%>/resources/jj/sibal/js/bootstrap.min.js" type="text/javascript"></script>       
        <!--easing plugin for smooth scroll-->
        <script src="<%=cp%>/resources/js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <!--sticky header-->
        <script type="text/javascript" src="<%=cp%>/resources/js/jquery.sticky.js"></script>
        <!--flex slider plugin-->
        <script src="<%=cp%>/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
        <!--parallax background plugin-->
        <script src="<%=cp%>/resources/js/jquery.stellar.min.js" type="text/javascript"></script>
        
        
        <!--digit countdown plugin-->
        <script src="<%=cp%>/resources/js/waypoints.min.js"></script>
        <!--digit countdown plugin-->
        <script src="<%=cp%>/resources/js/jquery.counterup.min.js" type="text/javascript"></script>
        <!--on scroll animation-->
        <script src="<%=cp%>/resources/js/wow.min.js" type="text/javascript"></script> 
        <!--owl carousel slider-->
        <script src="<%=cp%>/resources/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
        <!--popup js-->
        <script src="<%=cp%>/resources/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
        
        


        <!--customizable plugin edit according to your needs-->
        <script src="js/custom.js" type="text/javascript"></script>
    </body>
</html>
