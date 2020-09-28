<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Map</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeVgKGb9DYep9MX7uwKiRZd2NYaerrhSw&callback=initMap"
	defer></script>
<style type="text/css">
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
</script>
</head>
<body onload="initialize()">
	<div id="map"></div>
	<div>
		<input id="address" type="text" value="Sydney, NSW"> <input
			type="button" value="Encode" onclick="codeAddress()">
	</div>
</body>
</html>