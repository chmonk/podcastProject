<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div  style="display:inline-block;">
		<form action="<c:url value="FuzzySelect.controller"/>" method="get">
			<input class="form-control-sm" type="text" name="selectCondition"/>
			<input class="form-control-sm" type="submit" value="Send">
		</form>
	</div>
</body>
</html>