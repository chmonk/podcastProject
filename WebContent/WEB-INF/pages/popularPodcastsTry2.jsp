<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Styles -->
<%-- 
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

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
	<!-- portfolio -->
	<div class="portfolio pad" id="portfolio">
		<div>
			<!-- default heading -->
			<div class="default-heading">
				<!-- heading -->
				<h2>人氣播客</h2>
			</div>
		</div>
		<!-- portfolio -->
		<div class="portfolio-content" id="portfolioOwl">
			<div class="item">
				<!-- item image -->
				<img id="img1" class="img-responsive" src="img/portfolio/1.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title1">熱門播客1</h3>
					<hr>
					<!-- project details -->
					<p id="info1">Some details about album.</p>

					<!-- icon -->

					<form id="form1" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form1').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop1" value="" />
						</i>
						</a>
					</form>

				</div>
			</div>
			<div class="item">
				<!-- item image -->
				<img id="img2" class="img-responsive" src="img/portfolio/2.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title2">Album Title</h3>
					<hr>
					<!-- project details -->
					<p id="info2">Some details about album.</p>

					<!-- icon -->
					<form id="form2" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form2').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop2" value="" />
						</i>
						</a>
					</form>

				</div>
			</div>
			<div class="item">
				<!-- item image -->
				<img id="img3" class="img-responsive" src="img/portfolio/3.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title3">Album Title</h3>
					<hr>
					<!-- project details -->
					<p id="info3">Some details about album.</p>

					<!-- icon -->
					<form id="form3" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form3').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop3" value="" />
						</i>
						</a>
					</form>

				</div>
			</div>
			<div class="item">
				<!-- item image -->
				<img id="img4" class="img-responsive" src="img/portfolio/4.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title4">Album Title</h3>
					<hr>
					<!-- project details -->
					<p id="info4">Some details about album.</p>

					<!-- icon -->
					<form id="form4" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form4').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop4" value="" />
						</i>
						</a>
					</form>
				</div>
			</div>
			<div class="item">
				<!-- item image -->
				<img id="img5" class="img-responsive" src="img/portfolio/5.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title5">Album Title</h3>
					<hr>
					<!-- project details -->
					<p id="info5">Some details about album.</p>
					<!-- icon -->
					<form id="form5" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form5').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop5" value="" />
						</i>
						</a>
					</form>
				</div>
			</div>
			<div class="item">
				<!-- item image -->
				<img id="img6" class="img-responsive" src="img/portfolio/6.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title6">Album Title</h3>
					<hr>
					<!-- project details -->
					<p id="info6">Some details about album.</p>
					<!-- icon -->
					<form id="form6" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form6').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop6" value="" />
						</i>
						</a>
					</form>
				</div>
			</div>
			<div class="item">
				<!-- item image -->
				<img id="img7" class="img-responsive" src="img/portfolio/7.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title7">Album Title</h3>
					<hr>
					<!-- project details -->
					<p id="info7">Some details about album.</p>
					<!-- icon -->
					<form id="form7" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form7').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop7" value="" />
						</i>
						</a>
					</form>
				</div>
			</div>
			<div class="item">
				<!-- item image -->
				<img id="img8" class="img-responsive" src="img/portfolio/8.jpg"
					alt="">
				<!-- transparent background -->
				<div class="p-transparent"></div>
				<!-- on mouse hover details -->
				<div class="p-hover">
					<!-- heading /title -->
					<h3 id="title8">Album Title</h3>
					<hr>
					<!-- project details -->
					<p id="info8">Some details about album.</p>
					<!-- icon -->
					<form id="form8" action="<c:url value="/podcastPage"/>">
						<a href="javascript:;"
							onclick="document.getElementById('form8').submit();"> <i
							class="fa fa-share"> <input type="hidden"
								name="fuzzyPodcasterId" id="pop8" value="" />
						</i>
						</a>
					</form>
				</div>
			</div>
		</div>
		<div class="text-center">
			<a href="#" class="btn btn-lg btn-theme">View more</a>
		</div>
		<!-- portfolio end -->
	</div>
	<!-- portfolio end -->
	
</body>

</html>