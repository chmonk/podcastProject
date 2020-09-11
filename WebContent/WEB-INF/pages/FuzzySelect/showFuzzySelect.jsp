<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.carousel.min.css"></link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.theme.default.min.css"></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/owl.carousel.min.js"></script>
 <style type="text/css">
body {
	 perspective: 1000px;
	 background: #f2f4f7;
}
/*  h1 {
	 color: white;
} */
.container {
	 padding-top: 20px;
}
 ul {
	 padding: 0;
	 list-style: none;
}
 li {
	 margin: 0;
	 float: left;
	 padding: 50px 0;
}
 .card {
	 margin-left: 0.25em;
	 margin-right: 0.25em;
}
 .card img {
	 display: block;
	 max-width: 100%;
	 height: auto;
}
 /* .owl-wrapper {
	 transform-style: preserve-3d;
} */
/*  .owl-item {
	 transition: all 250ms ease-out;
	 transform: translate3d(0px, 0px, 0px) scale(1);
}
 .owl-item.active {
	 transform: translate3d(0px, 0px, -10px) scale(1) rotateY(25deg);
}
 .owl-item.active + .active {
	 transform: translate3d(0px, 0px, 10px) scale(1);
}
 .owl-item.active + .active + .active {
	 transform: translate3d(0px, 0px, 20px) scale(1);
}
 .owl-item.active + .active + .active + .active {
	 transform: translate3d(0px, 0px, 10px) scale(1);
}
 .owl-item.active + .active + .active + .active + .active {
	 transform: translate3d(0px, 0px, -10px) scale(1) rotateY(-25deg);
} */
 

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
	<div class="carousel-container">
		<div class="row">
	    	<div class="col-sm-12">
		        <ul class="owl-carousel owl-theme">
			        <c:forEach var="data" items="${fuzzyUserData}">
			          <li class="item">
			            <div class="card">
			              <img class="card-img-top img-fluid" src="https://source.unsplash.com/318x180/?starwars" alt="Card image cap">
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

	<%-- <c:forEach var="data" items="${fuzzyUserData}">
		<figure class="snip1344"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile-sample1" class="background"/><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile-sample1" class="profile"/>
		  <figcaption>
		    <h3>${data.getNickname()}<span>Engineer</span></h3>
		    <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a><a href="#"> <i class="ion-social-twitter-outline"></i></a><a href="#"> <i class="ion-social-vimeo-outline"></i></a></div>
		  </figcaption>
		</figure>
	</c:forEach> --%>


<div>
	<c:forEach var="data" items="${fuzzyPodcastData}">
		<p>${data.getPodcastId()}
		<p>${data.getTitle()}
		<p>${data.getCategoryName()}
		<p>${data.getPodcasterName()}
		<p>${data.getPodcastInfo()}
		<p>${data.getOpenPayment()}
		<p>${data.getUploadTime()}
		<p>${data.getClickAmount()}
		<p>${data.getAudioPath()}
	</c:forEach>
	

</div>

	

</body>
</html>