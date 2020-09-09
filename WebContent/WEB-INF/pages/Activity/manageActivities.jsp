<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理活動頁面</title>
</head>

<body>

<Input type="button" name="add" value="新增活動" onclick="location='http://localhost:8080/SpringWebProject/addActivityForm'">
<table border=1>
<tr><th>我的活動列表</th><th>日期</th><th>參加人數</th><th>刪除</th></tr>
<tr><td>${activityName}</td><td>${activityDate}</td><td></td><td></td></tr>


</table>

</body>
</html>