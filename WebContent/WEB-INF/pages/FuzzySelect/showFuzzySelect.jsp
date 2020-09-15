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
 
/* body {
	 perspective: 1000px;
	 background: #f2f4f7;
} */
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
html {
  background-color: #fefefe;
  box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 500;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.container {
  margin: 20px auto 0;
  width: 700px;
}

.u-float-right {
  float: right;
}

.u-flex-center {
  display: -webkit-flex;
  display: flex;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-align-items: center;
  align-items: center;
}

.subtle {
  color: #888;
  font-size: 12px;
}

.card-media {
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .12);
  height: 125px;
  margin-bottom: 25px;
  transition: all 300ms ease-out;
  width: 100%;
}

.card-media:hover {
  box-shadow: 0 5px 14px rgba(0, 0, 0, .2);
}

.card-media-object-container {
  background: none;
  float: left;
  height: 100%;
  width: 35%;
  position: relative;
}

.card-media-object {
  background-position: center center;
  background-size: cover;
  height: 100%;
}

.card-media-object:after {
  content: " ";
  display: block;
  height: 100%;
  left: 0;
  opacity: 0;
  position: absolute;
  right: 0;
  top: 0;
  transition: all 300ms ease-out;
  z-index: 10;
}

.card-media:hover .card-media-object:after {
  background: -moz-linear-gradient(top,  rgba(0,0,0,0) 0%, rgba(0,0,0,0) 52%, rgba(0,0,0,0.4) 100%);
  background: -webkit-linear-gradient(top,  rgba(0,0,0,0) 0%,rgba(0,0,0,0) 52%,rgba(0,0,0,0.4) 100%);
  background: linear-gradient(to bottom,  rgba(0,0,0,0) 0%,rgba(0,0,0,0) 52%,rgba(0,0,0,0.4) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000', endColorstr='#a6000000',GradientType=0 );
  opacity: 1;
}

.card-media-object-tag {
  background-color: #fff;
  border-radius: 2px;
  padding: 2px 7px;
  position: absolute;
  right: 10px;
  top: 10px;
}

.card-media-object-social-list {
  bottom: 4px;
  left: 10px;
  list-style-type: none;
  margin: 0;
  padding: 0;
  position: absolute;
  z-index: 20;
}

.card-media-object-social-list li {
  border-radius: 50%;
  display: inline-block;
  height: 30px;
  margin-right: 6px;
  opacity: 0;
  overflow: hidden;
  transform: translateY(5px);
  transition: all 300ms ease-out;
  width: 30px;
}

.card-media:hover .card-media-object-social-list li {
  opacity: 1;
  transform: translateY(0);
}

.card-media-object-social-list li:nth-child(1) {
  transition-delay: 0;
}
.card-media-object-social-list li:nth-child(2) {
  transition-delay: 75ms;
}
.card-media-object-social-list li:nth-child(3) {
  transition-delay: 150ms;
}

.card-media-object-social-list-item-additional {
  border: 1px solid #fff;
  color: #fff;
  font-size: 12px;
  padding-top: 7px;
  text-align: center;
}

.card-media-body {
  background-color: #fff;
  float: left;
  height: 100%;
  padding: 12px 15px;
  position: relative;
  width: 65%;
}

.card-media-body-top {
  display: block;
}

.card-media-body-top-icons {
  margin-top: -2px;
  opacity: 0;
  transition: all 300ms ease-out;
  transform: translateY(-5px);
}

.card-media:hover .card-media-body-top-icons {
  opacity: 1;
  transform: translateY(0);
}

.card-media-body-top-icons > svg {
  cursor: pointer;
  margin-left: 10px;
  transition: all 300ms ease-out;
}

.card-media-body-top-icons > svg:hover {
  fill: #444;
}

.card-media-body-heading {
  display: block;
  margin-top: 10px;
}

.card-media-body-supporting-bottom {
  position: absolute;
  bottom: 10px;
  left: 0;
  opacity: 1;
  padding: 0 15px;
  transition: all 300ms ease-out;
  width: 100%;
}

.card-media:hover .card-media-body-supporting-bottom {
  opacity: 0;
  transform: translateY(-8px);
}

.card-media-body-supporting-bottom-text {
  display: inline-block;
}

.card-media-body-supporting-bottom-reveal {
  opacity: 0;
  transform: translateY(8px);
  transition: all 300ms ease-out;
}

.card-media:hover .card-media-body-supporting-bottom-reveal {
  opacity: 1;
  transform: translateY(0);
}

.card-media-link {
  color: #41C1F2;
  text-decoration: none;
}

.padcard{
	margin: auto;
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
	<div class="carousel-container col-sm-10 padcard">
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
	<div class="container">
	  <div class="card-media">
	    <!-- media container -->
	    <div class="card-media-object-container">
	      <div class="card-media-object" style="background-image: url(https://s9.postimg.cc/y0sfm95gv/prince_f.jpg);"></div>
	      <span class="card-media-object-tag subtle">${data.getPodcasterName()}</span>
	     
	    </div>
	    <!-- body container -->
	    <div class="card-media-body">
	      <div class="card-media-body-top">
	        <span class="subtle">${data.getTitle()}</span>
	        <div class="card-media-body-top-icons u-float-right">
	          <svg fill="#888888" height="16" viewBox="0 0 24 24" width="16" xmlns="http://www.w3.org/2000/svg">
	            <path d="M0 0h24v24H0z" fill="none"/>
	            <path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z"/>
	          </svg>
	          <svg fill="#888888" height="16" viewBox="0 0 24 24" width="16" xmlns="http://www.w3.org/2000/svg">
	            <path d="M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z"/>
	            <path d="M0 0h24v24H0z" fill="none"/>
	          </svg>
	        </div>
	      </div>
	      <span class="card-media-body-heading">${data.getPodcastInfo()}</span>
	      <div class="card-media-body-supporting-bottom">
	        <span class="card-media-body-supporting-bottom-text subtle">${data.getUploadTime()}</span>
	        <span class="card-media-body-supporting-bottom-text subtle u-float-right">點擊率${data.getClickAmount()}</span>
	      </div>
	      <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
	        <span class="card-media-body-supporting-bottom-text subtle">${data.getCategoryName()}</span>
	        <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right">加到播放列表</a>
	      </div>
	    </div>
	  </div>
	</div>
	</c:forEach>
	<p>${data.getPodcastId()}
		<p>${data.getTitle()}
		<p>${data.getCategoryName()}
		<p>${data.getPodcasterName()}
		<p>${data.getPodcastInfo()}
		<p>${data.getOpenPayment()}
		<p>${data.getUploadTime()}
		<p>${data.getClickAmount()}
		<p>${data.getAudioPath()}
	

</div>

	

</body>
</html>