<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="AnchiaoChang">
<title>Document</title>
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
		<legend>新增活動</legend>
			
		<form:form action="addActivityProcess" method="POST" modelAttribute="ActivityBean" enctype="multipart/form-data">				
			<div class="div1">
			<form:label path="activityName" for="" class="l1" >活動名稱:</form:label>
			<form:input path="activityName"/>
			<div class="notice"></div>
			</div>

			<div class="div1">
				<form:label path="activityDate" for="" class="l1">日期:</form:label>
			    <form:input path="activityDate" placeholder="2020-10-07"/>
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>
			
			<div class="div1">
				<form:label path="activityTime" for="" class="l1">時間:</form:label>
			    <form:input path="activityTime" placeholder="06:30 pm"/>
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
			<form:label path="activityLocation" for="" class="l1">地點:</form:label>
			<form:input path="activityLocation" placeholder="新竹市"/>
			<span id="idsp1"></span>
			<div class="notice"></div>
			</div>

			<div class="div1">
			<form:label path="activityContent" for="" class="l1">活動內容:</form:label>
			<form:textarea path="activityContent"/>
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>
			
			<div class="div1">
			<form:label path="activityPrice" for="" class="l1">票券價格:</form:label>
			<form:input path="activityPrice" placeholder="350"/>
			<span id="idsp1"></span>
			<div class="notice"></div>
			</div>
			
			<div class="div1">
			<form:label path="activityMaxPeople" for="" class="l1">人數上限:</form:label>
			<form:input path="activityMaxPeople" placeholder="100"/>
			<span id="idsp1"></span>
			<div class="notice"></div>
			</div>
			
			<div class="div1">
			<label for="" class="l1">活動狀態:</label>
			<input type=radio name="radio" value=0 />公開
			<input type=radio name="radio" value=1 />關閉 
			<span id="idsp1"></span>
			<div class="notice"></div>
			</div>
			
				<div class="div1">
				<label for="" class="l1">活動照片:</label> 
				<input type="file" name="file" size="40">
				<div class="notice"></div>
			</div>

			<div class="div2">
				<input type="submit" value="送出"> 
				<input type="reset" value="清除">
			</div>
			</form:form>
		
	</fieldset>





</body>

</html>