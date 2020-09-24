<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>頻道訂閱紀錄</h1>
<table border="1">
<thead>
<tr>
<th>頻道名稱</th>
<th>訂閱開始時間</th>
<th>訂閱結束時間</th>
<th>費用</th>
</tr>
</thead>
<c:forEach items="${subRecordList}" var="subRecord">
<tr><td>${subRecord.getReceipt()}</td>
<td>${subRecord.getSubdateStart()}</td>
<td>${subRecord.getSubdateEnd()}</td>
<td>${subRecord.getMonthlyPayment()}</td></tr>
</c:forEach>

</table>
</body>
</html>