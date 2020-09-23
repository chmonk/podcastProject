<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>




<head>
<meta charset="UTF-8">
<title>頻道頁面</title>

<!-- Description, Keywords and Author -->
<meta name="description" content="Your description">
<meta name="keywords" content="Your,Keywords">
<meta name="author" content="HimanshuGupta">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Styles -->
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

</head>
<style>
 @import url(https://fonts.googleapis.com/css?family=Montserrat:400,700); 

#form-div {
	background-color:rgba(72,72,72,0.4);
	padding-left:35px;
	padding-right:35px;
	padding-top:35px;
	padding-bottom:35px;
	width: 250px;
  margin-top:35px;
  -moz-border-radius: 7px;
  -webkit-border-radius: 7px;
}

.feedback-input {
	color:#3c3c3c;
 	font-family: Helvetica, Arial, sans-serif; 
   font-weight:500; 
	font-size: 16px;
	border-radius: 0;
	background-color: #fbfbfb;
	padding: 5px 5px 5px 5px;
	margin-bottom: 10px;
	width:100%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
  border: 3px solid rgba(0,0,0,0);
}

.feedback-input:focus{
	background: #fff;
	box-shadow: 0;
	border: 3px solid #3498db;
	color: #3498db;
	outline: none;
  padding: 5px 5px 5px 5px;
}

.focused{
	color:#30aed6;
	border:#30aed6 solid 3px;
}

/* Icons ---------------------------------- */

 #content{ 
 	background-image: url(http://rexkirby.com/kirbyandson/images/comment.svg); 
 	background-size: 30px 30px; 
 	background-position: 11px 8px; 
 	background-repeat: no-repeat; 
 } 

textarea {
    width: 100%;
    height: 150px;
    line-height: 150%;
    resize:vertical;
}

input:hover, textarea:hover,
input:focus, textarea:focus {
	background-color:white;
}

#submitBtn{
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	float:left;
	width: 100%;
	border: #fbfbfb solid 4px;
	cursor:pointer;
	background-color: #3498db;
	color:white;
	font-size:15px;
	padding-top:10px;
	padding-bottom:10px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
  margin-top:-4px;
  font-weight:700;
}

#submitBtn:hover{
	background-color: white;
	color: #0493bd;
}
	
.submit:hover {
	color: #3498db;
}
	
 .ease { 
 	width: 0px; 
 	height: 74px; 
 	background-color: #fbfbfb; 
 	-webkit-transition: .3s ease; 
 	-moz-transition: .3s ease; 
 	-o-transition: .3s ease; 
 	-ms-transition: .3s ease; 
 	transition: .3s ease; 
 } 

 .submit:hover .ease{ 
   width:100%; 
   background-color:white; 
 } 

.d2 {
	width: 500px;
	height: 500px;
	overflow-y: scroll;
	overflow-x: none;
}
#onetable{
/* background-color: red; */
border: solid 3px black;
padding: 10px 10px 10px 10px; 
}
.d3{
border-bottom: dashed 2px #D0D0D0;
}

//阿凱樣式
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
	float: right;
	margin: 20px auto 0;
	width: 600px;
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
	width: 600px;
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
	background: -moz-linear-gradient(top, rgba(0, 0, 0, 0) 0%,
		rgba(0, 0, 0, 0) 52%, rgba(0, 0, 0, 0.4) 100%);
	background: -webkit-linear-gradient(top, rgba(0, 0, 0, 0) 0%,
		rgba(0, 0, 0, 0) 52%, rgba(0, 0, 0, 0.4) 100%);
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%,
		rgba(0, 0, 0, 0) 52%, rgba(0, 0, 0, 0.4) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00000000',
		endColorstr='#a6000000', GradientType=0);
	opacity: 1;
}

/* .card-media-object-tag { */
/* 	background-color: #fff; */
/* 	border-radius: 2px; */
/* 	padding: 2px 7px; */
/* 	position: absolute; */
/* 	right: 10px; */
/* 	top: 10px; */
/* } */

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

.card-media-body-top-icons>svg {
	cursor: pointer;
	margin-left: 10px;
	transition: all 300ms ease-out;
}

.card-media-body-top-icons>svg:hover {
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

.padcard {
	margin: auto;
}

.podcastImg {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: auto;
	height: auto;
	max-width: 100%;
	max-height: 100%;
}




</style>



<body>

	<div>
		<c:forEach var="podcast" items="${upList}">
			<div class="container">
				<div class="card-media">
					<!-- media container -->
					<div class="card-media-object-container">
						<div class="card-media-object">
							<img class="podcastImg" src="${podcast.audioimg}">
						</div>
					</div>
					<!-- body container -->
					<div class="card-media-body">
						<div class="card-media-body-top">
							<span class="subtle">${podcast.title}</span>
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
						<span class="card-media-body-heading">${podcast.podcastInfo}</span>
						<div class="card-media-body-supporting-bottom">
							<span class="card-media-body-supporting-bottom-text subtle">${podcast.uploadTime}</span>
							<span
								class="card-media-body-supporting-bottom-text subtle u-float-right">點擊率${podcast.clickAmount}</span>
						</div>
						<div
							class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
							<a id="${podcast.podcastId}"
								class="card-media-body-supporting-bottom-text card-media-link u-float-right playlist-number">加到播放列表</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
// 以上為阿凱樣式





	<div id="form-div">
		<form action="podcastPage.do" method="post" name="comment" class="form" id="form1">
			<table >
				<tr class="text">
					<td><textarea name="text" class="validate[required,length[6,300]] feedback-input" id="content" cols="40" placeholder="留言內容：&#13;&#10;請輸入不超過50個字" maxlength="50"></textarea></td>
<!-- 					<textarea id="content" rows="5" cols="40" -->
<!-- 							placeholder="請輸入不超過50個字" maxlength="50"></textarea></td> -->
				</tr>
				<tr>
					<td class="submit">
					<input type="hidden" id="PId" value=${thisPodcasterId}>   
					<input id="submitBtn" type="button" value=" 提交 " >
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<div class="d2">
		<form >
			
			<table  width="400">
				<tbody id="ctable">
					<c:forEach items="${commList}" var="comment" varStatus="tagStatus">
						<tr class="d3">
							<td width="260">${comment.commentMsg}</td>
							<td width="40" align="center" style="color:gray">${comment.memberId}</td>
							<td width="100" align="center" style="color:gray">${comment.msgDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
	</div>
					<!-- 				<td><input type="button" name="delete" value="刪除" onclick="location='http://localhost:8080/SpringWebProject/processDeleteComment'"></td></tr> -->
					<%-- 				<td><form id="${comment.commentId}" action="<c:url value="/processDeleteComment"/>"  method="POST"> --%>
					<!-- 				<input type="hidden" name="delCommId" value=${comment.commentId}>  -->
					<%-- 				<input type="button" value="刪除" onclick="delConfirm(this.name)" name="${comment.commentId}"></form></td> --%>
<div class="col-md-6 col-sm-6">
<!-- play list -->
<c:forEach items="${upList}" var="podcast" varStatus="status">
		<div class="playlist-content">
			<ul class="list-unstyled">
				<li class="playlist-number">
					<!-- song information -->
					<div class="song-info">
						<!-- song title -->
						<h4>${podcast.title}</h4>
					</div> <!-- music icon -->
					<div class="music-icon">
						<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
							class="fa fa-pause"></i></a>
					</div>
					<div class="clearfix"></div>
				</li>
			</ul>
		</div>
	</c:forEach>
	</div>
<script type="text/javascript">
		function delConfirm(clicked_name) {

			var r = confirm("確定要刪除此留言?")
			if (r == true) {

				console.log(clicked_name);
				document.getElementById(clicked_name).submit();

			} else {

			}
		}

		var flag= false;

		document.getElementById("submitBtn").onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/podcastPage.do'/>", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			var content = document.getElementById("content").value;
			var PId=document.getElementById("PId").value;
			console.log(content);
			xhr.send("content=" + content+"&PId="+PId);
			console.log(content);

			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					console.log("get data");
					console.log(xhr.responseText);
					var cbean = JSON.parse(xhr.responseText);
					console.log(cbean.commentMsg);
					var ctable = document.getElementById("ctable");

					

					//下面兩行有問題尚未解決
					var newMsg = "<tr class='d3'><td width='240'>" + cbean.commentMsg
							+ "</td><td width='80' align='center' style='color:gray'>" + cbean.memberId
							+ "</td><td width='80' align='center' style='color:gray'>" + cbean.msgDate
							+ "</td></tr>";
					
				ctable.innerHTML+=newMsg;

				flag=true;
				}
			}		
		}
</script>
	

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