<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Activity Result</title>

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
	border: 1px solid #3A3A3A;
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
	<div style="margin-top: 50px">
		<h3 class="center">${ActResult}</h3>
		<br>
		<div>

			<c:forEach items="${aList}" var="act" varStatus="tagStatus">
				<table class="center">
					<tr>
						<th>ActivityId</th>
						<th>ActivityName</th>
						<th>ActivityDate</th>
						<th colspan="4">ActivityContent</th>
						<th>ActivityLocation</th>
						
					</tr>
					<tr>
						<td rowspan="3">${act.activityId}</td>
						<td>${act.activityName}</td>
						<td>${act.activityDate}</td>
						<td colspan="4">${act.activityContent}</td>
						<td>${act.activityLocation}</td>
						
					</tr>
					<tr>
						<th>ActivityTime</th>
						<th>PodcasterId</th>
						<th>ActivityPrice</th>
						<th>ActivityMaxPeople</th>
						<th>Stock</th>
						<th>ActivityStatus</th>
						<th>ActivityImg</th>
					</tr>
					<tr>
						<td>${act.activityTime}</td>
						<td>${act.podcasterId}</td>
						<td>${act.activityPrice}</td>
						<td>${act.activityMaxPeople}</td>
						<td>${act.stock}</td>
						<td>${act.activityStatus}</td>
						<td>${act.activityImg}</td>

					</tr>
				</table>
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