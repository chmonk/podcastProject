<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>welcome to brosing History ${userid}</h4>

	<table border="2px" bordercolor="green">

		<c:forEach items="${history}" var="rownum" varStatus="status">
			<tr>
<%-- 				<td>${rownum.historyId}</td> --%>
<%-- 				<td>${rownum.podcastId}</td> --%>
				<td><img id="image-1" alt="" src="${program[status.index].audioimg}"/></td>
				<td>${rownum.podcastName}+${status.index}</td>
<%-- 				<td>${rownum.publisherId}</td> --%>
				<td>${author[status.index]}</td>
				<td>${rownum.lastListen}</td>
			
			</tr>
		</c:forEach>

	</table>


</body>
</html>