<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理活動頁面</title>
</head>

<body>

<Input type="button" name="add" value="新增活動" onclick="location='http://localhost:8080/SpringWebProject/addActivityForm'">
<table border=1>
<tr><th>${LoginOK.name}的活動列表</th><th>日期</th><th>參加人數</th><th>刪除</th></tr>
<c:forEach var="alist" varStatus="stat" items="${ActivityList}">
<tr><td>${alist.activityName}</td><td>${alist.activityDate}</td>
<td>${alist.activityMaxPeople}</td><td><input type="button" value="刪除"><a href="<c:url value='/a' />"></a></td></tr>

</c:forEach>

		<tr height='36' id='borderA'>
			<td id='borderA' align="center" colspan="4"><a href="<c:url value='/a' />">回首頁</a></td>
		</tr>
		</table>
</body>
</html>