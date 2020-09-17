<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function openWindows(){
	alert("")}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/greenPay.controller">
		<a href="javascript:;" onclick="document.getElementById('d1').style.display='' ">訂閱列表</a><br>
		<div id="d1" style="display: none" >
			<c:forEach items="${subProgram}" var="bymemberid">
				<c:forEach items="${upLoadProgram}" var="byuploadid">


				</c:forEach>
節目名稱 =${bymemberid.getTitle()}<br />

				<p>
					付	費節目<br />
				</p>
		     <a href="#/">播放</a>
				<br />
			</c:forEach>
		</div>
		<input type="submit" value="訂閱">
		<button id="hide" type="button" onclick="document.getElementById('d1').style.display='none'">取消訂閱</button>
	</form>

</body>
</html>