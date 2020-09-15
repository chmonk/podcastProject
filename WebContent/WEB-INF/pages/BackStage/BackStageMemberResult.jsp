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
	
		.center{
		margin:0px auto;
		text-align:center;
		
	}
</style>
</head>
<body>
<div style="margin-top: 50px">

<h3 class="center">BackStage Member Result</h3><br>
<h3 style="color: red" class="center">${memberDeleteMsg}</h3>
<div>
<table  class="center" class="center">
<tr><th>MemberId</th><th>Account</th><th>Password</th><th>Name</th><th>NickName</th><th>Birthday</th>
	<th>RegisterDate</th><th>Info</th><th>Email</th><th>CellPhone</th><th>Address</th><th>Sex</th>
	<th>Image</th><th>Role</th><th>CreditCardNumber</th><th>BankAccount</th><th>MonthlyPayment</th>
</tr>
<c:forEach items="${mList}" var="member" varStatus="tagStatus">
	<tr>
	<td>${member.memberId}</td>
	<td>${member.account}</td>
	<td>${member.password}</td>
	<td>${member.name}</td>
	<td>${member.nickname}</td>
	<td>${member.birthday}</td>
	<td>${member.registerDate}</td>
	<td>${member.info}</td>
	<td>${member.email}</td>
	<td>${member.cellphone}</td>
	<td>${member.address}</td>
	<td>${member.sex}</td>
	<td>${member.image}</td>
	<td>${member.role}</td>
	<td>${member.creditCardNumber}</td>
	<td>${member.bankAccount}</td>
	<td>${member.monthlyPayment}</td>
	</tr>
</c:forEach>
</table>
</div>

<form  class="center" action="<c:url value="/BackToSelect.controller"/>">
	<input type="submit" value="BACK" style="margin-top: 50px">
</form>

</div>


</body>
</html>