<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>頻道頁面</title>
</head>
<style>
.d2 {
	width: 500px;
	height: 500px;
	overflow-y: scroll;
	overflow-x: none;
}
</style>
<body>

	<Input type="button" name="modify" value="我的最愛"
		onclick="location='http://localhost:8080/SpringWebProject/...'">
	<br />
	<br />
	<div>
		<form action="podcastPage.do" method="post" name="comment">
			<table>
				<tr>
					<td>留言內容：</td>
					<td><textarea id="content"  rows="5" cols="40"
							placeholder="請輸入不超過50個字" maxlength="50"></textarea></td>
				</tr>
				<tr>
					<td><input id="submitBtn" type="button" value=" 提交 " ></td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<div class="d2">
		<form>
			<table id="ctable" width="400">
				<c:forEach items="${commList}" var="comment" varStatus="tagStatus">
					<tr>
						<td width="240">${comment.commentMsg}</td>
						<td width="80">${comment.memberId}</td>
						<td width="80">${comment.msgDate}</td>
					</tr>
<!-- 				<td><input type="button" name="delete" value="刪除" onclick="location='http://localhost:8080/SpringWebProject/processDeleteComment'"></td></tr> -->
<%-- 				<td><form id="${comment.commentId}" action="<c:url value="/processDeleteComment"/>"  method="POST"> --%>
<!-- 				<input type="hidden" name="delCommId" value=${comment.commentId}>  -->
<%-- 				<input type="button" value="刪除" onclick="delConfirm(this.name)" name="${comment.commentId}"></form></td> --%>
				</c:forEach>
					
			</table>
			<hr>
		</form>
	</div>
	
<script type="text/javascript">

function delConfirm(clicked_name){

	var r=confirm("確定要刪除此留言?")
	if(r==true){
		
		console.log(clicked_name);
		document.getElementById(clicked_name).submit();
		
	}else{
		
	}
}

document.getElementById("submitBtn").onclick=function(){
	var xhr=new XMLHttpRequest();
	xhr.open("POST","<c:url value='/podcastPage.do'/>",true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	var	content=document.getElementById("content").value;
	console.log(content);
	xhr.send("content="+content);
	console.log(content);

	xhr.onreadystatechange=function(){
		if(xhr.readyState===4 && xhr.status===200){
			var cbean=JSON.parse(xhr.responseText);
			console.log(cbean.commentMsg);
			var ctable=document.getElementById("ctable");

			//下面兩行有問題尚未解決
			var newMsg="<tr><td width='240'>"+cbean.commentMsg+"</td><td width='80'>"+cbean.memberId+"</td><td width='80'>"+cbean.msgDate+"</td></tr>";
			ctable.append(newMsg);
		}
	}
	
}


</script>
</body>
</html>