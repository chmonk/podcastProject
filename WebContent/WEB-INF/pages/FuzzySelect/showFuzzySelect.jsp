<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showFuzzySelect</title>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.carousel.min.css"></link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.theme.default.min.css"></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/owl.carousel.min.js"></script>

<!-- player bar css -->
<link href="css/playerbar.css" rel="stylesheet">
<!-- player bar icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- music bar css -->
<link href="css/musicbar.css" rel="stylesheet">


<style type="text/css">
.showPodcasterBody {
	margin-top: 150px;
	margin-bottom: 60px;
}
.card {
	margin-left: 0.5em;
	margin-right: 0.5em;
}

.card img {
	box-shadow: 4px 4px 3px rgba(20%,20%,40%,0.5);
	display: block;
	max-width: 100%;
	height: 200px;
/* 	padding: 10px; */
}
.card-block{
	text-align: center;
}

.padcastlist {
	margin: 20px 60px 60px 60px;
}
.padcard{
	margin: auto;
	
}
.padcard ul {
	padding: 0;
	list-style: none;
}

.padcard li {
	margin: 0;
	float: left;
	padding: 30px 0;
}

.title-select {
	margin-top: 50px;
	margin-left: 50px; 
}
.first {
  transition: box-shadow 300ms ease-in-out, color 300ms ease-in-out;
}
.first:hover {
   box-shadow: 0 0 40px 40px #f23031 inset;
 }
 .btn1 {
  box-sizing: border-box;
  appearance: none;
  background-color: transparent;
  border: 2px solid #f23031;
  border-radius: 0.6em;
  color: #f23031;
  cursor: pointer;
  /* display: flex; */
  align-self: center;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1;
  margin: 20px;
  padding: 1.2em 2.8em;
  text-decoration: none;
  text-align: center;
  text-transform: uppercase;
  font-family: 'Montserrat', sans-serif;
  font-weight: 700; 
}

.btn1:hover{
    color: #fff;
    outline: 0;
}
.btn1:focus{
	color: #fff;
    outline: 0;
}

.podcastListTitle{
	margin-left: 65px;
    margin-bottom: 30px;
}
.podcasterListTitle{
	margin-bottom: 0px;
	margin-top: 20px;
}
 
 

</style>
<script type="text/javascript">
$(document).ready(function(){

	$('.owl-carousel').owlCarousel({
	    loop:false,
	    //autoWidth:true, 
	    margin:10,
	    responsive:{
	        350:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	})
});
</script>
</head>
<body>
	<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
		
	</div>
	<div class="showPodcasterBody">
		<div class="title-select">
			<h1>搜尋結果</h1>
		</div>
		<div class="container padcard">
			<div class="row">
				<div class="col-sm-12">
				<c:if test="${empty fuzzyUserData and empty fuzzyPodcastData}">
					<h2 class="podcasterListTitle">找不到資料!請重新搜尋!</h2>
				</c:if>
				<c:if test="${not empty fuzzyUserData}">
					<h4 class="podcasterListTitle">播客列表</h4>
				</c:if>
					<ul class="owl-carousel owl-theme">
						<c:forEach var="data" items="${fuzzyUserData}">
							<li class="item">
								<div class="card">
									<img class="card-img-top img-fluid cardImg"
										src="${data.getImage()}">
									<div class="card-block">
										<h4 class="card-title">${data.getNickname()}</h4>
										<p class="card-text">${data.getInfo()}</p>
										<form action="<c:url value="/podcastPage"/>">
						                   <input type="hidden" name="fuzzyPodcasterId" value="${data.getMemberId()}" />
						                   <input type="submit" class="btn1 first" value="前往"/>
						                 </form>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="padcastlist">
			<c:if test="${not empty fuzzyPodcastData}">
				<h4 class="podcastListTitle">節目列表</h4>
			</c:if>
			<c:forEach var="data" items="${fuzzyPodcastData}">
				<div class="container PodcastData">
					<div class="card-media">
						<!-- media container -->
						<div class="card-media-object-container">
							<div class="card-media-object">
								<img class="podcastImg" src="${data.getAudioImg()}">
							</div>
							<span class="card-media-object-tag subtle">${data.getPodcasterName()}</span>

						</div>
						<!-- body container -->
						<div class="card-media-body">
							<div class="card-media-body-top">
								<span class="subtle">${data.getTitle()}</span>
								<div class="card-media-body-top-icons u-float-right">
									<svg fill="#888888" height="16" viewBox="0 0 24 24" width="16"
										xmlns="http://www.w3.org/2000/svg">
	            						<path d="M0 0h24v24H0z" fill="none" />
	            						<path
											d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z" />
	         						</svg>
									<svg fill="#888888" height="16" viewBox="0 -28 512 512"
										width="16" xmlns="http://www.w3.org/2000/svg">
	          	<path
											d="m471.382812 44.578125c-26.503906-28.746094-62.871093-44.578125-102.410156-44.578125-29.554687 0-56.621094 9.34375-80.449218 27.769531-12.023438 9.300781-22.917969 20.679688-32.523438 33.960938-9.601562-13.277344-20.5-24.660157-32.527344-33.960938-23.824218-18.425781-50.890625-27.769531-80.445312-27.769531-39.539063 0-75.910156 15.832031-102.414063 44.578125-26.1875 28.410156-40.613281 67.222656-40.613281 109.292969 0 43.300781 16.136719 82.9375 50.78125 124.742187 30.992188 37.394531 75.535156 75.355469 127.117188 119.3125 17.613281 15.011719 37.578124 32.027344 58.308593 50.152344 5.476563 4.796875 12.503907 7.4375 19.792969 7.4375 7.285156 0 14.316406-2.640625 19.785156-7.429687 20.730469-18.128907 40.707032-35.152344 58.328125-50.171876 51.574219-43.949218 96.117188-81.90625 127.109375-119.304687 34.644532-41.800781 50.777344-81.4375 50.777344-124.742187 0-42.066407-14.425781-80.878907-40.617188-109.289063zm0 0" />
	          </svg>
								</div>
							</div>
							<span class="card-media-body-heading">${data.getPodcastInfo()}</span>
							<div class="card-media-body-supporting-bottom">
								<span class="card-media-body-supporting-bottom-text subtle">${data.getUploadTime()}</span>
								<span
									class="card-media-body-supporting-bottom-text subtle u-float-right">點擊率${data.getClickAmount()}</span>
							</div>
							<div
								class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
								<span class="card-media-body-supporting-bottom-text subtle">${data.getCategoryName()}</span>
								<c:choose>
									<c:when test="${data.getOpenPayment()==1}">
										<c:choose>
											<c:when test="${data.getConfirmubScription() ==2 or data.getConfirmubScription() ==1}">
												<a id="${data.getPodcastId()}"
													class="card-media-body-supporting-bottom-text card-media-link u-float-right playlist-number">加到播放列表</a>
											</c:when>
											<c:otherwise>
												<a id="${data.getPodcastId()}" href="<c:url value="/podcastPage?fuzzyPodcasterId=${data.getPodcasterId()}"/>"
													class="card-media-body-supporting-bottom-text card-media-link u-float-right">
													需訂閱才能收聽</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<a id="${data.getPodcastId()}"
											class="card-media-body-supporting-bottom-text card-media-link u-float-right playlist-number">加到播放列表</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
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

	<!--playerbar -->
	<jsp:include page="../playerbar.jsp" flush="true " />
	
	<!--playerbar end -->
	

</body>
</html>