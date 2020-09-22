<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Styles -->

<!-- jquery-ui CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
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
<style type="text/css">
/* *{
	border: 1px solid black;
} */
.showPodcasterBody{
	padding-top: 40px;
	padding-bottom: 40px;
}
.showPodcasterBodyHeader{
    padding-top: 110px;
	border-bottom: 1px solid black;
}
.memberImg{
	margin: auto;
	margin-bottom: 20px;
	background-color: #222831;
	height: 200px;
	width: 200px;
	border: 1px solid black;
	border-radius: 50%;
}
.memberName{
	margin-top:30px;
	display:inline-block;
	background-color: #222831;
	padding:5px 15px 5px 15px ;
	margin-left: -50px;
	font-family: 微軟正黑體 ;
	font-size: 30px;
	color: #eeeeee;
	border-radius: 10%;
}
.memberInfo{
	margin-top:20px;
	margin-left: -50px;
	font-family: 微軟正黑體 ;
	font-size: 20px;
	font: #222831;
}

</style>

<title>頻道首頁</title>
</head>
<body>
	<div class="head">
		<jsp:include page="../header_banner.jsp" flush="true " />
		
	</div>
	<div class="showPodcasterBody">
		<div class="row showPodcasterBodyHeader">
			<div class="col-md-4">
				<div class="memberImg">
				</div>
			</div>
			<div class="col-md-8">
				<div class="memberName">XXX</div>
				<div class="memberInfo">XXXXXXXXXXX</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="messageBoard">
						ffffff
				</div>
			</div>
			<div class="col-md-6">
				<div class="podcastList">
				fffffff
				</div>
			</div>
		</div>
	</div>
	<div class="playbar">
		<jsp:include page="../playerbar.jsp" flush="true " />
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