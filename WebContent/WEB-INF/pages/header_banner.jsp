<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Styles -->

<!-- jquery-ui CSS -->
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Favicon -->
<link rel="shortcut icon" href="img/logo/favicon.ico">  
		--%>
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
 	<!-- <script type="text/javascript" src="js/player.js"></script> -->


	 <script type="text/javascript">	 
	 $.widget( "custom.catcomplete", $.ui.autocomplete, {
		    _renderMenu: function( ul, items ) {
		      var that = this,
		        currentCategory = "";
		      $.each( items, function( index, item ) {
		        if ( item.category != currentCategory ) {
		          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
		          currentCategory = item.category;
		        }
		        that._renderItemData( ul, item );
		      });
		    }
		  });
	$(document).ready(function($){
		xhr=$.ajax({
			url:"/SpringWebProject/getFuzzySelectAllDataName.controller",
			async:false
			})
		var availableTags = xhr.responseJSON
		console.log(availableTags);
		$( "#tags" ).catcomplete({
		      source: availableTags
		    });

	});

	</script>
	<style type="text/css">
	.ui-menu{
	z-index: 999999;
	}
	.ui-autocomplete-category {
    font-weight: bold;
    padding: .2em .4em;
    margin: .8em 0 .2em;
    line-height: 1.5;
  }
 

nav ul {
	padding: 0;
  	margin: 0;
	list-style: none;
	position: relative;
	}
	


nav a {
	display:block;
	padding:0 10px;	 
	color:#FFF;
	font-size:15px;
	line-height: 40px;
	text-decoration:none;
}
nav a:hover { 
	background-color: rgba(0,0,0,0.2);
	
}



/* Hide Dropdowns by Default */
nav ul ul {
	display: none;
	position: absolute; 
	top: 70px; /* the height of the main nav */
}
	
/* Display Dropdowns on Hover */
nav ul li:hover > ul {
	display:inherit;
}
	
/* Fisrt Tier Dropdown */
nav ul ul li {
	width:170px;
	float:none;
	display:list-item;
	position: relative;
}

	

</style>
	
	

</head>
<body>		
<!-- header area -->
		<header>
			<!-- secondary menu -->
			<nav class="secondary-menu">
				<div class="container">
					<!-- secondary menu left link area -->
					<div class="sm-left">
						<!-- <strong>Phone</strong>:&nbsp; <a href="#">555 555 555</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<strong>E-mail</strong>:&nbsp; <a href="#">music.site@melodi.com</a> -->
					</div>
					<!-- secondary menu right link area -->
					
					
					<div class="sm-right">
						<!-- social link -->
						
						<div class="sm-social-link">
						<div  style="display:inline-block;line-height: 20px;color: #333; z-index:-100;">
							<form action="<c:url value="FuzzySelect.controller"/>" method="get">
								<input id="tags" class="form-control-sm" type="text" name="selectCondition"/>
								<input class="form-control-sm" type="submit" value="Send">
							</form>
						</div>
							<a class="h-facebook" href="#"><i class="fa fa-facebook"></i></a>
							<a class="h-twitter" href="#"><i class="fa fa-twitter"></i></a> <a
								class="h-google" href="#"><i class="fa fa-google-plus"></i></a>
							<a class="h-linkedin" href="#"><i class="fa fa-linkedin"></i></a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</nav>
			<!-- primary menu -->
			<nav class="navbar navbar-fixed-top navbar-default">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- logo area -->
						<a class="navbar-brand" href="<c:url value='/' />"> <!-- logo image --> <img
							class="img-responsive" src="img/logo/SoundPod2.png" alt="" />
						</a>
					</div>
	
					<!-- Collect the nav links, forms, and other content for toggling -->

					<c:choose>
						<c:when test="${LoginOK.role==1}">
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
		
									<li><a href="<c:url value='/#latestalbum' />">官方節目</a></li>
									<li><a href="<c:url value='/#featuredalbum' />">矚目新選</a></li>
									<li><a href="<c:url value='/#joinus' />">熱播排行</a></li>
									<li><a href="<c:url value='/#portfolio' />">人氣播客</a></li>
									<li><a href="<c:url value='/#events' />">派對活動</a></li>
									<li><a href="<c:url value='/#team' />">瀏覽搜尋</a></li>
									<li><li><a href="#">${LoginOK.name}</a>
				         				<!-- First Tier Drop Down -->
							            <ul class="barlist">
							                <li><a href="<c:url value='/update' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;會員資料</a></li>
							                <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的最愛</a></li>
							                <li><a href="<c:url value='/goToBrowsingHistory' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瀏覽紀錄</a></li>
							                <li><a href="<c:url value='/ShoppingCart' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;購物結帳</a></li>
							                <li><a href="<c:url value='/SubOrderController.controller' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;購買紀錄</a></li>
							                <li><a href="<c:url value='/logout' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登出</a></li>							
							            </ul>        
							           </li>
								</ul>
							</div>
						</c:when>
						<c:when test="${LoginOK.role==2}">					
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
<!-- 	http://localhost:8080/SpringWebProject/#latestalbum -->
									<li><a href="<c:url value='/#latestalbum' />">官方節目</a></li>
									<li><a href="<c:url value='/#featuredalbum' />">矚目新選</a></li>
									<li><a href="<c:url value='/#joinus' />">熱播排行</a></li>
									<li><a href="<c:url value='/#portfolio' />">人氣播客</a></li>
									<li><a href="<c:url value='/#events' />">派對活動</a></li>
									<li><a href="<c:url value='/#team' />">瀏覽搜尋</a></li>
									<li><li><a href="#">${LoginOK.name}</a>
				         				<!-- First Tier Drop Down -->
							            <ul class="barlist">
							                <li><a href="<c:url value='/update' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;會員資料</a></li>
							                <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的最愛</a></li>
							                <li><a href="<c:url value='/goToBrowsingHistory' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瀏覽紀錄</a></li>
							                <li><a href="<c:url value='/ShoppingCart' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;購物結帳</a></li>
							                <li><a href="<c:url value='/SubOrderController.controller' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;購買紀錄</a></li>
							                <li><a href="<c:url value='/addPodcast' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上傳音檔</a></li>
							                <li><a href="<c:url value='/manageActivities' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上傳活動</a></li>
							                <li><a href="<c:url value='/managePodcast' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;頻道管理</a></li>
							                <li><a href="<c:url value='/logout' />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登出</a></li>
							     
							            </ul>        
							           </li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right ">
		
									<li><a href="#latestalbum">官方節目</a></li>
									<li><a href="#featuredalbum">矚目新選</a></li>
									<li><a href="#joinus">熱播排行</a></li>
									<li><a href="#portfolio">人氣播客</a></li>
									<li><a href="#events">派對活動</a></li>
									<li><a href="#team">瀏覽搜尋</a></li>
									<li><a href="<c:url value='/login' />">註冊/登入</a></li>
								</ul>
							</div>					    
					    </c:otherwise>
					</c:choose>

					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<!--/ header end -->


	<!-- 		banner start -->
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
		
<!-- 		banner end -->
		
		
		
		
	
</body>

</html>