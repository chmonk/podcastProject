<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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


<!-- map -->
<!-- 	plaer bar function js -->
<style type="text/css">
#map {
	height: 100%;
}
</style>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeVgKGb9DYep9MX7uwKiRZd2NYaerrhSw"
	defer></script>
	<script src="js/map.js"></script>
	
	<style>
	#map {
		height: 98%;
	}

	html, body {
		height: 98%;
		margin: 0;
		padding: 0;
	}
	</style>
	<script>
		var geocoder;
		var map;
		function initialize() {
			geocoder = new google.maps.Geocoder();
			
			var latlng = new google.maps.LatLng(-34.397, 150.644);
			var mapOptions = {
				zoom : 11,
				center : latlng
			}
			map = new google.maps.Map(document.getElementById('map'), mapOptions);
		}

		function codeAddress() {
			var address = document.getElementById('address').value;
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status == 'OK') {
					map.setCenter(results[0].geometry.location);
					var marker = new google.maps.Marker({
						map : map,
						position : results[0].geometry.location
					});
				} else {
					alert('Geocode was not successful for the following reason: ' + status);
				}
			});
		}
// 	var map;
// 	function initMap() {
// 	  map = new google.maps.Map(document.getElementById('map'), {
// 	    center: {lat: -34.397, lng: 150.644},
// 	    zoom: 8
// 	  });
// 	}

// 	  var geocoder;
//  	  var map;
// 	  function initialize() {
// 	    geocoder = new google.maps.Geocoder();
// 	    var latlng = new google.maps.LatLng(-34.397, 150.644);
// 	    var mapOptions = {
// 	      zoom: 8,
// 	      center: latlng
// 	    }
// 	    map = new google.maps.Map(document.getElementById('map'), mapOptions);
// 	  }

// 	  function codeAddress() {
// 	    var address = document.getElementById('address').value;;
// 	    geocoder.geocode( { 'address': address}, function(results, status) {
// 	      if (status == 'OK') {
// 	        map.setCenter(results[0].geometry.location);
// 	        var marker = new google.maps.Marker({
// 	            map: map,
// 	            position: results[0].geometry.location
// 	        });
// 	      } else {
// 	        alert('Geocode was not successful for the following reason: ' + status);
// 	      }
// 	    });
// 	  }
	</script>


</head>
<body  onload="initialize()">

	<!-- modal for booking ticket form -->
	<!-- modal for booking ticket form -->
	<c:forEach var="list" items="${list}" varStatus="loop">

		<div class="modal fade" id="bookTicket${loop.index}" tabindex="-1"
			role="dialog" aria-labelledby="BookTicket" class="">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							${list.activityName}
							<%-- 						&nbsp; <small><span class="label label-success" style="color:#F23030">票券剩餘:${list.activityMaxPeople}張</span></small> --%>

							&nbsp; <small><span class="label label-danger">票券剩餘:${list.stock}張</span></small>
						</h4>
					</div>


					<!-- form for events ticket booking -->
					<form action="addTickets" method="POST">
						<div class="modal-body">
							<div class="form-group">
								<div align="center" width="300px" height="200px">
									<img width="100%" height="100%" src="<c:url value='${list.activityImg}' />">
								</div>

								<h4>
									時間：<br />
								</h4>
								${list.activityDate} ${list.activityTime}<br />
								<h4>
									地點：<br />
								</h4>
								<input type=hidden id="address" value="${list.activityLocation}"/>
								${list.activityLocation}
								<br />
								<h4>
									票價：<br />
								</h4>${list.activityPrice}<br />
								<h4>
									簡介：<br />
								</h4>${list.activityContent}<br />

								<div id="map"></div>
							</div>
							<div class="form-group">
								<label for="exampleInputSeats"><h4>票券張數：</h4></label> <select
									name="qty" class="form-control" id="exampleInputSeats">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select> <Input type='hidden' name='activityId'
									value='${list.activityId}'> <Input type='hidden'
									name='activityName' value='${list.activityName}'> <Input
									type='hidden' name='activityPrice'
									value='${list.activityPrice}'> <Input type='hidden'
									name='activityDate' value='${list.activityDate}'> <Input
									type='hidden' name='activityLocation'
									value='${list.activityLocation}'> <Input type='hidden'
									name='activityMaxPeople' value='${list.activityMaxPeople}'>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox" required>
									我已同意SoundPod播音平台服務規範
								</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<!-- link to payment gatway here -->
							<button type="submit" class="btn btn-primary" id="booknow">加入購物車</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>


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




					<c:forEach var="list" items="${list}" varStatus="loop">

						<div class="col-md-6 col-sm-6">
							<!-- event item -->
							<div class="events-item ">
								<!-- image container -->
								<div class="figure">
									<!-- event date -->
									<div class="event-date">
										<!-- 										2020-10-23 -->
										${fn:substring(list.activityDate, 5, 7)} / <span
											class="emonth">${fn:substring(list.activityDate, 8, 10)}</span>
										<div class="clearfix"></div>
										<!-- time -->
										<%-- 											<span class="etime">${fn:substring(list.activityTime, 0, 5)}</span> --%>
										<span class="etime">${list.activityTime}</span>
									</div>
									<!-- event location -->
									<span class="event-location"><i class="fa fa-map-marker"></i>${fn:substring(list.activityLocation, 0, 12)}</span>
									<!-- image -->
									<img class="img-responsive" src="<c:url value='${list.activityImg}' />" alt="" />
									<!-- 										<img class="img-responsive" src="img/event/1.jpg" alt="" /> -->
									<!-- image hover -->
									<!-- 										<div class="img-hover"> -->
									<!-- 											hover icon -->
									<!-- 											<a href="#"><i class="fa fa-play-circle"></i></a> -->
									<!-- 										</div> -->
								</div>
								<!-- event information -->
								<div class="event-info">
									<!-- event title -->
									<h3 id="getActivity${loop.index }">${list.activityName}</h3>
									<!-- horizontal line -->
									<hr />
									<!-- paragraph -->
									<p>
										${fn:substring(list.activityContent, 0, 30)}... <a
											style="color: #F23030" href="#">more</a>
									</p>
									<!-- buy ticket button link -->
									<button href="#bookTicket${loop.index}"
										class="btn btn-lg btn-theme" data-toggle="modal"
										id="${loop.index}" name="abc" class="submit" onclick="codeAddress()">購票</button>
								</div>
							</div>
						</div>




					</c:forEach>


				</div>
			</div>
		</div>
	</div>
	<!-- events end -->

	<!-- events end -->
<script>
var geocoder;
var map;

function initialize() {
    geocoder = new google.maps.Geocoder();

    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var mapOptions = {
        zoom: 11,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
}

function codeAddress() {
    var address = document.getElementById('address').value;
    geocoder.geocode({
        'address': address
    }, function (results, status) {
        if (status == 'OK') {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}

</script>

</body>
</html>