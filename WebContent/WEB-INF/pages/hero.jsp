<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<!-- Hero block area -->
		<div id="latestalbum" class="hero pad">
			<div class="container">
				<!-- hero content -->
				<div class="hero-content ">
					<!-- heading -->
					<h2>矚目新選</h2>
					<hr>
					<!-- paragraph -->
					<p>
						We sing the best <strong class="theme-color">Songs</strong> and
						now we control the world best <strong class="theme-color">Music</strong>.
					</p>
				</div>
				<!-- hero play list -->
				<div class="hero-playlist">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<!-- music album image -->
							<div class="figure">
								<!-- image -->
								<img class="img-responsive" src="img/album/2.jpg" alt="" />
								<!-- disk image -->
								<img class="img-responsive disk" src="${PodcastData[0].getAudioImg()}" alt="" />
							</div>
							<!-- album details -->
							<div class="album-details">
								<!-- title -->
								<h4>${PodcastData[0].getTitle()}</h4>
								<!-- composed by -->
								<h5>${PodcastData[0].getPodcasterName()}</h5>
								<!-- paragraph -->
								<p>${PodcastData[0].getPodcastInfo()}</p>
								<!-- button -->
								<a id="${PodcastData[0].getPodcastId()}" class="btn btn-lg btn-theme playlist-number" ><i
									class="fa fa-play"></i>&nbsp; Play Now</a>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<!-- play list -->
							<div class="playlist-content">
								<ul class="list-unstyled">
								<c:forEach var="list" items="${PodcastData}" begin="1" end="8" >
									<li id="${list.getPodcastId()}" class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>${list.getTitle()}</h4>
											<p>
												<strong>點擊數</strong>: ${list.getClickAmount()} &nbsp;|&nbsp; <strong>類型</strong>:
												${list.getCategoryName()} &nbsp;|&nbsp; <strong>播客</strong>: ${list.getPodcasterName()}
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a><i class="fa fa-play"></i></a>
											<!-- <a href="#"><i class="fa fa-pause"></i></a> -->
										</div>
										<div class="clearfix"></div>
									</li>
								</c:forEach>
	
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ hero end -->


	
</body>

</html>