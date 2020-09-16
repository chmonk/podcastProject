<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Login</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
td {
	width: 100px;
	text-align: center;
	border: 1px solid;
}

table {
	border: 3px solid;
	border-collapse: collapse;
}

th {
	width: 100px;
	text-align: center;
	border: 1px solid;
}

.center {
	margin: 0px auto;
	text-align: center;
}

div {
	margin-top: 50px;
}
</style>

</head>
<body>
	<div>
		<h3 class="center">BackStage Login</h3>
		<h5 class="center">(test123 / pass123)</h5>
	</div>
	<div>
		<form class="center" action="<c:url value="/BackStageLogin.controller"/>" method="POST">

		<table class="center" >
			<tr>
				<th>帳號:</th>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<th>密碼:</th>
				<td><input type="text" name="password"></td>
			</tr>

		</table>
		<br>
		 <input type="submit" value="send">${LoginErrorMsg}
		</form>
		<br>

	</div>
</body>
</html>