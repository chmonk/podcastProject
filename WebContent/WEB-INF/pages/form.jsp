<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">User System</h2>
	<form action="<c:url value="/hello.controller"/>" method="get">
		<table align="center">
			<tr>
				<td>UserName:</td>
				<td><input type="text" name="userName"></td>
				<td><font color="red"/>${err.name}</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="Send"></td>
			</tr>
		</table>

	</form>

</body>
</html>