<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>UploadFile</title>
</head>
<body>
	<h3>Upload File</h3>
	<form id="form " action="upload.controller" method="post"
		enctype="multipart/form-data">
		<p>
			Please Select Your Picture to Upload:<br /> <input id="up"
				type="file" multiple name="myFiles"><br />
		</p>
		<input type="submit" value="Upload" />

		<div id="preview"></div>


	</form>
	<script type="text/javascript">
		function readURL(input) {
			
			if (input.files && input.files[0]) {
				for (let i = 0; i < input.files.length; i++) {
					var reader = new FileReader();

					reader.onload = function(e) {

						//創建img element
						var img = $(`<img id="pic${i}" width='300' height='200'> `).attr('src', e.target.result);

						//將新建img 以beforeEnd加到#preview內
						$("#preview").append(img);
					}

					reader.readAsDataURL(input.files[i]); // convert to base64 string

				}

			}
		}

		$("#up").change(function() {
			
			//#preview下清空預覽圖
			$("#preview").html("");
			
			//處理上傳圖片預覽
			readURL(this);
		});
	</script>










</body>
</html>