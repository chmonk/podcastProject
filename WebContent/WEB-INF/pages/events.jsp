<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- modal for booking ticket form -->
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


				<!-- 				form for events ticket booking -->
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
	
	


</body>

</html>