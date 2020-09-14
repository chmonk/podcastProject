<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Favicon -->
<link rel="shortcut icon" href="img/logo/favicon.ico">
</head>
<body>

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