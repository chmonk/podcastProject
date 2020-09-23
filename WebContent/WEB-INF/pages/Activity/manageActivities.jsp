<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項活動 ? ") ) {
		document.forms[0].action="<c:url value='DeleteActivity?cmd=DEL&activityId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
</script>
<title>管理活動頁面</title>
</head>

<body>

	<Input type="button" name="add" value="新增活動"
		onclick="location='http://localhost:8080/SpringWebProject/addActivityForm'">
	<table border=1>
		<tr>
			<th>${LoginOK.name}的活動列表</th>
			<th>日期</th>
			<th>庫存</th>
			<th>刪除</th>
		</tr>
		<c:forEach var="alist" varStatus="loop" items="${ActivityList}">
			<tr><td>
			<a  href='<c:url value='ActivityDetail?memberId=${LoginOK.memberId}&activityId=${alist.activityId}' />'>
						${alist.activityName}
			    </a></td>
				<td>${alist.activityDate}</td>
				<td>${alist.activityMaxPeople}張</td>
				<td><Input type="button" name="delete" value="刪除"
					onclick="confirmDelete(${alist.activityId})"></td>
			</tr>

		</c:forEach>

		<tr height='36' id='borderA'>
			<td id='borderA' align="center" colspan="4"><a
				href="<c:url value='/' />">回首頁</a></td>
		</tr>
	</table>
	<form>
		<input type="hidden" name="a" />
	</form>
</body>
</html>