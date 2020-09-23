<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Styles -->
<%-- 
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
<body >
	<!-- portfolio -->
	<div class="portfolio pad" id="portfolio" >
		<div>
			<!-- default heading -->
			<div class="default-heading">
				<!-- heading -->
				<h2>人氣播客</h2>
			</div>
		</div>
		<!-- portfolio -->
		
		<div class="portfolio-content" id="portfolioOwl" style="opacity:1;">
			
			
		</div>
		<div class="text-center">
			<a href="#" class="btn btn-lg btn-theme">View more</a>
		</div>
		<!-- portfolio end -->
	</div>
	<!-- portfolio end -->
	
	
<script src="js/custom.js"></script>

	
<script>
	window.onload=function(){
		var content=document.getElementById("portfolioOwl");
		var xhr=new XMLHttpRequest();
		xhr.open("GET","PopularPodcaster",true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState===4 && xhr.status===200){
				var type=xhr.getResponseHeader("Content-Type");
				var podcasters=JSON.parse(xhr.responseText);

				console.log("podcasters:"+podcasters);
				var inside="";
				for(var i=0;i<5;i++){ 
					inside+=
					"<div class='item'>"
					+"<img class='img-responsive' src='img/portfolio/1.jpg' alt=''>"
					+"<div class='p-transparent'></div>"
					+"<div class='p-hover'>"
					+"<h3>"+podcasters[i].nickname+"</h3>"
					+"<hr>"
					+"<p>"+podcasters[i].info+"</p>"
					+"<a href='#'><i class='fa fa-share'></i></a>"
					+"</div>"
					+"</div>"
					
				}		
				content.innerHTML=inside;
			}
		}
	}
</script>

</body>

</html>