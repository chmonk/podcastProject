<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/showPaymentProgram.controller">
<a href="javascript:;" onclick="document.getElementById('d1').style.display='' ">訂閱列表</a><br>
<div id="d1" style="display: none">
  <c:forEach items="${subProgram}" var="bymemberid">
${bymemberid.getTitle()}<br/>
<p>付費節目<br/></p> 
<a href="audio/audio.mp3">music</a>
</c:forEach>
</div>
<button id="hide" type="button" onclick="document.getElementById('d1').style.display=''">訂閱</button>
<button id="show" type="button" onclick="document.getElementById('d1').style.display='none'">取消訂閱</button>
</form>

 
</body>
</html>