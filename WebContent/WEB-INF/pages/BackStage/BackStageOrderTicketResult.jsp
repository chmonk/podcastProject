<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage OrderTicket Result</title>
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
</style>
</head>
<body>
<h3>backStage OrderTicket Result</h3>
<div>
<table>
<tr><th>TicketOrderId</th><th>OrderDate</th><th>OrderPrice</th><th>MemberId</th><th>CreditCardNumber</th><th>ActivityId</th></tr>
<c:forEach items="${oList}" var="order" varStatus="tagStatus">
	<tr>
	<td>${order.ticketOrderId}</td>
	<td>${order.orderDate}</td>
	<td>${order.orderPrice}</td>
	<td>${order.memberId}</td>
	<td>${order.creditCardNumber}</td>
	<td>${order.activityId}</td>
	</tr>
</c:forEach>
</table>
</div>
<form  action="<c:url value="/BackToSelect.controller"/>">
	<input type="submit" value="BACK" style="margin-top: 50px">
</form>



</body>
</html>