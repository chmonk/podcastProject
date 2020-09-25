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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
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


	<!-- wrapper -->
	<div class="wrapper" id="home">


		<!-- header_banner area -->
		<jsp:include page="header_banner.jsp" flush="true " />
		<!--/ header_banner end -->
		<!-- block for animate navigation menu -->
		<div class="nav-animate"></div>

		<!-- Hero 官方節目 area -->
		<jsp:include page="hero.jsp" flush="true " />
		<!--/ hero end -->

		<!-- 矚目新選 -->
<%-- 		<jsp:include page="promo_feature.jsp" flush="true " /> --%>
		<!-- 矚目新選 -->

		<!-- call to action -->
<%-- 		<jsp:include page="callToAction.jsp" flush="true " /> --%>
		<!--/ cta end -->

		<!-- 熱播排行 -->
		<jsp:include page="workWithUs.jsp" flush="true " />
		<%-- <jsp:param value="" name=""/> --%>
		<%-- 		</jsp:include>
 --%>
		<!-- 熱播排行 -->

		<!-- sign up for news letter -->
		<jsp:include page="newsLetter.jsp" flush="true " />
		<!-- news letter end -->

		<!-- 人氣播客 portfolio -->
		<jsp:include page="popularPodcastsTry2.jsp" flush="true " />
		<!--portfolio end -->



		<!-- events -->
		<jsp:include page="events.jsp" flush="true " />
		<!-- events end -->

		<!-- about -->
<%-- 		<jsp:include page="about.jsp" flush="true " /> --%>
		<!-- about end -->

		<!-- meet -->
<%-- 		<jsp:include page="meets.jsp" flush="true " /> --%>
		<!-- meet end -->

		<!-- contact -->
<%-- 		<jsp:include page="contact.jsp" flush="true " /> --%>
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
	
	<!-- 熱門播客JS -->

	<script>
		window.onload = function() {
			console.log("PopFunction Start!");

			let pop1 = document.getElementById("pop1");
			let pop2 = document.getElementById("pop2");
			let pop3 = document.getElementById("pop3");
			let pop4 = document.getElementById("pop4");
			let pop5 = document.getElementById("pop5");
			let pop6 = document.getElementById("pop6");
			let pop7 = document.getElementById("pop7");
			let pop8 = document.getElementById("pop8");

			let img1 = document.getElementById("img1");
			let img2 = document.getElementById("img2");
			let img3 = document.getElementById("img3");
			let img4 = document.getElementById("img4");
			let img5 = document.getElementById("img5");
			let img6 = document.getElementById("img6");
			let img7 = document.getElementById("img7");
			let img8 = document.getElementById("img8");

			let title1 = document.getElementById("title1");
			let title2 = document.getElementById("title2");
			let title3 = document.getElementById("title3");
			let title4 = document.getElementById("title4");
			let title5 = document.getElementById("title5");
			let title6 = document.getElementById("title6");
			let title7 = document.getElementById("title7");
			let title8 = document.getElementById("title8");

			let info1 = document.getElementById("info1");
			let info2 = document.getElementById("info2");
			let info3 = document.getElementById("info3");
			let info4 = document.getElementById("info4");
			let info5 = document.getElementById("info5");
			let info6 = document.getElementById("info6");
			let info7 = document.getElementById("info7");
			let info8 = document.getElementById("info8");

			var content = document.getElementById("portfolioOwl");
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "PopularPodcaster", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					console.log("readyState & status GOOD!");
					var type = xhr.getResponseHeader("Content-Type");
					var podcasters = JSON.parse(xhr.responseText);
					console.log("podcasters:" + podcasters);

					pop1.value = podcasters[0].memberId;
					pop2.value = podcasters[1].memberId;
					pop3.value = podcasters[2].memberId;
					pop4.value = podcasters[3].memberId;
	<%--
					pop5.value = podcasters[4].memberId;
					pop6.value = podcasters[5].memberId;
					pop7.value = podcasters[6].memberId;
					pop8.value = podcasters[7].memberId;
					--%>
		
	<%--
			img1.src=podcasters[0].image;
			img2.src=podcasters[1].image;
			img3.src=podcasters[2].image;
			img4.src=podcasters[3].image;
			img5.src=podcasters[4].image;
			img6.src=podcasters[5].image;
			img7.src=podcasters[6].image;
			img8.src=podcasters[7].image;
			--%>
		title1.innerHTML = podcasters[0].nickname;
					title2.innerHTML = podcasters[1].nickname;
					title3.innerHTML = podcasters[2].nickname;
					title4.innerHTML = podcasters[3].nickname;
	<%--
					title5.innerHTML = podcasters[4].nickname;
					title6.innerHTML = podcasters[5].nickname;
					title7.innerHTML = podcasters[6].nickname;
					title8.innerHTML = podcasters[7].nickname;
					--%>
		info1.innerHTML = podcasters[0].info;
					info2.innerHTML = podcasters[1].info;
					info3.innerHTML = podcasters[2].info;
					info4.innerHTML = podcasters[3].info;
	<%--
					info5.innerHTML = podcasters[4].info;
					info6.innerHTML = podcasters[5].info;
					info7.innerHTML = podcasters[6].info;
					info8.innerHTML = podcasters[7].info;
					--%>
		}
			}
		}
	</script>


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
