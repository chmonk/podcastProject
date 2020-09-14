<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Podcast</title>
<!-- Description, Keywords and Author -->
<meta name="description" content="Your description">
<meta name="keywords" content="Your,Keywords">
<meta name="author" content="HimanshuGupta">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
</head>

<body>



	<!-- modal for booking ticket form -->
	
<!-- 	--------------訂票表單格式----------------- -->
	<div class="modal fade" id="bookTicket" tabindex="-1" role="dialog"
		aria-labelledby="BookTicket">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						&nbsp; <small><span class="label label-success">Available</span>
							&nbsp; <span class="label label-danger">Not Available</span></small>
					</h4>
				</div>


				form for events ticket booking
				<form>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input type="email"
								class="form-control" id="exampleInputEmail1"
								placeholder="example@mail.com">
						</div>
						<div class="form-group">
							<label for="exampleInputContact">Contact</label> <input
								type="text" class="form-control" id="exampleInputContact"
								placeholder="+91 55 5555 5555">
						</div>
						<div class="form-group">
							<label for="exampleInputSeats">Number of Tickets</label> <select
								class="form-control" id="exampleInputSeats">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> I accept the
								Terms of Service
							</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						link to payment gatway here
						<button type="button" class="btn btn-primary">Book Now</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- 	--------------訂票表單格式結束----------------- -->

	<!-- wrapper -->
	<div class="wrapper" id="home">

<!-- <Iframe src="header.jsp"; width="250" height="200" scrolling="no" frameborder="0"></iframe> -->
<jsp:include page="header.jsp"  flush= "true "/>


<!-- 		<!-- header area --> -->
<!-- 		<header> -->
<!-- 			<!-- secondary menu --> -->
<!-- 			<nav class="secondary-menu"> -->
<!-- 				<div class="container"> -->
<!-- 					secondary menu left link area -->
<!-- 					<div class="sm-left"> -->
<!-- 						<strong>Phone</strong>:&nbsp; <a href="#">555 555 555</a>&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 						<strong>E-mail</strong>:&nbsp; <a href="#">music.site@melodi.com</a> --> -->
<!-- 					</div> -->
<!-- 					secondary menu right link area -->
<!-- 					<div class="sm-right"> -->
<!-- 						social link -->
<!-- 						<div class="sm-social-link"> -->
<!-- 							<a class="h-facebook" href="#"><i class="fa fa-facebook"></i></a> -->
<!-- 							<a class="h-twitter" href="#"><i class="fa fa-twitter"></i></a> <a -->
<!-- 								class="h-google" href="#"><i class="fa fa-google-plus"></i></a> -->
<!-- 							<a class="h-linkedin" href="#"><i class="fa fa-linkedin"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="clearfix"></div> -->
<!-- 				</div> -->
<!-- 			</nav> -->
<!-- 			<!-- primary menu --> -->
<!-- 			<nav class="navbar navbar-fixed-top navbar-default"> -->
<!-- 				<div class="container"> -->
<!-- 					Brand and toggle get grouped for better mobile display -->
<!-- 					<div class="navbar-header"> -->
<!-- 						<button type="button" class="navbar-toggle collapsed" -->
<!-- 							data-toggle="collapse" -->
<!-- 							data-target="#bs-example-navbar-collapse-1"> -->
<!-- 							<span class="sr-only">Toggle navigation</span> <span -->
<!-- 								class="icon-bar"></span> <span class="icon-bar"></span> <span -->
<!-- 								class="icon-bar"></span> -->
<!-- 						</button> -->
<!-- 						logo area -->
<!-- 						<a class="navbar-brand" href="#home"> logo image <img -->
<!-- 							class="img-responsive" src="img/logo/logo.png" alt="" /> -->
<!-- 						</a> -->
<!-- 					</div> -->

<!-- 					Collect the nav links, forms, and other content for toggling -->
<!-- 					<div class="collapse navbar-collapse" -->
<!-- 						id="bs-example-navbar-collapse-1"> -->
<!-- 						<ul class="nav navbar-nav navbar-right"> -->

<!-- 							<li><a href="#latestalbum">官方節目</a></li> -->
<!-- 							<li><a href="#featuredalbum">矚目新選</a></li> -->
<!-- 							<li><a href="#joinus">熱播排行</a></li> -->
<!-- 							<li><a href="#portfolio">人氣播客</a></li> -->
<!-- 							<li><a href="#events">派對活動</a></li> -->
<!-- 							<li><a href="#team">瀏覽搜尋</a></li> -->
<!-- 							<li><a href="#contact">註冊/登入</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					/.navbar-collapse -->
<!-- 				</div> -->
<!-- 				/.container-fluid -->
<!-- 			</nav> -->
<!-- 		</header> -->
		<!--/ header end -->

		<!-- banner area -->
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
		<!--/ banner end -->

		<!-- block for animate navigation menu -->
		<div class="nav-animate"></div>

		<!-- Hero block area -->
		<div id="latestalbum" class="hero pad">
			<div class="container">
				<!-- hero content -->
				<div class="hero-content ">
					<!-- heading -->
					<h2>官方節目</h2>
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
								<img class="img-responsive disk" src="img/album/disk.png" alt="" />
							</div>
							<!-- album details -->
							<div class="album-details">
								<!-- title -->
								<h4>Perfect Melodi</h4>
								<!-- composed by -->
								<h5>By Himanshu</h5>
								<!-- paragraph -->
								<p>Lorem Ipsum has been the industry's standard dummy text
									ever since 1500.</p>
								<!-- button -->
								<a href="#" class="btn btn-lg btn-theme" id="playNowBtn"><i
									class="fa fa-play"></i>&nbsp; Play Now</a>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<!-- play list -->
							<div class="playlist-content">
								<ul class="list-unstyled">
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track One</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track Two</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track Three</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track Four</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track Five</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track Six</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track Seven</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="playlist-number">
										<!-- song information -->
										<div class="song-info">
											<!-- song title -->
											<h4>Melodi Song Track Eight</h4>
											<p>
												<strong>Album</strong>: Title &nbsp;|&nbsp; <strong>Type</strong>:
												Rock &nbsp;|&nbsp; <strong>Singer</strong>: Dawn
											</p>
										</div> <!-- music icon -->
										<div class="music-icon">
											<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
												class="fa fa-pause"></i></a>
										</div>
										<div class="clearfix"></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ hero end -->

		<!-- promo -->
		<div class="promo parallax-one pad">
			<div class="container">
				<!-- promo element -->
				<div class="promo-element ">
					<!-- heading -->
					<h3>Music An Art...</h3>
					<!-- paragraph -->
					<p>
						Music is an art form and cultural activity whose medium is sound
						organized in time. The common elements of music are <strong>pitch</strong>,
						<strong>rhythm</strong>, <strong>dynamics</strong> and the sonic
						qualities of <strong>timbre</strong> and <strong>texture</strong>.
					</p>
					<!-- link -->
					<a class="promo-link" href="#"><i class="fa fa-play-circle"></i></a>
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
					<h2>矚目新選</h2>
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
									<img class="img-responsive" src="img/featured/_1.png" alt="" />
									<!-- paragraph -->
									<p>There are many variations of passages available, but the
										majority have suffered Lorem alteration in some form, by
										injected look even slightly believable.</p>

								</div>
								<!-- featured information -->
								<div class="featured-item-info">
									<!-- featured title -->
									<h4>Power Pop</h4>
									<!-- horizontal line -->
									<hr />
									<!-- some responce from social medial or web likes -->
									<p>
										1024+ <span class="label label-theme">Like</span> &nbsp;&nbsp;
										825+ <span class="label label-theme">Love</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<!-- featured item -->
							<div class="featured-item ">
								<!-- image container -->
								<div class="figure">
									<!-- image -->
									<img class="img-responsive" src="img/featured/_2.png" alt="" />
									<!-- paragraph -->
									<p>There are many variations of passages available, but the
										majority have suffered Lorem alteration in some form, by
										injected look even slightly believable.</p>
								</div>
								<!-- featured information -->
								<div class="featured-item-info">
									<!-- featured title -->
									<h4>Bad Brains</h4>
									<!-- horizontal line -->
									<hr />
									<!-- some responce from social medial or web likes -->
									<p>
										1024+ <span class="label label-theme">Like</span> &nbsp;&nbsp;
										825+ <span class="label label-theme">Love</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<!-- featured item -->
							<div class="featured-item ">
								<!-- image container -->
								<div class="figure">
									<!-- image -->
									<img class="img-responsive" src="img/featured/_4.png" alt="" />
									<!-- paragraph -->
									<p>There are many variations of passages available, but the
										majority have suffered Lorem alteration in some form, by
										injected look even slightly believable.</p>
								</div>
								<!-- featured information -->
								<div class="featured-item-info">
									<!-- featured title -->
									<h4>The Mars Volta</h4>
									<!-- horizontal line -->
									<hr />
									<!-- some responce from social medial or web likes -->
									<p>
										1024+ <span class="label label-theme">Like</span> &nbsp;&nbsp;
										825+ <span class="label label-theme">Love</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<!-- featured item -->
							<div class="featured-item ">
								<!-- image container -->
								<div class="figure">
									<!-- image -->
									<img class="img-responsive" src="img/featured/4.jpg" alt="" />
									<!-- paragraph -->
									<p>There are many variations of passages available, but the
										majority have suffered Lorem alteration in some form, by
										injected look even slightly believable.</p>
								</div>
								<!-- featured information -->
								<div class="featured-item-info">
									<!-- featured title -->
									<h4>Dirty Dancing</h4>
									<!-- horizontal line -->
									<hr />
									<!-- some responce from social medial or web likes -->
									<p>
										1024+ <span class="label label-theme">Like</span> &nbsp;&nbsp;
										825+ <span class="label label-theme">Love</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<!-- featured item -->
							<div class="featured-item ">
								<!-- image container -->
								<div class="figure">
									<!-- image -->
									<img class="img-responsive" src="img/featured/5.jpg" alt="" />
									<!-- paragraph -->
									<p>There are many variations of passages available, but the
										majority have suffered Lorem alteration in some form, by
										injected look even slightly believable.</p>
								</div>
								<!-- featured information -->
								<div class="featured-item-info">
									<!-- featured title -->
									<h4>Hotel California</h4>
									<!-- horizontal line -->
									<hr />
									<!-- some responce from social medial or web likes -->
									<p>
										1024+ <span class="label label-theme">Like</span> &nbsp;&nbsp;
										825+ <span class="label label-theme">Love</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-6">
							<!-- featured item -->
							<div class="featured-item ">
								<!-- image container -->
								<div class="figure">
									<!-- image -->
									<img class="img-responsive" src="img/featured/6.jpg" alt="" />
									<!-- paragraph -->
									<p>There are many variations of passages available, but the
										majority have suffered Lorem alteration in some form, by
										injected look even slightly believable.</p>
								</div>
								<!-- featured information -->
								<div class="featured-item-info">
									<!-- featured title -->
									<h4>Punk Compilation</h4>
									<!-- horizontal line -->
									<hr />
									<!-- some responce from social medial or web likes -->
									<p>
										1024+ <span class="label label-theme">Like</span> &nbsp;&nbsp;
										825+ <span class="label label-theme">Love</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- features end -->

		<!-- call to action -->
		<div class="cta parallax-one pad">
			<div class="container">
				<!-- cta element -->
				<div class="cta-element ">
					<div class="row">
						<div class="col-md-9 col-sm-8">
							<!-- heading -->
							<h3>Melodi, A Fully Rock Album Pro</h3>
							<!-- paragraph -->
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim sectetur adipiscing elit, sed do eiusmod tempoad
								minim veniam consequat.</p>
						</div>
						<div class="col-md-3 col-sm-4">
							<div class="cta-btn text-center">
								<!-- purchase now button -->
								<a href="#" class="btn btn-default btn-lg">Download Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ cta end -->

		<!-- work with us -->
		<div class="work-with-us pad" id="joinus">
			<div class="container">
				<!-- default heading -->
				<div class="default-heading">
					<!-- heading -->
					<h2>熱播排行</h2>
				</div>
				<!-- why work with us content -->
				<div class="why-content">
					<!-- paragraph -->
					<p class="why-message">It would be a great pleasure to have you
						in our team, follow these steps to join us.</p>
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<!-- why work with us item -->
							<div class="why-item  delay-one">
								<span class="why-number">1</span>
								<!-- paragraph -->
								<p>Sed ut perspi ciatis unde omnis iste natus error sit vol
									uptatem accus antium totam rem aperiam, eaque ipsa quae ab illo
									inventore veritatisnatus.</p>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<!-- why work with us item -->
							<div class="why-item  delay-two">
								<span class="why-number">2</span>
								<!-- paragraph -->
								<p>Sed ut perspi ciatis unde omnis iste natus error sit vol
									uptatem accu santium totam rem aperiam, eaque ipsa quae ab illo
									inventore veritatisnatus.</p>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<!-- why work with us item -->
							<div class="why-item  delay-three">
								<span class="why-number">3</span>
								<!-- paragraph -->
								<p>Sed ut perspi ciatis unde omnis iste natus error sit vol
									uptatem accus antium totam rem aperiam, eaque ipsa quae ab illo
									inventore veritatisnatus.</p>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<!-- why work with us item -->
							<div class="why-item  delay-four">
								<span class="why-number">4</span>
								<!-- paragraph -->
								<p>Sed ut perspi ciatis unde omnis iste natus error sit vol
									uptatem accus antium totam rem aperiam, eaque ipsa quae ab illo
									inventore veritatisnatus.</p>
							</div>
						</div>
					</div>
					<!-- apply button -->
					<div class="apply-btn">
						<!-- button line -->
						<a class="btn btn-lg btn-theme" href="#">Join Now</a>
					</div>
				</div>
			</div>
		</div>
		<!--/ end work with us -->

		<!-- news letter -->
		<div class="news-letter">
			<div class="container">
				<!-- news letter inner content -->
				<div class="news-content ">
					<!-- heading -->
					<h3>Sign Up For Newsletter</h3>
					<!-- paragraph -->
					<p>
						<strong>Contact Us</strong> and let us know if you have any
						questions, Don't forget to subscribe for more awesome stuff by
						typing mail bellow.
					</p>
					<!-- subscribe form -->
					<form>
						<div class="input-group">
							<input type="text" class="form-control input-lg"
								placeholder="Email"> <span class="input-group-btn">
								<button class="btn btn-default btn-lg" type="button">Subscribe</button>
							</span>
						</div>
						<!-- /input-group -->
					</form>
				</div>
			</div>
		</div>
		<!-- news letter end -->

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
					<img class="img-responsive" src="img/portfolio/1.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
				<div class="item">
					<!-- item image -->
					<img class="img-responsive" src="img/portfolio/2.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
				<div class="item">
					<!-- item image -->
					<img class="img-responsive" src="img/portfolio/3.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
				<div class="item">
					<!-- item image -->
					<img class="img-responsive" src="img/portfolio/4.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
				<div class="item">
					<!-- item image -->
					<img class="img-responsive" src="img/portfolio/5.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
				<div class="item">
					<!-- item image -->
					<img class="img-responsive" src="img/portfolio/6.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
				<div class="item">
					<!-- item image -->
					<img class="img-responsive" src="img/portfolio/7.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
				<div class="item">
					<!-- item image -->
					<img class="img-responsive" src="img/portfolio/8.jpg" alt="">
					<!-- transparent background -->
					<div class="p-transparent"></div>
					<!-- on mouse hover details -->
					<div class="p-hover">
						<!-- heading /title -->
						<h3>Album Title</h3>
						<hr>
						<!-- project details -->
						<p>Some details about album.</p>
						<!-- icon -->
						<a href="#"><i class="fa fa-share"></i></a>
					</div>
				</div>
			</div>
			<div class="text-center">
				<a href="#" class="btn btn-lg btn-theme">View more</a>
			</div>
			<!-- portfolio end -->
		</div>
		<!-- work with us end -->

		<!-- events -->
		<div class="events parallax-three pad" id="events">
			<div class="container">
				<!-- default heading -->
				<div class="default-heading-shadow">
					<!-- heading -->
					<h2>派對活動</h2>
				</div>
				<!-- events element -->
				<div class="events-element">
					<div class="row">

						<%-- 					<c:forEach var="list" items="${list}"> --%>
						<div class="col-md-6 col-sm-6">
							<!-- event item -->
							<div class="events-item ">
								<!-- image container -->
								<div class="figure">
									<!-- event date -->
									<div class="event-date">
										24 <span class="emonth">Jan</span>
										<div class="clearfix"></div>
										<!-- time -->
										<span class="etime">06:30 pm</span>
									</div>
									<!-- event location -->
									<span class="event-location"><i class="fa fa-map-marker"></i>
										New York</span>
									<!-- image -->
									<img class="img-responsive" src="img/event/1.jpg" alt="" />
									<!-- image hover -->
									<div class="img-hover">
										<!-- hover icon -->
										<a href="#"><i class="fa fa-play-circle"></i></a>
									</div>
								</div>
								<!-- event information -->
								<div class="event-info">
									<!-- event title -->
									<%-- 									<h3>${list.getActivityName()}</h3> --%>
									<!-- horizontal line -->
									<hr />
									<!-- paragraph -->
									<p>
										<%-- 										${list.getActivityContent()} --%>
										<a href="#">more</a>
									</p>
									<!-- buy ticket button link -->
									<button href="#bookTicket" class="btn btn-lg btn-theme"
										data-toggle="modal">Book Ticket</button>
								</div>
							</div>
						</div>
						<%-- 						</c:forEach> --%>


					</div>
				</div>
			</div>
		</div>
		<!-- events end -->

		<!-- about -->
		<div class="about" id="team">
			<div class="container">
				<!-- default heading -->
				<div class="default-heading">
					<!-- heading -->
					<h2>Who We Are?</h2>
				</div>
				<!-- about what we are like content -->
				<div class="about-what-we">
					<div class="row">
						<div class="col-md-4 col-sm-4">
							<div class="what-we-item ">
								<!-- heading with icon -->
								<h3>
									<i class="fa fa-heartbeat"></i> What we do?
								</h3>
								<!-- paragraph -->
								<p>Duis aute irure dolor in reprehenderit in voluptate velit
									esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
									occaecat cupidatat non proident, sunt in culpa qui officia
									deserunt mollit occaecat cupidatat non id est laborum.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="what-we-item ">
								<!-- heading with icon -->
								<h3>
									<i class="fa fa-hand-o-up"></i> Why choose us?
								</h3>
								<!-- paragraph -->
								<p>Duis aute irure dolor in reprehenderit in voluptate velit
									esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
									occaecat cupidatat non proident, sunt in culpa qui officia
									deserunt mollit occaecat cupidatat non id est laborum.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="what-we-item ">
								<!-- heading with icon -->
								<h3>
									<i class="fa fa-map-marker"></i> Where we are?
								</h3>
								<!-- paragraph -->
								<p>Duis aute irure dolor in reprehenderit in voluptate velit
									esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
									occaecat cupidatat non proident, sunt in culpa qui officia
									deserunt mollit occaecat cupidatat non id est laborum.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- our team -->
			<div class="team">
				<div class="container">
					<!-- Team Member's Details -->
					<div class="team-content">
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<!-- Team Member -->
								<div class="team-member  delay-one">
									<!-- Image Hover Block -->
									<div class="member-img">
										<!-- Image  -->
										<img class="img-responsive" src="img/user/1.jpg" alt="" />
										<!-- Hover block -->
										<div class="social text-center">
											<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
												class="fa fa-google-plus"></i></a> <a href="#"><i
												class="fa fa-linkedin"></i></a> <a href="#"><i
												class="fa fa-twitter"></i></a>
										</div>
									</div>
									<!-- Member Details -->
									<h3>Stacey Kowalski</h3>
									<span class="designation">Guitarist</span>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<!-- Team Member -->
								<div class="team-member  delay-two">
									<!-- Image Hover Block -->
									<div class="member-img">
										<!-- Image  -->
										<img class="img-responsive" src="img/user/2.jpg" alt="" />
										<!-- Hover block -->
										<div class="social text-center">
											<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
												class="fa fa-google-plus"></i></a> <a href="#"><i
												class="fa fa-linkedin"></i></a> <a href="#"><i
												class="fa fa-twitter"></i></a>
										</div>
									</div>
									<!-- Member Details -->
									<h3>Joanna Koo</h3>
									<span class="designation">Clarinetist</span>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<!-- Team Member -->
								<div class="team-member  delay-three">
									<!-- Image Hover Block -->
									<div class="member-img">
										<!-- Image  -->
										<img class="img-responsive" src="img/user/3.jpg" alt="" />
										<!-- Hover block -->
										<div class="social text-center">
											<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
												class="fa fa-google-plus"></i></a> <a href="#"><i
												class="fa fa-linkedin"></i></a> <a href="#"><i
												class="fa fa-twitter"></i></a>
										</div>
									</div>
									<!-- Member Details -->
									<h3>Mark Laredo</h3>
									<span class="designation">Accordionist</span>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<!-- Team Member -->
								<div class="team-member  delay-four">
									<!-- Image Hover Block -->
									<div class="member-img">
										<!-- Image  -->
										<img class="img-responsive" src="img/user/4.jpg" alt="" />
										<!-- Hover block -->
										<div class="social text-center">
											<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
												class="fa fa-google-plus"></i></a> <a href="#"><i
												class="fa fa-linkedin"></i></a> <a href="#"><i
												class="fa fa-twitter"></i></a>
										</div>
									</div>
									<!-- Member Details -->
									<h3>Belie Costa</h3>
									<span class="designation">Keyboardist</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- about end -->

		<!-- meet -->
		<div class="meet parallax-four pad" id="meet">
			<div class="container">
				<!-- default heading -->
				<div class="default-heading-shadow">
					<h2>Upcoming Meets</h2>
				</div>
				<!-- meet location image -->
				<div class="meet-map">
					<img class="img-responsive img-map" src="img/flat/map.png" alt="" />
					<!-- map marker for India  -->
					<a href="#" class="map-marker india " data-toggle="tooltip"
						data-placement="top" title="India"><img class="img-responsive"
						src="img/flat/map-marker.png" alt="" /></a>
					<!-- map marker for United States  -->
					<a href="#" class="map-marker usa " data-toggle="tooltip"
						data-placement="top" title="United States"><img
						class="img-responsive" src="img/flat/map-marker.png" alt="" /></a>
					<!-- map marker for South Africa  -->
					<a href="#" class="map-marker sa " data-toggle="tooltip"
						data-placement="top" title="South Africa"><img
						class="img-responsive" src="img/flat/map-marker.png" alt="" /></a>
					<!-- map marker for Russia  -->
					<a href="#" class="map-marker russia " data-toggle="tooltip"
						data-placement="top" title="Russia"><img
						class="img-responsive" src="img/flat/map-marker.png" alt="" /></a>
					<!-- map marker for Brazil  -->
					<a href="#" class="map-marker brazil " data-toggle="tooltip"
						data-placement="top" title="Brazil"><img
						class="img-responsive" src="img/flat/map-marker.png" alt="" /></a>
				</div>
			</div>
		</div>
		<!-- meet end -->

		<!-- contact -->
		<div class="contact pad" id="contact">
			<div class="container">
				<!-- default heading -->
				<div class="default-heading">
					<!-- heading -->
					<h2>註冊/登入</h2>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-4">
						<!-- contact item -->
						<div class="contact-item ">
							<!-- big icon -->
							<i class="fa fa-street-view"></i>
							<!-- contact details  -->
							<span class="contact-details">#30/67, 5th Street, Mega
								Market Circle, New Delhi - 625001</span>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<!-- contact item -->
						<div class="contact-item ">
							<!-- big icon -->
							<i class="fa fa-wifi"></i>
							<!-- contact details  -->
							<span class="contact-details">music.site@melodi.com</span>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<!-- contact item -->
						<div class="contact-item ">
							<!-- big icon -->
							<i class="fa fa-phone"></i>
							<!-- contact details  -->
							<span class="contact-details">555 555 5555</span>
						</div>
					</div>
				</div>
				<!-- form content -->
				<div class="form-content ">
					<!-- paragraph -->
					<p>Do you have any idea in your mind? Drop us a line.</p>
					<form role="form" id="contactForm" method="post">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name"
										placeholder="Enter name">
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" name="email"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="phone">Phone</label> <input type="text"
										class="form-control" id="phone" name="phone"
										placeholder="Enter phone">
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="message">Message</label>
									<textarea class="form-control" id="message" name="message"
										rows="9" placeholder="Enter message"></textarea>
								</div>
							</div>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-lg btn-theme">Send
								Message</button>
						</div>
					</form>

				</div>

			</div>
		</div>
		<!-- contact end -->

		<!-- footer -->
		<footer>
			<div class="container">
				<!-- social media links -->
				<div class="social">
					<a class="h-facebook" href="#"><i class="fa fa-facebook"></i></a> <a
						class="h-google" href="#"><i class="fa fa-google-plus"></i></a> <a
						class="h-linkedin" href="#"><i class="fa fa-linkedin"></i></a> <a
						class="h-twitter" href="#"><i class="fa fa-twitter"></i></a>
				</div>
				<!-- copy right -->
				<p class="copy-right">&copy; copyright 2018, All rights are
					reserved.</p>
			</div>
		</footer>
		<!-- footer end -->

		<!-- Scroll to top -->
		<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>

	</div>


	--playerbar--




	<!--用字串呼叫對應符號  -->
	<!-- < span class="material-icons" >
             drag_indicator
        </span > -->
	<div class="player">
		<div class="player__wrapper">
			<div class="player__prev-work player__item">
				<i class="material-icons" id="prev">skip_previous</i>
			</div>
			<div class="player__play player__item">
				<i class="material-icons" id="play">play_arrow</i>
			</div>
			<div class="player__next-work player__item">
				<i class="material-icons" id="next">skip_next</i>
			</div>
			<div class="player__shuffle player__item">
				<i class="material-icons" id="shuffle">shuffle</i>
			</div>
			<div class="player__repeat player__item">
				<i class="material-icons" id="repeat">repeat</i>
			</div>
			<div class="player__timeline player__item">
				<div class="timeline">
					<span class="timeline__passtime" id="passtime">00:00:00</span>
					<div class="timeline__progress-wrapper">
						<div class="timeline__progress-bg" id="timeline-bg"></div>
						<div class="timeline__progress-bar" id="timeline-bar"></div>
						<div class="timeline__progress-handle" id="timeline-handle"></div>
					</div>
					<span class="timeline__duration" id="duration">00:10:59</span>
				</div>
			</div>
			<div class="player__volume player__item">
				<i class="material-icons" id="volume">volume_up</i>
				<div class="volume">
					<div class="volume__wrapper hidden" id="volume-wrapper">
						<div class="volume__progress-bg" id="volume_bg"></div>
						<div class="volume__progress-bar" id="volume_bar"></div>
						<div class="volume__progress-handle" id="volume_handle"></div>
					</div>
				</div>
			</div>
			<div class="player__info player__item">
				<div class="info">
					<img class="info__thumb" id="current-thumb"
						src="https://i1.sndcdn.com/artworks-000406637742-g6nq0a-t120x120.jpg" />
					<div class="info__wrapper">
						<p class="info__author" id="current-author"
							title="Front End Happy Hour">Front End Happy Hour</p>
						<span class="info__name" id="current-name">Episode 066 -
							Type systems - a static drink list</span>
					</div>
				</div>
			</div>
			<div class="player__queue player__item">
				<i class="material-icons" id="queue">playlist_play</i>
				<div class="queue">
					<div class="queue__wrapper hidden" id="queue-wrapper">
						<div class="queue__panel">
							<h3 class="queue__title">Next Up</h3>
							<div class="queue__hide">
								<i class="material-icons" id="queue-close">close</i>
							</div>
						</div>
						<div class="queue__playlist" id="playlist">
							<div class="queue__item">
								<div class="info">
									<img class="info__thumb"
										src="https://i1.sndcdn.com/artworks-000406637742-g6nq0a-t120x120.jpg" />
									<div class="info__wrapper">
										<a class="info__author" href="/front-end-happy-hour"
											title="Front End Happy Hour">Front End Happy Hour</a><span
											class="info__name">Episode 066 - Type systems - a
											static drink list</span>
									</div>
								</div>
							</div>
							<div class="queue__item">
								<div class="info">
									<img class="info__thumb"
										src="https://i1.sndcdn.com/artworks-000406637742-g6nq0a-t120x120.jpg" />
									<div class="info__wrapper">
										<a class="info__author" href="/front-end-happy-hour"
											title="Front End Happy Hour">Front End Happy Hour</a><span
											class="info__name">Episode 066 - Type systems - a
											static drink list</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	--player bar--


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
</body>

</html>