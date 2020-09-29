<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
/* *{
	border: 1px solid black;
} */
.messageBoard{
	background-color: #f2f2f2;

}
.messageBoard{
	overflow-y: scroll;
	height: 1000px;
}

.messageBoard nav {
	 position: fixed;
	 height: 60px;
	 background-color: rgba(255, 255, 255, 1);
	 top: 0;
	 left: 0;
	 width: 100%;
	 z-index: 999;
	 display: flex;
	 flex-flow: row-reverse;
	 box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}
.messageBoard nav a {
	 display: block;
	 line-height: 60px;
	 flex: 0 0 auto;
	 border-left: 1px solid #aad3e8;
	 padding: 0 20px;
	 box-sizing: border-box;
}
.messageBoard h1 {
	 font-family: "Shadows Into Light";
	 font-size: 36px;
	 text-align: center;
	 color: white;
	 text-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	 margin-top: 100px;
}
.messageBoard div.bubbleContainer {
	 padding-top:50px;
	 position: relative;
	 width: 60vw;
	 height: 250px;
	/*  margin: 50px auto 0; */
}
.messageBoard div.bubbleContainer div.bubbleBody, div.bubbleContainer::after {
	 position: absolute;
}
.messageBoard div.bubbleContainer div.bubbleBody {
	 margin-left: 100px;
	 width: 500px;
	 height: 200px;
	 background-color: #fff;
	 border-radius: 10px;
	 box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}
.messageBoard div.bubbleContainer div.bubbleBody form {
	 padding: 30px;
	 box-sizing: border-box;
}
.messageBoard div.bubbleContainer div.bubbleBody form * {
	 display: block;
	 width: 100%;
	 border: none;
	 outline: none;
	 font-size: 20px;
	 color: #0d3544;
	 padding: 10px;
	 box-sizing: border-box;
}
.messageBoard div.bubbleContainer div.bubbleBody form input {
	 height: 50px;
	 border-bottom: 1px solid rgba(0, 0, 0, 0.3);
}
.messageBoard div.bubbleContainer div.bubbleBody form textarea {
	 height: 100px;
	 resize: none;
}
.messageBoard div.bubbleContainer::after {

	 content: "";
	 width: 0px;
	 height: 0px;
	 top: 250px;
	 left: 150px;
	 border-left: 30px solid transparent;
	 border-right: 30px solid transparent;
	 border-top: 30px solid white;
}
.messageBoard button.btnSendMessage {
	 width: 70px;
	 height: 40px;
	 display: block;
	 margin: 0 auto;
	 margin-right:20px;
	 background-color: ＃f2f2f2;
	 border: 3px solid white;
	 outline: none;
	 border-radius: 12px;
	 font-size: 20px;
	 font-family: "Shadows Into Light";
	 color: white;
}
.messageBoard ul.messageList {
	 width: 80vw;
	 margin: 50px auto;
	 font-family: "Open Sans";
}
.messageBoard ul.messageList li.message {
	 list-style:none;
	 width: 600px;
	 background-color: rgba(255, 255, 255, 1);
	 border-radius: 10px;
	 box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	 padding: 15px;
	 box-sizing: border-box;
	 margin: 5px;
}
.messageBoard ul.messageList li.message p.messageTitle {
	 font-size: 20px;
	 font-weight: 600;
	 margin-bottom: 5px;
}
.messageBoard ul.messageList li.message p.messageContent {
	 line-height: 24px;
}
.messageBoard ul.messageList li.message p.messageDate {
	 text-align: right;
}
.replyComment{
background-color:  #0d3544;
}

.dis2.reply{
display: block;
}
</style>
<title>頻道首頁</title>
</head>
<body>
		<div class="row">
			<div class="col-md-6">
				<div class="messageBoard">
					<div class="bubbleContainer">
					    <div class="bubbleBody">
					        <form id="message" action="podcastPage.do" method="post" name="comment">
					        	<textarea name="formMessage" id="content" placeholder="留言內容：&#13;&#10;請輸入不超過50個字"></textarea>
					        </form>
					        <span class="submit">
					        	<input id="podcasterId" type="hidden" value="${thisPodcasterId}"/>
					        	<button id="submitBtn" class="btnSendMessage" type="button" form="message">提交</button>
					        </span>
					    </div>
					</div>
					<ul class="messageList" id="messageList">
						<c:forEach items="${commList}" var="comment" varStatus="tagStatus">
						    <li class="message">
					        	<p class="messageTitle">${comment.Name}</p>
					        	<p class="messageContent">${comment.commentMsg}</p>
					        	<p class="messageDate">${comment.msgDate}</p>
					        	<div class="dis2">
					        	<button type="button" class="btn btn-sm" id="reply" onclick="reply('+va.com_id+');">回复</button></span></p>
					        	<textarea name="replyMessage" id="reply" placeholder="留言內容：&#13;&#10;請輸入不超過50個字"></textarea></div>
					        	<p class="replyComment"></p>
						    </li>
					    </c:forEach>
					</ul>
				</div>
			</div>

	
	
	<script type="text/javascript">

		document.getElementById("reply").onclick=function(){
			var xhR= new XMLHttpRequest();
			xhR.open("POST", "<c:url value='/podcastPage.do'/>", true);
			xhR.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			var content = document.getElementById("content").value;
			}
		
		document.getElementById("submitBtn").onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/podcastPage.do'/>", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			var content = document.getElementById("content").value;
			/* var PId = document.getElementById("PId").value; */
			var podcasterId = document.getElementById("podcasterId").value;
			console.log(content);
			/* xhr.send("content=" + content + "&PId=" + PId); */
			xhr.send("content=" + content + "&PId=" + podcasterId);
			console.log(content);
	
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					console.log("get data");
					console.log(xhr.responseText);
					var cbean = JSON.parse(xhr.responseText);
					console.log(cbean.commentMsg);
					/* var ctable = document.getElementById("ctable");*/
					var messageList = document.getElementById("messageList");
					var m=new Date(cbean.msgDate); 
					console.log(cbean.msgDate);
					console.log(m);
					//下面兩行有問題尚未解決
					/* var newMsg = "<tr class='d3'><td width='240'>"
							+ cbean.commentMsg
							+ "</td><td width='80' align='center' style='color:gray'>"
							+ cbean.memberId
							+ "</td><td width='80' align='center' style='color:gray'>"
							+ cbean.msgDate + "</td></tr>"; */
					var newMsg = "<li class='message'><p class='messageTitle'>"
						+ cbean.Name
						+"</p><p class='messageContent'>"
						+ cbean.commentMsg
						+ "</p><p class='messageDate'>"
						+ cbean.msgDate
						+ "</p></li>";
						
					messageList.innerHTML= newMsg+messageList.innerHTML;
					var content = document.getElementById("content").value;
					content="";
				}
			}
		}
	</script>

</body>
</html>