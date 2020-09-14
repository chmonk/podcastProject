<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Comment Result</title>

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
<h3 class="center">BackStage ProgramComment Result</h3><br>
<div>
<h3 class="center" style="color: red">${deleteCommentMsg}  ${deletedCommentId} </h3>
<h3 class="center"  style="color: red">${deleteCommentByMemberMsg}</h3>
<table class="center" >
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
</div >
<form class="center" action="<c:url value="/BackToSelect.controller"/>">
	<input type="submit" value="BACK" style="margin-top: 50px">
</form>
</div>

</body>
</html>