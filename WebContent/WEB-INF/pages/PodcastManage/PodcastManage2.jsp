<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理頻道頁面</title>
</head>

<body>

<Input type="button" name="add" value="新增單集" onclick="location='http://localhost:8080/SpringWebProject/addPodcast'">
<table border=1>
<tr><th>播客ID</th><th>單集編號</th><th>單集名稱</th><th>上傳日期</th><th>修改</th><th>刪除</th></tr>
<c:forEach items="${upList}" var="podcast" varStatus="status">
	


	<tr><td>${podcast.memberId}</td><td>${podcast.podcastId}</td><td>${podcast.title}</td><td>${podcast.uploadTime}</td>
	<td><form action="<c:url value="/modifyPodcast"/>"><input type="hidden" name="thisPodcastId" value=${podcast.podcastId}> <input type="submit" name="modify" value="修改" ></form></td>
	<td><input type="button" name="delete" value="刪除" onclick="location='http://localhost:8080/SpringWebProject/processDeletePodcast'"></td></tr>
	
	

</c:forEach>
</table>


<script>

</script>

</body>
</html>