<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 
<!-- Styles -->

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Animate CSS -->
<link href="css/animate.min.css" rel="stylesheet">
<!-- Basic stylesheet -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- Font awesome CSS -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-color.css" rel="stylesheet">
<!-- player bar css -->
<link href="css/playerbar.css" rel="stylesheet">
<!-- player bar icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Favicon -->
<link rel="shortcut icon" href="img/logo/favicon.ico">  

<!-- Javascript files -->
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- Bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- WayPoints JS -->
	<script src="js/waypoints.min.js"></script>
	<!-- Include js plugin -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- One Page Nav -->
	<script src="js/jquery.nav.js"></script>
	<!-- Respond JS for IE8 -->
	<script src="js/respond.min.js"></script>
	<!-- HTML5 Support for IE -->
	<script src="js/html5shiv.js"></script>
	<!-- Custom JS -->
	<script src="js/custom.js"></script>
	<!-- 	plaer bar function js -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="js/player.js"></script>    
--%>
</head>
<body>		
<!-- header area -->
		<header>
			<!-- secondary menu -->
			<nav class="secondary-menu">
				<div class="container">
					<!-- secondary menu left link area -->
					<div class="sm-left">
						<!-- <strong>Phone</strong>:&nbsp; <a href="#">555 555 555</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<strong>E-mail</strong>:&nbsp; <a href="#">music.site@melodi.com</a> -->
					</div>
					<!-- secondary menu right link area -->
					
					
					<div class="sm-right">
						<!-- social link -->
						
						<div class="sm-social-link">
						<div  style="display:inline-block;line-height: 20px;color: #333;">
							<form action="<c:url value="FuzzySelect.controller"/>" method="get">
								<input class="form-control-sm" type="text" name="selectCondition"/>
								<input class="form-control-sm" type="submit" value="Send">
							</form>
						</div>
							<a class="h-facebook" href="#"><i class="fa fa-facebook"></i></a>
							<a class="h-twitter" href="#"><i class="fa fa-twitter"></i></a> <a
								class="h-google" href="#"><i class="fa fa-google-plus"></i></a>
							<a class="h-linkedin" href="#"><i class="fa fa-linkedin"></i></a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</nav>
			<!-- primary menu -->
			<nav class="navbar navbar-fixed-top navbar-default">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- logo area -->
						<a class="navbar-brand" href="#home"> <!-- logo image --> <img
							class="img-responsive" src="img/logo/logo.png" alt="" />
						</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">

							<li><a href="#latestalbum">官方節目</a></li>
							<li><a href="#featuredalbum">矚目新選</a></li>
							<li><a href="#joinus">熱播排行</a></li>
<!-- 							<li><a href="#portfolio">人氣播客</a></li> -->
							<li><a href="#events">派對活動</a></li>
														<li><a href="<c:url value='/ShoppingCart' />">購物車</a></li>
							<li><a href="#team">瀏覽搜尋</a></li>
							<li><a href="<c:url value='/login' />">註冊/登入</a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<!--/ header end -->


	<!-- 		banner start -->
	<div class="banner">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="img/banner/b1.jpg" alt="...">
						<div class="container">
							<!-- banner caption -->
							<div class="carousel-caption slide-one">
								<!-- heading -->
								<h2 class="animated fadeInLeftBig">
									<i class="fa fa-music"></i> Podcast For You!
								</h2>
								<!-- paragraph -->
								<h3 class="animated fadeInRightBig">聽見全世界</h3>
								<!-- button -->
								<a href="#" class="animated fadeIn btn btn-theme">註冊/登入</a>
							</div>
						</div>
					</div>
					<div class="item">
						<img src="img/banner/b2.jpg" alt="...">
						<div class="container">
							<!-- banner caption -->
							<div class="carousel-caption slide-two">
								<!-- heading -->
								<h2 class="animated fadeInLeftBig">
									<i class="fa fa-headphones"></i> Listen to Podcast...
								</h2>
								<!-- paragraph -->
								<h3 class="animated fadeInRightBig">最完整的播音平台</h3>
								<!-- button -->
								<a href="#" class="animated fadeIn btn btn-theme">註冊/登入</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span class="fa fa-arrow-left"
					aria-hidden="true"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="fa fa-arrow-right" aria-hidden="true"></span>
				</a>
			</div>
		</div>
		
<!-- 		banner end -->
		
		
		
		
	
</body>

</html>