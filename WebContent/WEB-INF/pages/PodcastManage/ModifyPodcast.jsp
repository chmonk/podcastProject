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
			
		<form:form action="......addActivityProcess" method="POST" modelAttribute="uploadPodcastBean" enctype="multipart/form-data">				
			<div class="div1">
				<form:label path="title" for="" class="l1" >單集名稱:</form:label>
				<form:input path="title"/>
				<div class="notice"></div>
			</div>


			<div class="div1">
				<form:label path="podcastInfo" for="" class="l1">單集簡介:</form:label>
			    <form:textarea path="podcastInfo"/>
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
			<label for="" class="l1">留言狀態:</label>
			<input type=radio name="radio" value=0 />關閉
			<input type=radio name="radio" value=1 />公開 
			<span id="idsp1"></span>
			<div class="notice"></div>
			</div>
			
			<div class="div1">
			<label for="" class="l1">付費狀態:</label>
			<input type=radio name="radio" value=0 />免費
			<input type=radio name="radio" value=1 />訂閱 
			<span id="idsp1"></span>
			<div class="notice"></div>
			</div>

			<div class="div2">
				<input type="submit" value="確認修改"> 
				<input type="reset" value="清除">
			</div>
			</form:form>
		
	</fieldset>





</body>

</html>