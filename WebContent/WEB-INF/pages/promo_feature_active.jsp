<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.img-size {
	display: block;
	max-width: 100%;
	width: 100%;
	max-width: 450px;
	height: 300px;
	object-fit: cover;
}

.btn-custom {
	border-radius: 20px;
	color: white;
	background-color: #F91818;
	box-shadow: none;
}

.title-flow{
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;  
  overflow: hidden;

}
</style>

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


	<!-- promo -->
	<div class="promo parallax-one pad">
		<div class="container">
			<!-- promo element -->
			<div class="promo-element ">
				<!-- heading -->
				<h3>最方便齊全的 Podcast 探索與聆聽</h3>
				<!-- paragraph -->
				<p>從創作發想、節目託管、行銷資源、音檔上架到 Podcast 盈利變現。SoundPod 陪伴著你把 Podcast
					從興趣變成專業，再進一步轉成事業。</p>
				<!-- link -->
				<!-- 	<a class="promo-link" href="#"><i class="fa fa-play-circle"></i></a> -->
			</div>
		</div>
	</div>
	<!--/ promo end -->



	<!-- featured abbum -->
	<div class="featured pad" id="featuredalbum">
		<div class="container">
			<!-- default heading -->
			<div class="default-heading">
				<!-- heading -->
				<h2>熱播排行</h2>
			</div>
			<!-- featured album elements -->
			<div class="featured-element">
				<div class="row">
					<div class="col-md-4 col-sm-6">
						<!-- featured item -->
						<div class="featured-item ">
							<!-- image container -->
							<div class="figure">
								<!-- image -->
								<img id="podimg1" class=" img-size" src="img/featured/_1.png"
									alt="" />
								<!-- paragraph -->
								<p id="podinfo1">There are many variations of passages
									available, but the majority have suffered Lorem alteration in
									some form, by injected look even slightly believable.									
									</p>

							</div>
							<!-- featured information -->
							<div class="featured-item-info">
								<!-- featured title -->
								<h4 class="title-flow" id="podtitle1">Power Pop</h4>
								<!-- horizontal line -->
								<hr />
								<!-- some responce from social medial or web likes -->
								
								<form action="<c:url value='/podcastPage'/>">
								<p>
									<span id="podlike1">1024+</span> <span
										class="label label-theme">Like</span> &nbsp;&nbsp; 
									<span
										id="podclick1">825+</span> <span class="label label-theme">Click</span>&nbsp;&nbsp;
									<input type="button"
										id="play1" class="btn-xs btn-custom playlist-number"
										value="&nbsp;AddList+&nbsp;">&nbsp;&nbsp;
										
									
										<input type="submit"
										 class="btn-xs btn-custom"
										value="&nbsp;Podcaster&nbsp;" >
										<input type="hidden"
										name="fuzzyPodcasterId" id="topod1" value="" />
										
								</p>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<!-- featured item -->
						<div class="featured-item ">
							<!-- image container -->
							<div class="figure">
								<!-- image -->
								<img id="podimg2" class="img-size" src="img/featured/_2.png"
									alt="" />
								<!-- paragraph -->
								<p id="podinfo2">There are many variations of passages
									available, but the majority have suffered Lorem alteration in
									some form, by injected look even slightly believable.</p>
							</div>
							<!-- featured information -->
							<div class="featured-item-info">
								<!-- featured title -->
								<h4 class="title-flow" id="podtitle2">Bad Brains</h4>
								<!-- horizontal line -->
								<hr />
								<!-- some responce from social medial or web likes -->
								
								<form action="<c:url value='/podcastPage'/>">
								<p>
									<span id="podlike2">1024+</span> <span
										class="label label-theme">Like</span> &nbsp;&nbsp; 
										<span id="podclick2">825+</span> <span class="label label-theme">Click</span>&nbsp;&nbsp; 
										<input type="button"
										id="play2" class="btn-xs btn-custom playlist-number"
										value="&nbsp;AddList+&nbsp;">&nbsp;&nbsp;

										<input type="submit"
										 class="btn-xs btn-custom"
										value="&nbsp;Podcaster&nbsp;" >
										<input type="hidden"
										name="fuzzyPodcasterId" id="topod2" value="" />
								</p>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<!-- featured item -->
						<div class="featured-item ">
							<!-- image container -->
							<div class="figure">
								<!-- image -->
								<img id="podimg3" class="img-size" src="img/featured/_4.png"
									alt="" />
								<!-- paragraph -->
								<p id="podinfo3">There are many variations of passages
									available, but the majority have suffered Lorem alteration in
									some form, by injected look even slightly believable.</p>
							</div>
							<!-- featured information -->
							<div class="featured-item-info">
								<!-- featured title -->
								<h4 class="title-flow" id="podtitle3">The Mars Volta</h4>
								<!-- horizontal line -->
								<hr />
								<!-- some responce from social medial or web likes -->
								
								<form action="<c:url value='/podcastPage'/>">
								<p>
									<span id="podlike3">1024+</span> <span
										class="label label-theme">Like</span> &nbsp;&nbsp; <span
										id="podclick3">825+</span> <span class="label label-theme">Click</span>
									    &nbsp;&nbsp; <input type="button"
										id="play3" class="btn-xs btn-custom playlist-number"
										value="&nbsp;AddList+&nbsp;">&nbsp;&nbsp;

										<input type="submit"
										 class="btn-xs btn-custom"
										value="&nbsp;Podcaster&nbsp;" >
										<input type="hidden"
										name="fuzzyPodcasterId" id="topod3" value="" />

								</p>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<!-- featured item -->
						<div class="featured-item ">
							<!-- image container -->
							<div class="figure">
								<!-- image -->
								<img id="podimg4" class="img-size" src="img/featured/4.jpg"
									alt="" />
								<!-- paragraph -->
								<p id="podinfo4">There are many variations of passages
									available, but the majority have suffered Lorem alteration in
									some form, by injected look even slightly believable.</p>
							</div>
							<!-- featured information -->
							<div class="featured-item-info">
								<!-- featured title -->
								<h4 class="title-flow" id="podtitle4">Dirty Dancing</h4>
								<!-- horizontal line -->
								<hr />
								<!-- some responce from social medial or web likes -->
								
								<form action="<c:url value='/podcastPage'/>">
								<p>
									<span id="podlike4">1024+</span> <span
										class="label label-theme">Like</span> &nbsp;&nbsp; <span
										id="podclick4">825+</span> <span class="label label-theme">Click</span>
										&nbsp;&nbsp; <input type="button"
										id="play4" class="btn-xs btn-custom playlist-number"
										value="&nbsp;AddList+&nbsp;">&nbsp;&nbsp;

										<input type="submit"
										 class="btn-xs btn-custom"
										value="&nbsp;Podcaster&nbsp;" >
										<input type="hidden"
										name="fuzzyPodcasterId" id="topod4" value="" />
								</p>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<!-- featured item -->
						<div class="featured-item ">
							<!-- image container -->
							<div class="figure">
								<!-- image -->
								<img id="podimg5" class="img-size" src="img/featured/5.jpg"
									alt="" />
								<!-- paragraph -->
								<p id="podinfo5">There are many variations of passages
									available, but the majority have suffered Lorem alteration in
									some form, by injected look even slightly believable.</p>
							</div>
							<!-- featured information -->
							<div class="featured-item-info">
								<!-- featured title -->
								<h4 class="title-flow" id="podtitle5">Hotel California</h4>
								<!-- horizontal line -->
								<hr />
								<!-- some responce from social medial or web likes -->
								<form action="<c:url value='/podcastPage'/>">
								<p>
									<span id="podlike5">1024+</span> <span
										class="label label-theme">Like</span> &nbsp;&nbsp; <span
										id="podclick5">825+</span> <span class="label label-theme">Click</span>
										&nbsp;&nbsp; <input type="button"
										id="play5" class="btn-xs btn-custom playlist-number"
										value="&nbsp;AddList+&nbsp;">&nbsp;&nbsp;

										<input type="submit"
										 class="btn-xs btn-custom"
										value="&nbsp;Podcaster&nbsp;" >
										<input type="hidden"
										name="fuzzyPodcasterId" id="topod5" value="" />
								</p>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<!-- featured item -->
						<div class="featured-item ">
							<!-- image container -->
							<div class="figure">
								<!-- image -->
								<img id="podimg6" class="img-size" src="img/featured/6.jpg"
									alt="" />
								<!-- paragraph -->
								<p id="podinfo6">There are many variations of passages
									available, but the majority have suffered Lorem alteration in
									some form, by injected look even slightly believable.</p>
							</div>
							<!-- featured information -->
							<div class="featured-item-info">
								<!-- featured title -->
								<h4 class="title-flow" id="podtitle6">Punk Compilation</h4>
								<!-- horizontal line -->
								<hr />
								<!-- some responce from social medial or web likes -->
								<form action="<c:url value='/podcastPage'/>">
								<p>
									<span id="podlike6">1024+</span> <span
										class="label label-theme">Like</span> &nbsp;&nbsp; <span
										id="podclick6">825+</span> <span class="label label-theme">Click</span>
										&nbsp;&nbsp; <input type="button"
										id="play6" class="btn-xs btn-custom playlist-number"
										value="&nbsp;AddList+&nbsp;">&nbsp;&nbsp;

										<input type="submit"
										 class="btn-xs btn-custom"
										value="&nbsp;Podcaster&nbsp;" >
										<input type="hidden"
										name="fuzzyPodcasterId" id="topod6" value="" />
								</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- features end -->
</body>

</html>