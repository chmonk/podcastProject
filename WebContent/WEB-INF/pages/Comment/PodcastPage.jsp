<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>




<head>
<meta charset="UTF-8">
<title>頻道頁面</title>

<!-- Description, Keywords and Author -->
<meta name="description" content="Your description">
<meta name="keywords" content="Your,Keywords">
<meta name="author" content="HimanshuGupta">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Styles -->
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Animate CSS -->
<link href="css/animate.min.css" rel="stylesheet">
<!-- Basic stylesheet -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- Font awesome CSS -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-color.css" rel="stylesheet">
<!-- player bar css -->
<link href="css/playerbar.css" rel="stylesheet">
<!-- player bar icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Favicon -->
<link rel="shortcut icon" href="img/logo/favicon.ico">

</head>
<style>
 @import url(https://fonts.googleapis.com/css?family=Montserrat:400,700); 

/* html{    background:url(http://thekitemap.com/images/feedback-img.jpg) no-repeat; */
/*   background-size: cover; */
/*   height:100%; */
/* } */

/* #feedback-page{ */
/* 	text-align:center; */
/* } */

/* #form-main{ */
/* 	width:100%; */
/* 	float:left; */
/* 	padding-top:0px; */
/* } */

#form-div {
	background-color:rgba(72,72,72,0.4);
	padding-left:35px;
	padding-right:35px;
	padding-top:35px;
	padding-bottom:35px;
	width: 250px;
  margin-top:35px;
  -moz-border-radius: 7px;
  -webkit-border-radius: 7px;
}

.feedback-input {
	color:#3c3c3c;
 	font-family: Helvetica, Arial, sans-serif; 
   font-weight:500; 
	font-size: 16px;
	border-radius: 0;
	background-color: #fbfbfb;
	padding: 5px 5px 5px 5px;
	margin-bottom: 10px;
	width:100%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
  border: 3px solid rgba(0,0,0,0);
}

.feedback-input:focus{
	background: #fff;
	box-shadow: 0;
	border: 3px solid #3498db;
	color: #3498db;
	outline: none;
  padding: 5px 5px 5px 5px;
}

.focused{
	color:#30aed6;
	border:#30aed6 solid 3px;
}

/* Icons ---------------------------------- */

 #content{ 
 	background-image: url(http://rexkirby.com/kirbyandson/images/comment.svg); 
 	background-size: 30px 30px; 
 	background-position: 11px 8px; 
 	background-repeat: no-repeat; 
 } 

textarea {
    width: 100%;
    height: 150px;
    line-height: 150%;
    resize:vertical;
}

input:hover, textarea:hover,
input:focus, textarea:focus {
	background-color:white;
}

#submitBtn{
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	float:left;
	width: 100%;
	border: #fbfbfb solid 4px;
	cursor:pointer;
	background-color: #3498db;
	color:white;
	font-size:15px;
	padding-top:10px;
	padding-bottom:10px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
  margin-top:-4px;
  font-weight:700;
}

#submitBtn:hover{
	background-color: white;
	color: #0493bd;
}
	
.submit:hover {
	color: #3498db;
}
	
 .ease { 
 	width: 0px; 
 	height: 74px; 
 	background-color: #fbfbfb; 
 	-webkit-transition: .3s ease; 
 	-moz-transition: .3s ease; 
 	-o-transition: .3s ease; 
 	-ms-transition: .3s ease; 
 	transition: .3s ease; 
 } 

 .submit:hover .ease{ 
   width:100%; 
   background-color:white; 
 } 

/* @media only screen and (max-width: 580px) { */
/* 	#form-div{ */
/* 		left: 3%; */
/* 		margin-right: 3%; */
/* 		width: 88%; */
/* 		margin-left: 0; */
/* 		padding-left: 3%; */
/* 		padding-right: 3%; */
/* 	} */
/* } */
.d2 {
	width: 500px;
	height: 500px;
	overflow-y: scroll;
	overflow-x: none;
}
#onetable{
/* background-color: red; */
border: solid 3px black;
padding: 10px 10px 10px 10px; 
}
.d3{
border-bottom: dashed 2px #D0D0D0;
}



</style>



<body>
	<div id="form-div">
		<form action="podcastPage.do" method="post" name="comment" class="form" id="form1">
			<table >
				<tr class="text">
					<td><textarea name="text" class="validate[required,length[6,300]] feedback-input" id="content" cols="40" placeholder="留言內容：&#13;&#10;請輸入不超過50個字" maxlength="50"></textarea></td>
<!-- 					<textarea id="content" rows="5" cols="40" -->
<!-- 							placeholder="請輸入不超過50個字" maxlength="50"></textarea></td> -->
				</tr>
				<tr>
					<td class="submit">
					<input type="hidden" id="PId" value=${thisPodcasterId}>   
					<input id="submitBtn" type="button" value=" 提交 " >
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<div class="d2">
		<form >
			
			<table  width="400">
				<tbody id="ctable">
					<c:forEach items="${commList}" var="comment" varStatus="tagStatus">
						<tr class="d3">
							<td width="260">${comment.commentMsg}</td>
							<td width="40" align="center" style="color:gray">${comment.memberId}</td>
							<td width="100" align="center" style="color:gray">${comment.msgDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</form>
	</div>
					<!-- 				<td><input type="button" name="delete" value="刪除" onclick="location='http://localhost:8080/SpringWebProject/processDeleteComment'"></td></tr> -->
					<%-- 				<td><form id="${comment.commentId}" action="<c:url value="/processDeleteComment"/>"  method="POST"> --%>
					<!-- 				<input type="hidden" name="delCommId" value=${comment.commentId}>  -->
					<%-- 				<input type="button" value="刪除" onclick="delConfirm(this.name)" name="${comment.commentId}"></form></td> --%>
<div class="col-md-6 col-sm-6">
<!-- play list -->
<c:forEach items="${upList}" var="podcast" varStatus="status">
		<div class="playlist-content">
			<ul class="list-unstyled">
				<li class="playlist-number">
					<!-- song information -->
					<div class="song-info">
						<!-- song title -->
						<h4>${podcast.title}</h4>
					</div> <!-- music icon -->
					<div class="music-icon">
						<a href="#"><i class="fa fa-play"></i></a> <a href="#"><i
							class="fa fa-pause"></i></a>
					</div>
					<div class="clearfix"></div>
				</li>
			</ul>
		</div>
	</c:forEach>
	</div>
<script type="text/javascript">
		function delConfirm(clicked_name) {

			var r = confirm("確定要刪除此留言?")
			if (r == true) {

				console.log(clicked_name);
				document.getElementById(clicked_name).submit();

			} else {

			}
		}

		var flag= false;

		document.getElementById("submitBtn").onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/podcastPage.do'/>", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			var content = document.getElementById("content").value;
			var PId=document.getElementById("PId").value;
			console.log(content);
			xhr.send("content=" + content+"&PId="+PId);
			console.log(content);

			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					console.log("get data");
					console.log(xhr.responseText);
					var cbean = JSON.parse(xhr.responseText);
					console.log(cbean.commentMsg);
					var ctable = document.getElementById("ctable");

					

					//下面兩行有問題尚未解決
					var newMsg = "<tr class='d3'><td width='240'>" + cbean.commentMsg
							+ "</td><td width='80' align='center' style='color:gray'>" + cbean.memberId
							+ "</td><td width='80' align='center' style='color:gray'>" + cbean.msgDate
							+ "</td></tr>";
					
				ctable.innerHTML+=newMsg;

				flag=true;
				}
			}		
		}
</script>
	

	<!-- Javascript files -->
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- Bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>
	<!-- WayPoints JS -->
	<script src="js/waypoints.min.js"></script>
	<!-- Include js plugin -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- One Page Nav -->
	<script src="js/jquery.nav.js"></script>
	<!-- Respond JS for IE8 -->
	<script src="js/respond.min.js"></script>
	<!-- HTML5 Support for IE -->
	<script src="js/html5shiv.js"></script>
	<!-- Custom JS -->
	<script src="js/custom.js"></script>
	<!-- 	plaer bar function js -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="js/player.js"></script>
</body>
</html>