<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- music bar css -->
<link href="css/musicbar.css" rel="stylesheet">


<style type="text/css">
/* *{
	border: 1px solid black;
} */
.messageBoard {
	background-color: #f2f2f2;
}

.showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 110px;
	border-bottom: 1px solid black;
}

.memberImg {
	margin: auto;
	margin-bottom: 20px;
	height: 200px;
	width: 200px;
	border: 1px solid #f2f2f2;
	border-radius: 50%;
	z-index: 10;
	-webkit-box-shadow: 3px 3px 5px #f2f2f2;
	-moz-box-shadow: 3px 3px 5px #f2f2f2;
	box-shadow: 3px 3px 5px #f2f2f2;
}

.memberImg img {
	border-radius: 50%;
	z-index: 1;
	width: 100%;
	height: 100%;
}

.memberName {
	margin-top: 30px;
	display: inline-block;
	background-color: #222831;
	padding: 5px 15px 5px 15px;
	margin-left: -50px;
	font-family: 微軟正黑體;
	font-size: 30px;
	color: #eeeeee;
	border-radius: 50px;
}

.memberInfo {
	margin-top: 20px;
	margin-left: -50px;
	font-family: 微軟正黑體;
	font-size: 20px;
	font: #222831;
}

.card-media {
	width: 600px;
}

.podcastList {
	overflow-y: scroll;
	height: 1000px;
}

.messageBoard {
	overflow-y: scroll;
	height: 1000px;
}

@import
	url('https://fonts.googleapis.com/css?family=Shadows+Into+Light');

@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,600')
	;

.messageBoard nav {
	position: fixed;
	height: 60px;
	background-color: rgba(255, 255, 255, 1);
	top: 0;
	left: 0;
	width: 100%;
	z-index: 999;
	display: flex;
	flex-flow: row-reverse;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.messageBoard nav a {
	display: block;
	line-height: 60px;
	flex: 0 0 auto;
	border-left: 1px solid #aad3e8;
	padding: 0 20px;
	box-sizing: border-box;
}

.messageBoard h1 {
	font-family: "Shadows Into Light";
	font-size: 36px;
	text-align: center;
	color: white;
	text-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	margin-top: 100px;
}

.messageBoard div.bubbleContainer {
	padding-top: 50px;
	position: relative;
	width: 60vw;
	height: 250px;
	/*  margin: 50px auto 0; */
}

.messageBoard div.bubbleContainer div.bubbleBody, div.bubbleContainer::after
	{
	position: absolute;
}

.messageBoard div.bubbleContainer div.bubbleBody {
	margin-left: 100px;
	width: 500px;
	height: 200px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.messageBoard div.bubbleContainer div.bubbleBody form {
	padding: 30px;
	box-sizing: border-box;
}

.messageBoard div.bubbleContainer div.bubbleBody form * {
	display: block;
	width: 100%;
	border: none;
	outline: none;
	font-size: 20px;
	color: #0d3544;
	padding: 10px;
	box-sizing: border-box;
}

.messageBoard div.bubbleContainer div.bubbleBody form input {
	height: 50px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.3);
}

.messageBoard div.bubbleContainer div.bubbleBody form textarea {
	height: 100px;
	resize: none;
}

.messageBoard div.bubbleContainer::after {
	content: "";
	width: 0px;
	height: 0px;
	top: 250px;
	left: 150px;
	border-left: 30px solid transparent;
	border-right: 30px solid transparent;
	border-top: 30px solid white;
}

.messageBoard button.btnSendMessage {
	width: 70px;
	height: 40px;
	display: block;
	margin: 0 auto;
	margin-right: 20px;
	background-color: ＃f2f2f2;
	border: 3px solid white;
	outline: none;
	border-radius: 12px;
	font-size: 20px;
	font-family: "Shadows Into Light";
	color: white;
}

.messageBoard ul.messageList {
	width: 80vw;
	margin: 50px auto;
	font-family: "Open Sans";
}

.messageBoard ul.messageList li.message {
	list-style: none;
	width: 600px;
	background-color: rgba(255, 255, 255, 1);
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	padding: 15px;
	box-sizing: border-box;
	margin: 5px;
}

.messageBoard ul.messageList li.message p.messageTitle {
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 5px;
}

.messageBoard ul.messageList li.message p.messageContent {
	line-height: 24px;
}

.messageBoard ul.messageList li.message p.messageDate {
	text-align: right;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		if ("${subscriptionPermission}" == 0) {
			if("${payAmount}"==0){
				document.getElementById('check_sub').style.display = 'none'
				document.getElementById('hide_alreadysub_btn').style.display = 'none';	
				}else{
			document.getElementById('need_to_sub').innerHTML = "未訂閱此頻道，請訂閱";
			document.getElementById('hide_alreadysub_btn').style.display = 'none';
				}
		} else if ("${LoginOK.getMemberId()}" == "${thisPodcasterId}") {
			document.getElementById('hide_alreadysub_btn').innerHTML = "本人頻道";
			document.getElementById('hide_alreadysub_btn').className = "btn btn-success";
			document.getElementById('d1').style.display = '';
			document.getElementById('check_sub').style.display = 'none';
			document.getElementById('d2').style.display = 'none';	
		} else {
			document.getElementById('d1').style.display = '';
			document.getElementById('check_sub').style.display = 'none';
			document.getElementById('d2').style.display = 'none';
		}
	}
</script>
<title>頻道首頁</title>
</head>
<body>
	<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />

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
				<div>
					<span id='need_to_sub'></span>
					<button id="hide_alreadysub_btn" type="button" class="btn btn-info"
						style="display: '';">已訂閱</button>					
						<button id='check_sub' type="button" class="btn btn-danger"
							data-toggle="modal" data-target="#exampleModal">訂閱</button>				
				</div>
			</div>
		</div>

		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">即將離開頁面進入付費....</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="pay_free" class="modal-body">訂閱本頻道每月需支付${payAmount}元</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
						<button id="btn_gotopay" type="button" class="btn btn-primary"
							onclick="location.href='<c:url value="/AfterSubProgram.controller" />'">確定前往付費
							</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div class="messageBoard">
					<div class="bubbleContainer">
						<div class="bubbleBody">
							<form id="message" action="podcastPage.do" method="post"
								name="comment">
								<textarea name="formMessage" id="content"
									placeholder="留言內容：&#13;&#10;請輸入不超過50個字"></textarea>
							</form>
							<span class="submit"> <input id="podcasterId"
								type="hidden" value="${thisPodcasterId}" />
								<button id="submitBtn" class="btnSendMessage" type="button"
									form="message">提交</button>
							</span>
						</div>
					</div>
					<ul class="messageList" id="messageList">
						<c:forEach items="${commList}" var="comment" varStatus="tagStatus">
							<li class="message">
								<p class="messageTitle">${comment.Name}</p>
								<p class="messageContent">${comment.commentMsg}</p>
								<p class="messageDate">${comment.msgDate}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-md-6">

				<div class="podcastList">
					<div>
						<h2 class="h2">節目列表</h2>
						<div class="container2">
							<c:forEach var="podcast" items="${PodcastData}">
								<div class="card-media">
									<!-- media container -->
									<div class="card-media-object-container">
										<div class="card-media-object">
											<img class="podcastImg" src="${podcast.getAudioImg()}">
										</div>
									</div>
									<!-- body container -->
									<div class="card-media-body">
										<div class="card-media-body-top">
											<span class="subtle">${podcast.getTitle()}</span>
											<div class="card-media-body-top-icons u-float-right">
												<svg fill="#888888" height="16" viewBox="0 0 24 24"
													width="16" xmlns="http://www.w3.org/2000/svg">
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
										<span class="card-media-body-heading">${podcast.getPodcastInfo()}</span>
										<div class="card-media-body-supporting-bottom">
											<span class="card-media-body-supporting-bottom-text subtle">${podcast.getUploadTime()}</span>
											<span
												class="card-media-body-supporting-bottom-text subtle u-float-right">點擊率${podcast.getClickAmount()}</span>
										</div>
										<div
											class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
											<span class="card-media-body-supporting-bottom-text subtle">${podcast.getCategoryName()}</span>
											<a id="${podcast.getPodcastId()}"
												class="card-media-body-supporting-bottom-text card-media-link u-float-right playlist-number">加到播放列表</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="podcastList2">

					<div id="d1" style="display: none">
						<div>
							<c:forEach var="alreadySub" items="${subProgram}">
								<div class="card-media">
									<!-- media container -->
									<div class="card-media-object-container">
										<div class="card-media-object">
											<img class="podcastImg" src="${alreadySub.getAudioimg()}">
										</div>
									</div>
									<!-- body container -->
									<div class="card-media-body">
										<div class="card-media-body-top">
											<span class="subtle">${alreadySub.getTitle()}</span>
											<div class="card-media-body-top-icons u-float-right">
												<svg fill="#888888" height="16" viewBox="0 0 24 24"
													width="16" xmlns="http://www.w3.org/2000/svg">
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
										<span class="card-media-body-heading">${alreadySub.getPodcastInfo()}</span>
										<div class="card-media-body-supporting-bottom">
											<span class="card-media-body-supporting-bottom-text subtle">${alreadySub.getUploadTime()}</span>
											<span
												class="card-media-body-supporting-bottom-text subtle u-float-right">點擊率${alreadySub.getClickAmount()}</span>
										</div>
										<div
											class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
											<span class="card-media-body-supporting-bottom-text subtle">${data.getCategoryName()}</span>
											<a id="${alreadySub.getPodcastId()}"
												class="card-media-body-supporting-bottom-text card-media-link u-float-right playlist-number">加到播放列表</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div id="d2" style="display: ''">
						<div>
							<c:forEach var="unalreadySub" items="${subProgram}">
								<div class="card-media">
									<!-- media container -->
									<div class="card-media-object-container">
										<div class="card-media-object">
											<img class="podcastImg" src="${unalreadySub.getAudioimg()}">
										</div>
										<%-- 								<span class="card-media-object-tag subtle">${bymemberid.getPodcastInfo()}</span> --%>

									</div>
									<!-- body container -->
									<div class="card-media-body">
										<div class="card-media-body-top">
											<span class="subtle">${unalreadySub.getTitle()}</span>
											<div class="card-media-body-top-icons u-float-right">
												<svg fill="#888888" height="16" viewBox="0 0 24 24"
													width="16" xmlns="http://www.w3.org/2000/svg">
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
										<span class="card-media-body-heading">${unalreadySub.getPodcastInfo()}</span>
										<div class="card-media-body-supporting-bottom">
											<span class="card-media-body-supporting-bottom-text subtle">${unalreadySub.getUploadTime()}</span>
											<span
												class="card-media-body-supporting-bottom-text subtle u-float-right">點擊率${unalreadySub.getClickAmount()}</span>
										</div>
										<div
											class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
											<span class="card-media-body-supporting-bottom-text subtle">${data.getCategoryName()}</span>
											<a id="${unalreadySub.getPodcastId()}"
												class="card-media-body-supporting-bottom-text card-media-link u-float-right ">需訂閱才能收聽</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="playbar">
		<jsp:include page="../playerbar.jsp" flush="true " />
	</div>

	<script type="text/javascript">
		$(function() {
			$('#myTab li:eq(1) a').tab('show');
		});

		function delConfirm(clicked_name) {

			var r = confirm("確定要刪除此留言?")
			if (r == true) {

				console.log(clicked_name);
				document.getElementById(clicked_name).submit();

			} else {

			}
		}

		document.getElementById("submitBtn").onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/podcastPage.do'/>", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			var content = document.getElementById("content").value;
			/* var PId = document.getElementById("PId").value; */
			var podcasterId = document.getElementById("podcasterId").value;
			console.log(content);
			/* xhr.send("content=" + content + "&PId=" + PId); */
			xhr.send("content=" + content + "&PId=" + podcasterId);
			console.log(content);

			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					console.log("get data");
					console.log(xhr.responseText);
					var cbean = JSON.parse(xhr.responseText);
					console.log(cbean.commentMsg);
					/* var ctable = document.getElementById("ctable");*/
					var messageList = document.getElementById("messageList");
					var m = new Date(cbean.msgDate);
					console.log(cbean.msgDate);
					console.log(m);
					//下面兩行有問題尚未解決
					/* var newMsg = "<tr class='d3'><td width='240'>"
							+ cbean.commentMsg
							+ "</td><td width='80' align='center' style='color:gray'>"
							+ cbean.memberId
							+ "</td><td width='80' align='center' style='color:gray'>"
							+ cbean.msgDate + "</td></tr>"; */
					var newMsg = "<li class='message'><p class='messageTitle'>"
							+ cbean.Name + "</p><p class='messageContent'>"
							+ cbean.commentMsg + "</p><p class='messageDate'>"
							+ cbean.msgDate + "</p></li>";

					messageList.innerHTML = newMsg + messageList.innerHTML;
					var content = document.getElementById("content").value;
					content = "";
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