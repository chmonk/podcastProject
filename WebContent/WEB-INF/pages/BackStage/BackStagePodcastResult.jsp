<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Podcast Result</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
#body {
	font-family: "Lato", sans-serif;
	color: white;
	background-color: #949494;
}

td {
	width: 100px;
	text-align: center;
	border: 2px solid #3A3A3A;
	
	word-wrap: break-word;
    max-width: 1px;
	
}

table {
	border: 3px solid #3A3A3A;
	border-collapse: collapse;
	
}

th {
	width: 100px;
	text-align: center;
	border: 1px solid #3A3A3A;
	background-color: #3A3A3A;
}

.center {
	margin: 0px auto;
	text-align: center;
}
</style>

</head>
<body id="body">
	<div style="margin-top: 50px;margin-bottom: 50px;">
		<h3 class="center">${PodcastResult}</h3>
		<br>
		<div >


			<c:forEach items="${uList}" var="podcast" varStatus="tagStatus">
				<table class="center">
					<tr>
						<th>PodcastId</th>
						<th>CategoryId</th>
						<th>Title</th>
						<th colspan="3">PodcastInfo</th>
					</tr>
					<tr>
						<td rowspan="5">${podcast.podcastId}</td>
						<td>${podcast.categoryId}</td>
						<td>${podcast.title}</td>
						<td colspan="3">${podcast.podcastInfo}</td>
					</tr>
					<tr>
						<th>MemberId</th>
						<th>UploadTime</th>
						<th>OpenPayment</th>
						<th>OpenComment</th>
						<th>LikesCount</th>
					</tr>

					<tr>
						<td>${podcast.memberId}</td>
						<td>${podcast.uploadTime}</td>
						<td>${podcast.openPayment}</td>
						<td>${podcast.openComment}</td>
						<td>${podcast.likesCount}</td>
					</tr>
					<tr>
						<th>ClickAmount</th>
						<th colspan="2">AudioPath</th>
						<th colspan="2">AudioImg</th>

					</tr>
					<tr>
						<td>${podcast.clickAmount}</td>
						<td colspan="2">${podcast.audioPath}</td>
						<td colspan="2">${podcast.audioimg}</td>
					</tr>
				</table>
				<br>
			</c:forEach>

		</div>
		<form action="<c:url value="/BackToSelect.controller"/>"
			class="center">
			<input type="submit" value="BACK" style="margin-top: 50px"
				class="btn btn-warning">
		</form>
	</div>
</body>
</html>