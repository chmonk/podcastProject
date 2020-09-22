<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>SoundPod</title>
<!-- Description, Keywords and Author -->
<meta name="description" content="Your description">
<meta name="keywords" content="Your,Keywords">
<meta name="author" content="HimanshuGupta">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Styles -->

<!-- jquery-ui CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<!-- Bootstrap CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
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


	<!-- wrapper -->
	<div class="wrapper" id="home">


		<!-- header banner area -->
		<jsp:include page="header_banner.jsp" flush="true " />
		<!--/ header banner end -->

		<!-- block for animate navigation menu -->
		<div class="nav-animate"></div>

		<!-- Hero 官方節目 area -->
		<jsp:include page="hero.jsp" flush="true " />
		<!--/ hero end -->

		<!-- 矚目新選 -->
		<jsp:include page="promo_feature.jsp" flush="true " />
		<!-- 矚目新選 -->

		<!-- call to action -->
		<jsp:include page="callToAction.jsp" flush="true " />
		<!--/ cta end -->

		<!-- 熱播排行 -->
		<jsp:include page="workWithUs.jsp" flush="true " />
			<%-- <jsp:param value="" name=""/> --%>
<%-- 		</jsp:include>
 --%>		<!-- 熱播排行 -->

		<!-- sign up for news letter -->
		<jsp:include page="newsLetter.jsp" flush="true " />
		<!-- news letter end -->

		<!-- 人氣播客 portfolio -->
		<jsp:include page="popularPodcasts.jsp" flush="true " />
		<!-- portfolio end -->

		<!-- events -->
		<jsp:include page="events.jsp" flush="true " />
		<!-- events end -->

		<!-- about -->
		<jsp:include page="about.jsp" flush="true " />
		<!-- about end -->

		<!-- meet -->
		<jsp:include page="meets.jsp" flush="true " />
		<!-- meet end -->

		<!-- contact -->
		<jsp:include page="contact.jsp" flush="true " />
		<!-- contact end -->

		<!-- footer -->
		<jsp:include page="footer.jsp" flush="true " />
		<!-- footer end -->

		<!-- Scroll to top -->
		<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>
	</div>


	<!--playerbar -->
	<jsp:include page="playerbar.jsp" flush="true " />
	<!--playerbar end -->


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
