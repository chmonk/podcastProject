<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>

	<h2 align="center">節目上傳</h2>

	<div align="center">


		<form action="<c:url value='/uploadpc'/>" method="post"
			enctype="multipart/form-data">

			<Table
				style="width: 900px; background-color: #E7CDFF; cellspacing: 0; border: 2px solid black;">

				<tr height="40">
					<td colspan='4' style="text-align: center; vertical-align: middle;">
						<Font color="#006600" size='6' face="標楷體">${id}###</Font>
					</td>
				</tr>
				<tr height="36">
					<td colspan='4' style="text-align: center; vertical-align: middle;">
						<Font color="#006600" size='5' face="標楷體">上傳節目</Font>
					</td>
				</tr>
				<tr height="16">
					<td colspan='4' style="text-align: center; vertical-align: middle;">
						<div class="error">${errorSaveData}<br>
						</div>
					</td>
				</tr>


				<tr>
					<td>節目標題：</td>
					<td><input type="text" name="title"></td>
					<td>類別:</td>
					<td><select>
							<option value=''></option>
							<option value="1">科技</option>
							<option value="2">健康</option>
							<option value="3">流行</option>
					</select></td>
				</tr>
				<tr>
					<td>檔案說明：</td>
					<td><input type="text" name="podcastInfo"></td>
					<td>是否開啟收費:</td>
					<td>是<input type="radio" name=openPayment value="1"> 否
						<input type="radio" name=openPayment value="0"></td>
				</tr>
				<tr>
					<td>開放留言:</td>
					<td>是<input type="radio" name=openComment value="1"> 否
						<input type="radio" name=openComment value="0"></td>
					<td>音檔上傳:</td>
					<td><input type="file" name="audio"></td>
				</tr>
				<tr>
					<td>節目縮圖:</td>
					<td><input id="img" type="file" name="audioImg"></td>
					<td>圖片預覽:</td>
					<td><div id="preview"></div></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="送出" /></td>
					<td><input type="reset" value="重新填寫" /></td>
					<td></td>
				</tr>
			</Table>

		</form>
	</div>

	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				for (let i = 0; i < input.files.length; i++) {
					var reader = new FileReader();

					//轉完圖片再插入
					reader.onload = function(e) {
						//插入圖片
						var img = $(
								`<img id="pic${i}" width='300' height='200'> `)
								.attr('src', e.target.result);
						$("#preview").append(img);
					}

					reader.readAsDataURL(input.files[i]); // convert to base64 string

				}

			}
		}

		$("#img").change(function() {
			//淨空preview畫面
			$("#preview").html("");
			
			readURL(this);
		});
	</script>
</body>
</html>