<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理頻道頁面</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
<style type="text/css">
    body {
            background-image: url(<c:url value='/img/banner/b4.jpg' />);
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .custab {
            border: 1px solid #ccc;
            padding: 5px;
            margin: 5% 0;
            box-shadow: 3px 3px 2px #ccc;
            transition: 0.5s;
        }
        .custab:hover {
            box-shadow: 3px 3px 0px transparent;
            transition: 0.5s;
        }
        .name {
            width: 300px;
        }
        th,
        tr {
            text-align: center;
            background-color: white;
        }
        h1 {
            color: white;
        }
</style>
</head>

<body>

<div class="container">
        <h1 style="text-align:center;">${LoginOK.name}的活動列表</h1><br>
        <div class="row col-md-6 col-md-offset-3 custyle">
            <table class="table table-striped custab">
                <thead>
                    <a href="<c:url value='/addPodcast' />" class="btn btn-primary btn-md pull-right">+新增單集</a>
                    <br>
                    <tr>
                        <th class="name">單集名稱</th>
                        <th>上傳日期</th>
                        <th>修改</th>
                        <th class="text-center">刪除</th>
                    </tr>
                </thead>
                <c:forEach var="podcast" varStatus="loop" items="${upList}">
                <tr>
                	<td>${podcast.title}</td><td>${podcast.uploadTime}</td>
                	<td><form action="<c:url value="/modifyPodcast"/>"><input type="hidden" name="thisPodcastId" value=${podcast.podcastId}>
                		<input type="submit" name="modify" value="修改" ></form></td>
                	<td><form id="${podcast.podcastId}" action="<c:url value="/processDeletePodcast"/>"  method="POST">
						<input type="hidden" name="delPodcastId" value=${podcast.podcastId}> 
						<input type="button" value="刪除" onclick="delConfirm(this.name)" name="${podcast.podcastId}"></form></td>
                </tr>
</c:forEach>
                <tr height='36' id='borderA'>
                    <td id='borderA' align="center" colspan="4">
                        <button type="button" class="btn btn-dark"><a href="<c:url value='/' />">回首頁</button>
                    </td>
                </tr>
            </table>
            <form>
		<input type="hidden" name="a" />
	</form>
        </div>
    </div>






<!-- <Input type="button" name="add" value="新增單集" onclick="location='http://localhost:8080/SpringWebProject/addPodcast'"> -->
<!-- <table border=1> -->
<!-- <tr><th>播客ID</th><th>單集編號</th><th>單集名稱</th><th>上傳日期</th><th>修改</th><th>刪除</th></tr> -->
<%-- <c:forEach items="${upList}" var="podcast" varStatus="status"> --%>
	


<%-- 	<tr><td>${podcast.memberId}</td><td>${podcast.podcastId}</td><td>${podcast.title}</td><td>${podcast.uploadTime}</td> --%>
<%-- 	<td><form action="<c:url value="/modifyPodcast"/>"><input type="hidden" name="thisPodcastId" value=${podcast.podcastId}> <input type="submit" name="modify" value="修改" ></form></td> --%>
<%-- 	<td><form id="${podcast.podcastId}" action="<c:url value="/processDeletePodcast"/>"  method="POST"> --%>
<!-- 	<input type="hidden" name="delPodcastId" value=${podcast.podcastId}>  -->
<%-- 	<input type="button" value="刪除" onclick="delConfirm(this.name)" name="${podcast.podcastId}"></form></td> --%>
	

<%-- </c:forEach> --%>
<!-- </table> -->

<script type="text/javascript">
function delConfirm(clicked_name){
	var r=confirm("確定要刪除此podcast?")
	if(r==true){
		
		console.log(clicked_name);
		document.getElementById(clicked_name).submit();
		
	}else{
		
	}
}
</script>

</body>
</html>