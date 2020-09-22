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
.d2 {
	width: 500px;
	height: 500px;
	overflow-y: scroll;
	overflow-x: none;
}
/* .d3{ */

/* } */
</style>
<body>

	<div>
		<form action="podcastPage.do" method="post" name="comment">
			<table>
				<tr>
					<td>留言內容：</td>
					<td><textarea id="content" rows="5" cols="40"
							placeholder="請輸入不超過50個字" maxlength="50"></textarea></td>
				</tr>
				<tr>
					<td>
					<input type="hidden" id="PId" value=${thisPodcasterId}>   
					<input id="submitBtn" type="button" value=" 提交 ">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<div class="d2">
		<form>
			<table id="ctable" width="400">
				<c:forEach items="${commList}" var="comment" varStatus="tagStatus">
					<tr>
						<td width="240">${comment.commentMsg}</td>
						<td width="80">${comment.memberId}</td>
						<td width="80">${comment.msgDate}</td>
					</tr>
					<!-- 				<td><input type="button" name="delete" value="刪除" onclick="location='http://localhost:8080/SpringWebProject/processDeleteComment'"></td></tr> -->
					<%-- 				<td><form id="${comment.commentId}" action="<c:url value="/processDeleteComment"/>"  method="POST"> --%>
					<!-- 				<input type="hidden" name="delCommId" value=${comment.commentId}>  -->
					<%-- 				<input type="button" value="刪除" onclick="delConfirm(this.name)" name="${comment.commentId}"></form></td> --%>
				</c:forEach>

			</table>
			<hr>
		</form>
	</div>

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
<!--/ hero end -->




	<script type="text/javascript">
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
					var newMsg = "<tr><td width='240'>" + cbean.commentMsg
							+ "</td><td width='80'>" + cbean.memberId
							+ "</td><td width='80'>" + cbean.msgDate
							+ "</td></tr>";
				ctable.innerHTML+=newMsg;
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