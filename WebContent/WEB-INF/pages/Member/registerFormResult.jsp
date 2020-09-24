<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members Result</title>
</head>
<body>
<h2>會員資料</h2>
帳號：${MemberBean.account}<br/>
註冊日期：${MemberBean.registerDate}<br/>
姓名：${MemberBean.name}<br/>
暱稱：${MemberBean.nickname}<br/>
生日：${MemberBean.birthday}<br/>
自我介紹：${MemberBean.info}<br/>
電子信箱：${MemberBean.email}<br/>
手機號碼：${MemberBean.cellphone}<br/>
住址：${MemberBean.address}<br/>
性別：${MemberBean.sex}<br/>
照片：<br/><img src="${MemberBean.image}" style="max-width: 300px; max-height: 300px;"><br/>
角色：${MemberBean.role}<br/>
信用卡號：${MemberBean.creditCardNumber}<br/>
銀行帳號：${MemberBean.bankAccount}<br/>
頻道月費：${MemberBean.monthlyPayment}<br/>
<Input type="button" name="" value="首頁" onclick="location='http://localhost:8080/SpringWebProject/'">
</body>
</html>