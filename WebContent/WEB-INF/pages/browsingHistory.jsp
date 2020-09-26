<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.carousel.min.css"></link>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.theme.default.min.css"></link>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/owl.carousel.min.js"></script>

<!-- player bar css -->
<link href="css/playerbar.css" rel="stylesheet">
<!-- player bar icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link href="css/musicbar.css" rel="stylesheet">
<style type="text/css">
.showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 50px;
	/* 	border-bottom: 1px solid black;  */
}

h2 {
	margin: 10%;
}


</style>
<script type="text/javascript">
	$(document).ready(function() {

		$('.owl-carousel').owlCarousel({
			loop : false,
			//autoWidth:true, 
			margin : 10,
			responsive : {
				350 : {
					items : 1
				},
				600 : {
					items : 3
				},
				1000 : {
					items : 5
				}
			}
		})
	});
</script>
</head>
<body>
	<div class="head">
		<jsp:include page="header_banner_test.jsp" flush="true " />
	</div>

	<div class="showPodcasterBody">
		<div class="row showPodcasterBodyHeader">
			<div class="col-md-4">
				<div class="memberImg">
					<img alt="" src="${podcasterData.podcastImg}">
				</div>
			</div>
			<div class="col-md-8">
				<div class="memberName">${podcasterData.podcastName}</div>
				<div class="memberInfo">${podcasterData.podcastInfo}</div>
				<div></div>
			</div>
		</div>
	</div>

	<h2>瀏覽紀錄</h2>  <button id="pressHistoryAdd">一鍵加入</button>

	<hr>


	<div class="carousel-container col-sm-10 padcard">
		<div class="row">
			<div class="col-sm-12">
				<ul class="owl-carousel owl-theme">
					<c:forEach var="data" items="${fuzzyUserData}">
						<li class="item">
							<div class="card">
								<img class="card-img-top img-fluid"
									src="https://source.unsplash.com/318x180/?starwars"
									alt="Card image cap">
								<div class="card-block">
									<h4 class="card-title">${data.getNickname()}</h4>
									<p class="card-text">${data.getInfo()}</p>
									<a href="#" class="btn btn-primary">Button</a>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div>
		<c:forEach var="rownum" items="${history}">
			<div class="container">
				<div class="card-media">
					<!-- media container -->
					<div class="card-media-object-container">
						<div class="card-media-object">
							<img class="podcastImg" src="${rownum.getAudioImg()}">
						</div>
						<span class="card-media-object-tag subtle">${rownum.getNickname()}</span>

					</div>
					<!-- body container -->
					<div class="card-media-body">
						<div class="card-media-body-top">
							<span class="subtle">${rownum.getPodcastName()}</span>

							<!-- 依據資料庫染愛心顏色 -->
							<c:choose>
								<c:when test="${rownum.getLikestatus()==1}">
									<div class="card-media-body-top-icons u-float-right like">
								</c:when>
								<c:otherwise>
									<div class="card-media-body-top-icons u-float-right">
								</c:otherwise>
							</c:choose>

							<!-- 								<svg height="16" viewBox="0 0 24 24" width="16" -->
							<!-- 									xmlns="http://www.w3.org/2000/svg"> -->
							<!-- 	            <path d="M0 0h24v24H0z" fill="none" /> -->
							<!-- 	            <path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z" /> -->
							<!-- 	          </svg> -->
							
							<svg height="20" viewBox="0 -28 512 512" width="16" xmlns="http://www.w3.org/2000/svg">
	          	<path d="m471.382812 44.578125c-26.503906-28.746094-62.871093-44.578125-102.410156-44.578125-29.554687 0-56.621094 9.34375-80.449218 27.769531-12.023438 9.300781-22.917969 20.679688-32.523438 33.960938-9.601562-13.277344-20.5-24.660157-32.527344-33.960938-23.824218-18.425781-50.890625-27.769531-80.445312-27.769531-39.539063 0-75.910156 15.832031-102.414063 44.578125-26.1875 28.410156-40.613281 67.222656-40.613281 109.292969 0 43.300781 16.136719 82.9375 50.78125 124.742187 30.992188 37.394531 75.535156 75.355469 127.117188 119.3125 17.613281 15.011719 37.578124 32.027344 58.308593 50.152344 5.476563 4.796875 12.503907 7.4375 19.792969 7.4375 7.285156 0 14.316406-2.640625 19.785156-7.429687 20.730469-18.128907 40.707032-35.152344 58.328125-50.171876 51.574219-43.949218 96.117188-81.90625 127.109375-119.304687 34.644532-41.800781 50.777344-81.4375 50.777344-124.742187 0-42.066407-14.425781-80.878907-40.617188-109.289063zm0 0" />
	          
	          </svg>  <span class="likeNum" >${rownum.getLikesCount()}</span>
						</div>
					</div>
					<span class="card-media-body-heading">${rownum.getPodcastInfo()}</span>
					<div class="card-media-body-supporting-bottom">
						<span class="card-media-body-supporting-bottom-text subtle">${rownum.getUploadTime()}</span>
						<span
							class="card-media-body-supporting-bottom-text subtle u-float-right">點擊率${rownum.getClickAmount()}</span>
					</div>
					<div
						class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
						<span class="card-media-body-supporting-bottom-text subtle">${rownum.getCategoryName()}</span>
						<a id="${rownum.getPodcastId()}"
							class="card-media-body-supporting-bottom-text card-media-link u-float-right playlist-number">加到播放列表</a>
					</div>
				</div>
			</div>
	</div>
	</c:forEach>

	</div>
	<!--playerbar -->

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
	<!-- 	<script type="text/javascript" src="js/musicbar.js"></script> -->


	<jsp:include page="playerbar.jsp" flush="true " />


	<!--playerbar end -->


</body>
</html>