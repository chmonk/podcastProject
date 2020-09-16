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
	td{
		width: 100px;
		text-align: center;
		border:1px solid;
	}
	
	table{
		border:3px solid;
		border-collapse: collapse;
	}
	
	th{
		width:100px;
		text-align: center;
		border:1px solid;
		
	}
	
	.center {
		margin:0px auto;
		text-align:center;
		
	}
	 
	 
	 
</style>

</head>
<body>
<div style="margin-top: 50px">
<h3 class="center">${PodcastResult}</h3><br>
<div>
<table  class="center" >
<tr><th>PodcastId</th><th>Title</th><th>CategoryId</th><th>MemberId</th><th>PodcastInfo</th><th>OpenPayment</th><th>OpenComment</th><th>UploadTime</th><th>ClickAmount</th><th>AudioPath</th><th>AudioImg</th><th>LikesCount</th></tr>
<c:forEach items="${uList}" var="podcast" varStatus="tagStatus">
	<tr>
	<td>${podcast.podcastId}</td>
	<td>${podcast.title}</td>
	<td>${podcast.categoryId}</td>
	<td>${podcast.memberId}</td>
	<td>${podcast.podcastInfo}</td>
	<td>${podcast.openPayment}</td>
	<td>${podcast.openComment}</td>
	<td>${podcast.uploadTime}</td>
	<td>${podcast.clickAmount}</td>
	<td>${podcast.audioPath}</td>
	<td>${podcast.audioimg}</td>
	<td>${podcast.likesCount}</td>

	
	</tr>
</c:forEach>
</table>
</div>
<form  action="<c:url value="/BackToSelect.controller"/>" class="center">
	<input type="submit" value="BACK" style="margin-top: 50px">
</form>
</div>
</body>
</html>