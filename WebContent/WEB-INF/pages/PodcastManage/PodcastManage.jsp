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
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-color.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css' />">
<style type="text/css">
    body {
        background-color:#f7f7f7!important;
/*             background-image: url(<c:url value='/img/banner/b3.jpg' />); */
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
        table{
table-layout: fixed;}
        th,
        tr {
            text-align: center;
            background-color: white;
        }
        h1 {
            color: white;
        }
             .showPodcasterBody {
	padding-top: 40px;
	padding-bottom: 40px;
}

.showPodcasterBodyHeader {
	padding-top: 50px;
	/* 	border-bottom: 1px solid black;  */
}

    h2 {
    	margin: 10%;
    	text-align:center;
	margin-bottom:10px;
        display: inline;
    }
    .headtop{
	margin-top:120px;
	margin-bottom:20px;
}
</style>
</head>

<body>
<div class="head">
		<jsp:include page="../header_banner_test.jsp" flush="true " />
	</div>
		<div class="default-heading headtop">
		<h2 >頻道管理</h2></div>
	
<div class="container">
        <div class="row col-md-10 col-md-offset-1 custyle">
            <table class="table table-striped custab">
                <thead>
                    <a href="<c:url value='/addPodcast' />" class="btn btn-primary btn-md pull-right">+新增單集</a>
                    <br>
                    <tr><td colspan="5">${LoginOK.name}的頻道列表</td></tr>
                    <tr>
                    	<th>單集圖像</th>
                        <th class="name">單集名稱</th>
                        <th>上傳日期</th>
                        <th>修改</th>
                        <th class="text-center">刪除</th>
                    </tr>
                </thead>
                <c:forEach var="podcast" varStatus="loop" items="${upList}">
                <tr>
                	<td><img width="110%" src="<c:url value='${podcast.audioimg}' />"></td>
                	<td   width="110px">${podcast.title}</td>
                	<td   width="110px">${podcast.uploadTime}</td>
                	<td   width="110px"><form action="<c:url value="/modifyPodcast"/>"><input type="hidden" name="thisPodcastId" value=${podcast.podcastId}>
                		<input class="btn btn-warning" type="submit" name="modify" value="修改" ></form></td>
                	<td><form id="${podcast.podcastId}" action="<c:url value="/processDeletePodcast"/>"  method="POST">
						<input type="hidden" name="delPodcastId" value=${podcast.podcastId}> 
						<input class="btn btn-danger" type="button" value="刪除" onclick="delConfirm(this.name)" name="${podcast.podcastId}"></form></td>
                </tr>
</c:forEach>
                <tr height='36' id='borderA'>
                    <td id='borderA' align="center" colspan="5">
                       <a class="btn btn-primary" href="<c:url value='/' />">回首頁</a>
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