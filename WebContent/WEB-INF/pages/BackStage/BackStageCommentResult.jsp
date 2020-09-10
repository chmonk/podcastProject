<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Comment Result</title>
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
<h3>BackStage ProgramComment Result</h3>
<div>
<h3 style="color: red">${deleteCommentMsg}  ${deletedCommentId} </h3>
<h3  style="color: red">${deleteCommentByMemberMsg}</h3>
<table>
<tr><th>CommentId</th><th>CommentMsg</th><th>MemberId</th><th>PodcasterId</th><th>MsgStatus</th><th>MsgDate</th></tr>
<c:forEach items="${pList}" var="comment" varStatus="tagStatus">
	<tr>
	<td>${comment.commentId}</td>
	<td>${comment.commentMsg}</td>
	<td>${comment.memberId}</td>
	<td>${comment.podcasterId}</td>
	<td>${comment.msgStatus}</td>
	<td>${comment.msgDate}</td>
	</tr>
</c:forEach>
</table>
</div>
<form  action="<c:url value="/BackToSelect.controller"/>">
	<input type="submit" value="BACK" style="margin-top: 50px">
</form>


</body>
</html>