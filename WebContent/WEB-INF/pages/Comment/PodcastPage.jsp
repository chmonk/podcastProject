<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>頻道頁面</title>
</head>
<style>
.d2 {
	width: 500px;
	height: 500px;
	overflow-y: scroll;
	overflow-x: none;
}
</style>
<body>

	<Input type="button" name="modify" value="我的最愛"
		onclick="location='http://localhost:8080/SpringWebProject/...'">
	<br />
	<br />
	<div>
		<form action="podcastPage.do" method="post" name="comment">
			<table>
				<tr>
					<td>留言內容：</td>
					<td><textarea name="content" rows="5" cols="40"
							placeholder="請輸入不超過50個字" maxlength="50"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value=" 提交 "></td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<div class="d2">
		<form>
			<table width="400">
				<c:forEach items="${commList}" var="comment" varStatus="tagStatus">
					<tr>
						<td width="240">${comment.commentMsg}</td>
						<td width="80">${comment.memberId}</td>
						<td width="80">${comment.msgDate}</td>
					</tr>
				<td><input type="button" name="delete" value="刪除" onclick="location='http://localhost:8080/SpringWebProject/processDeleteComment'"></td></tr>
				</c:forEach>
			</table>
			<hr>
		</form>
	</div>
</body>
</html>