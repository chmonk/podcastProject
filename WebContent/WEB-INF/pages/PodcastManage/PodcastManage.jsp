<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理頻道頁面</title>

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


</head>


<body>

	<jsp:include page="../header_banner.jsp" flush="true " />


	<Input type="button" name="add" value="新增單集"
		onclick="location='http://localhost:8080/SpringWebProject/addPodcast'">
	<table border=1>
		<tr>
			<th>播客ID</th>
			<th>單集編號</th>
			<th>單集名稱</th>
			<th>上傳日期</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<c:forEach items="${upList}" var="podcast" varStatus="status">



			<tr>
				<td>${podcast.memberId}</td>
				<td>${podcast.podcastId}</td>
				<td>${podcast.title}</td>
				<td>${podcast.uploadTime}</td>
				<td><form action="<c:url value="/modifyPodcast"/>">
						<input type="hidden" name="thisPodcastId"
							value=${podcast.podcastId}> <input type="submit"
							name="modify" value="修改">
					</form></td>
				<td><form id="${podcast.podcastId}"
						action="<c:url value="/processDeletePodcast"/>" method="POST">
						<input type="hidden" name="delPodcastId" value=${podcast.podcastId}>
						<input type="button" value="刪除" onclick="delConfirm(this.name)"
							name="${podcast.podcastId}">
					</form></td>
		</c:forEach>
	</table>

	<script type="text/javascript">
		function delConfirm(clicked_name) {

			var r = confirm("確定要刪除此podcast?")
			if (r == true) {

				console.log(clicked_name);
				document.getElementById(clicked_name).submit();

			} else {

			}
		}
	</script>
	
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
	
	
	<jsp:include page="../playerbar.jsp" flush="true " />
	
	
	<!--playerbar end -->
	

</body>
</html>