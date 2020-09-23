<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage OrderTicket Result</title>

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
	max-width: 2px;
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

		<h3 class="center">BackStage OrderTicket Result</h3>
		<br>
		<div>
			<table class="center">
				<tr>
					<th>TicketOrderId</th>
					<th>OrderDate</th>
					<th>MemberId</th>
					<th>ActivityId</th>
					<th>OrderPrice</th>
					<th>ShippingAddress</th>
					<th>BNO</th>
					<th>InVoiceTitle</th>
					<th>TotalAmount</th>
				</tr>
				<c:forEach items="${oList}" var="order" varStatus="tagStatus">
					<tr>
						<td>${order.ticketOrderId}</td>
						<td>${order.orderDate}</td>
						<td>${order.memberId}</td>
						<td>${order.activityId}</td>
						<td>${order.orderPrice}</td>
						<td>${order.shippingAddress}</td>
						<td>${order.bno}</td>
						<td>${order.invoiceTitle}</td>
						<td>${order.totalAmount}</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
		<form class="center"
			action="<c:url value="/BackToSelect.controller"/>">
			<input type="submit" value="BACK" style="margin-top: 50px;margin-bottom: 50px"
				class="btn btn-warning">
		</form>


	</div>
</body>
</html>