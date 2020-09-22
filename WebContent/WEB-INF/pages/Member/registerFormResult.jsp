<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members Result</title>
</head>
<body>
<h2>成功新增會員</h2>
帳號：${account}<br/>
密碼：${password}<br/>
姓名：${name}<br/>
暱稱：${nickname}<br/>
生日：${birthday}<br/>
註冊日期：${registerDate}<br/>
自我介紹：${info}<br/>
電子信箱：${email}<br/>
手機號碼：${cellphone}<br/>
住址：${address}<br/>
性別：${sex}<br/>
照片：${image}<br/>
角色：${role}<br/>
信用卡號：${creditCardNumber}<br/>
銀行帳號：${bankAccount}<br/>
頻道月費：${monthlyPayment}<br/>
<Input type="button" name="update" value="修改" onclick="location='http://localhost:8080/SpringWebProject/update'">
</body>
</html>