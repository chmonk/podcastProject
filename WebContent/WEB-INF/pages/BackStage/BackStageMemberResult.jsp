<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Member Result</title>

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

		<h3 class="center">BackStage Member Result</h3>
		<br>
		<h3 style="color: red" class="center">${memberDeleteMsg}</h3>
		<div>
			
				<c:forEach items="${mList}" var="member" varStatus="tagStatus">
				<table class="center" class="center">
					<tr>
						<th>MemberId</th>
						<th colspan="2">Account</th>
						<!-- <th>Password</th> -->
						<th>Name</th>
						<th>NickName</th>
						<th>Birthday</th>
						<th>RegisterDate</th>
					</tr>
					<tr>
						<td rowspan="5">${member.memberId}</td>
						<td colspan="2">${member.account}</td>
						<%-- <td>${member.password}</td> --%>
						<td>${member.name}</td>
						<td>${member.nickname}</td>
						<td>${member.birthday}</td>
						<td>${member.registerDate}</td>
					</tr>
					<tr>
						<th colspan="2">Info</th>
						<th>Email</th>
						<th>CellPhone</th>
						<th colspan="2">Address</th>
					</tr>
					<tr>
						<td colspan="2">${member.info}</td>
						<td>${member.email}</td>
						<td>${member.cellphone}</td>
						<td colspan="2">${member.address}</td>
					</tr>
					<tr>
						<th>Sex</th>
						<th>Image</th>
						<th>Role</th>
						<th>CreditCardNumber</th>
						<th>BankAccount</th>
						<th>MonthlyPayment</th>
					</tr>
					<tr>
						<td>${member.sex}</td>
						<td>${member.image}</td>
						<td>${member.role}</td>
						<td>${member.creditCardNumber}</td>
						<td>${member.bankAccount}</td>
						<td>${member.monthlyPayment}</td>
					</tr>
					</table>
				</c:forEach>
			
		</div>

		<form class="center"
			action="<c:url value="/BackToSelect.controller"/>">
			<input type="submit" value="BACK" style="margin-top: 50px" class="btn btn-warning">
		</form>

	</div>


</body>
</html>