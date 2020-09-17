<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="AnchiaoChang">
<title>修改單集</title>
</head>
<style>
* {
	margin: 0 auto;
}

fieldset {
	width: 500px;
	border: 2px solid;
	border-radius: 15px;
	/* 	background-color: beige; */
}

.div1 {
	margin: 15px;
	border-bottom: 1px dashed grey;
}

.div2 {
	display: flex;
	justify-content: center;
	margin-bottom: 15px;
}

.div2 input {
	margin: 1px
}

.notice {
	font-size: 10px;
}

.wrong_contnet {
	color: red;
	font-size: small;
}

.right_contnet {
	color: green;
	font-size: small;
}
</style>

<body>
	<%
		String user = (String) request.getAttribute("user");
	%>
	${user}您好!

	<fieldset>
		<legend>修改單集</legend>
			
		<form:form id="podcastModifyForm" action="PodcastModifyProcess" method="POST" modelAttribute="uploadPodcastBean" enctype="multipart/form-data">				
				<input type="hidden" name="podcastId" value=${modifyPodcastId}>
			<div class="div1">
				<form:label path="title" for="" class="l1" >單集名稱:</form:label>
				<form:input path="title" id="title" />
				<div class="notice"></div>
			</div>


			<div class="div1">
				<form:label path="podcastInfo" for="" class="l1">單集簡介:</form:label>
			    <form:textarea path="podcastInfo" title="podcastInfo" />
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			
			<div class="div1">
			<label for="" class="l1">付費狀態:</label>
			<input id="radioP0" type=radio name="radioP" value=0 />免費
			<input id="radioP1" type=radio name="radioP" value=1 />訂閱 
			<span id="idsp1"></span>
			<div class="notice"></div>
			</div>

			<div class="div2">
				<input id="submitBtn" type="button" value="確認修改"> 
				<input id="clear" type="button" value="清除" >
			</div>
			</form:form>
		
	</fieldset>

<script>
window.onload=function(){

	var title="${uploadPodcastBean.title}";
	document.getElementById("title").value=title;
	
	var podcastInfo="${uploadPodcastBean.podcastInfo}";
	document.getElementById("podcastInfo").value=podcastInfo;
	

	var openPayment=${uploadPodcastBean.openPayment};
	document.getElementById("radioP"+openPayment).checked=true;
}

document.getElementById("clear").onclick = function() {clear()};
function clear(){
	document.getElementById("title").value="";
	document.getElementById("podcastInfo").value="";

	document.getElementById("radioP0").checked=true;
	document.getElementById("radioP1").checked=false;
	
}

document.getElementById("submitBtn").onclick = function() {check()};
function check(){

	var title=document.getElementById("title").value;
	var podcastInfo=document.getElementById("podcastInfo").value;
	
	if(!title || !podcastInfo){
		alert("請輸入內容")
	}else{
		document.getElementById("podcastModifyForm").submit();
	}	
}

</script>



</body>

</html>