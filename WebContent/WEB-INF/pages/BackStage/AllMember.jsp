<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Member</title>

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

		<h3 class="center">All Member</h3>
		<br>
		<div>
			<table class="center" class="center">
				<tr>
					<th>MemberId</th>
					<th>Account</th>
					<th>Name</th>
					<th>NickName</th>
					<th>Email</th>
					<th>CellPhone</th>
					<th>Sex</th>
					<th>Role</th>
				</tr>
				<c:forEach items="${allMemberList}" var="member" varStatus="tagStatus">
					<tr>
						<td>${member.memberId}</td>
						<td>${member.account}</td>
						<td>${member.name}</td>
						<td>${member.nickname}</td>
						<td>${member.email}</td>
						<td>${member.cellphone}</td>
						<td>${member.sex}</td>
						<td>${member.role}</td>
					</tr>
				</c:forEach>
			</table>
			

		</div>

		<form class="center">
			<input type="button" value="CLOSE" style="margin-top: 50px;margin-bottom:50px;"
				class="btn btn-danger" onclick=window.close()>
		</form>

	</div>

</body>
</html>