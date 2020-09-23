<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Category Result</title>

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

th {
	background-color: #3A3A3A;
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
}

.center {
	margin: 0px auto;
	text-align: center;
}
	
</style>
</head>
<body id="body">
<div style="margin-top: 50px">
<h3 class="center">${SetNewCatSuccessMsg}</h3><br>
<h3 class="center">${UpdateSuccessMsg}</h3><br>
<div>
<table class="center">
<tr><th>CategoryId</th><th>CategoryName</th></tr>
<c:forEach items="${cList}" var="category" varStatus="tagStatus">
	<tr>
	<td>${category.categoryId}</td>
	<td>${category.categoryName}</td>
	
	</tr>
</c:forEach>
</table>
</div>
<form class="center" action="<c:url value="/BackToSelect.controller"/>">
	<input type="submit" value="BACK" style="margin-top: 50px" class="btn btn-warning">
</form>
</div>
</body>
</html>