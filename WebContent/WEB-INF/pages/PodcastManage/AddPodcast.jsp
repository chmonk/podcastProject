<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="AnchiaoChang">
<title>新增單集</title>
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
		<legend>新增單集</legend>

		<form:form action="addPodcastProcess" method="POST"
			modelAttribute="uploadPodcastBean" enctype="multipart/form-data">
			<div class="div1">
				<form:label path="title" for="" class="l1">單集名稱:</form:label>
				<form:input path="title" />
				<div class="notice"></div>
			</div>


			<div class="div1">
				<form:label path="podcastInfo" for="" class="l1">單集簡介:</form:label>
				<form:textarea path="podcastInfo" />
				<span id="idsp2"></span>
				<div class="notice"></div>
			</div>

			<div class="div1">
				<label for="" class="l1">頻道類別:</label> 
				<select name="category" >
					<option value=1>喜劇娛樂</option>
					<option value=2>生活文化</option>
					<option value=3>男女話題</option>
					<option value=4>名人精選</option>
					<option value=5>健康運動</option>
					<option value=6>兒童家庭</option>
					<option value=7>男女話題</option>
					<option value=8>新聞社會</option>
					<option value=9>故事書籍</option>
					<option value=10>科學奇趣</option>
					<option value=11>宗教心靈</option>
					<option value=12>旅遊玩樂</option>
					<option value=13>時尚美容</option>
					<option value=14>科技趨勢</option>
					<option value=15>音樂藝術</option>
					<option value=16>教育學習</option>
					
				</select>
				<!-- <input type=select name="category" /> -->
				<span id="idsp1"></span>
				<div class="notice"></div>
			</div>

			

			<div class="div1">
				<label for="" class="l1">付費狀態:</label> <input type=radio
					name="openPayment" value=0 />免費 <input type=radio
					name="openPayment" value=1 />訂閱 <span id="idsp1"></span>
				<div class="notice"></div>
			</div>



			<div class="div1">
				<label for="" class="l1">上傳單集:</label> <input type="file"
					name="podcastfile" size="40">
				<div class="notice"></div>
			</div>

			<div class="div1">
				<label for="" class="l1">單集封面:</label> <input type="file"
					name="podcastpic" size="40">
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