<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	border: 1px solid black;
}
.podcastImg{
	height: 50px;
	width: 50px;
}
</style>
</head>
<body>
<c:forEach var="data" items="${fuzzyUserData}">
	<p>${data.getNickname()}
	<p>${data.getMemberId()}
	<p>${data.getImage()}
	<p>${data.getName()}

</c:forEach>

	<!-- <div>
		<div class="podcastImg"></div>
		<div class="podcastName"></div>
	</div> -->

</body>
</html>