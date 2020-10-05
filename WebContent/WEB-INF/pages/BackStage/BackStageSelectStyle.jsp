<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Select</title>

<style>
</style>
<!-- 本體不包含選單CSS -->
<link href="css/BackStage.css" rel="stylesheet">


<!-- OTHERS -->
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=Lato:300'
	rel='stylesheet' type='text/css'>
<!-- Javascript files -->
<!-- jQuery -->
<script src="js/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="js/bootstrap.min.js"></script>
<!-- WayPoints JS -->
<script src="js/waypoints.min.js"></script>
<!-- Include js plugin -->
<script src="js/owl.carousel.min.js"></script>
<!-- One Page Nav -->
<script src="js/jquery.nav.js"></script>
<!-- Respond JS for IE8 -->
<script src="js/respond.min.js"></script>
<!-- HTML5 Support for IE -->
<script src="js/html5shiv.js"></script>

</head>

<body onload="columnTestify()">
	<div class="bg">
		<div style="margin-left: 30px;">
			<div class="col-sm-11" style="margin-bottom:20px">
				<h1 style="color: white;font-weight: bold;">SoundPod 後臺管理系統 </h1>
			</div>
			<div class="col-sm-1">
			<form id="logoutForm" action="<c:url value="logout"/>" method="GET">
			<input id="logoutBtn" type="button" value="登出" class="btn btn-danger" style="margin-top:20px">
			</form>
			</div>
		</div>

<!--表單選取區塊-------------------------------->	
	<!-- <div class="col-sm-2">
		<form id="select">
			<select id="options" name="options" onchange="showhide()">
				<option value="members">Members</option>
				<option value="ticketorder">TicketOrder</option>
				<option value="programcomment">ProgramComment</option>
				<option value="category">Category</option>
				<option value="subscription">Subscription</option>
				<option value="activity">Activity</option>
				<option value="history">History</option>
				<option value="podcast">Podcast</option>
				<option value="income">Income</option>
				<option value="logout">===LogOut===</option>
			</select>
		</form>
	</div> -->

	<div class="col-sm-2">
		<div style="margin:0px auto;">
		<input class="btn btn-default btn-custom" type="button" value="會員" onclick="showhide(value)"><br>
		<input class="btn btn-default btn-custom" type="button" value="票券" onclick="showhide(value)"><br>
		<input class="btn btn-default btn-custom" type="button" value="留言板" onclick="showhide(value)"><br>
		<input class="btn btn-default btn-custom" type="button" value="節目類別" onclick="showhide(value)"><br>
		<input class="btn btn-default btn-custom" type="button" value="訂閱" onclick="showhide(value)"><br>
		<input class="btn btn-default btn-custom" type="button" value="活動" onclick="showhide(value)"><br>
		<input class="btn btn-default btn-custom" type="button" value="收聽紀錄" onclick="showhide(value)"><br>
		<input class="btn btn-default btn-custom" type="button" value="節目"onclick="showhide(value)" ><br>
		<input class="btn btn-default btn-custom" type="button" value="收入計算"onclick="showhide(value)" ><br>
		</div>
	</div>

<!--areas區塊-->
<!-- Member============================================================================== -->

	<div class="col-sm-3" style="background-color: hsla(9, 0%, 47%, 0.95);height:600px">
	<div class="wrap">
		<div class="areas" id="會員" style="display: block;">
			
			<div >
				<input id="showAllMemberBtn" type="button" class="btn btn-danger btn-lg" 
				value="會員總覽" onclick="showAllMembers()">
			</div>	
			
			<div>
				
					<label for="selectMemberIdText">會員詳情</label> <input autocomplete="off"
						id="selectMemberIdText" type="number" name="selectmemberId" placeholder="memberId">
					<span>
					<input id="memberIdBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectMemberByIdErr"></span>
					</span>
					
				

			</div>
			<hr class="hr0">
			<div>
				
					<label for="selectMemberAccountText">暱稱搜尋</label> 
						<input id="selectMemberAccountText" type="text" autocomplete="off"
						name="account" placeholder="nickname"> 
					<span>
					<input id="selectMemberAccountBtn" 
						type="button" value="send" class="btn btn-warning">
					<span id="selectMemberAccountErr"></span>
					</span>

				
			</div>
			<hr class="hr0">
			<div>
				
					<label for="deleteMemberText">刪除會員</label> <input autocomplete="off"
						id="deleteMemberText" type="number" name="deletememberId" placeholder="memberId">
					<span>
					<input id="deleteMemberBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="deleteMemberErr"></span>
					</span>
				
			</div>

		</div>

		<!-- TicketOrder============================================================================== -->

		<div class="areas" id="票券" style="display: none">
		
			<div >
				<input id="showAllOrderBtn" type="button" class="btn btn-danger btn-lg" 
				value="訂單總覽" onclick="showAllOrder()">
			</div>

			<div>
					<label for="selectOrderIdText">單筆查詢</label> 
					<input autocomplete="off"
						id="selectOrderIdText" type="number" name="orderId" placeholder="ticketOrderId"> 
					<span>
					<input
						id="selectOrderIdBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectOrderIdErr"></span>
					</span>
			</div>

			<hr class="hr0">
			<div>
					<label for="selectOrderMemberText">會員訂單</label> 
					<input autocomplete="off"
						id="selectOrderMemberText" type="number" name="memberId" placeholder="memberId">
					<span>
					<input id="selectOrderMemberBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectOrderMemberErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<label for="selectOrderActText">活動訂單</label> 
					<input autocomplete="off"
						id="selectOrderActText" type="number" name="activityId" placeholder="activityId"> 
					<span>
					<input
						id="selectOrderActBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectOrderActErr"></span>
					</span>
			</div>
		</div>

		<!-- ProgramComment========================================================================-->

		<div class="areas" id="留言板" style="display: none;">
		
			<div >
				<input id="showAllCommentBtn" type="button" class="btn btn-danger btn-lg" 
				value="留言總覽" onclick="showAllComment()">
			</div>	
			<div>
					<label for="selectCommentIdText">留言查詢</label> 
					<input autocomplete="off"
						id="selectCommentIdText" type="number" name="commentId" placeholder="commentId"> 
					<span>
					<input
						id="selectCommentIdBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectCommentIdErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<div>
						<label  for="selectCommentMemberMText">
							留言會員</label> 
						<input  autocomplete="off"
							id="selectCommentMemberMText" type="number"
							name="commentmemberId" placeholder="memberId">
					</div>
					<div>
						<label  for="selectCommentMemberPText">
							哪位播客</label> 
							<input autocomplete="off"
							id="selectCommentMemberPText" type="number"
							name="commentpodcasterId" placeholder="podcasterId">
						
						<span>
						<input id="selectCommentMemberBtn" type="button" value="send"
							class="btn btn-warning">
						<span id="selectCommentMemberErr"></span>
						</span>
					</div>
			</div>
			<hr class="hr0">
			<div>
					<label for="selectCommentPodcasterText">播客所有留言</label>
					<input id="selectCommentPodcasterText" type="number" autocomplete="off"
						name="commentpodcasterId" placeholder="podcasterId"> 
					<span>
					<input
						id="selectCommentPodcasterBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectCommentPodcasterErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<label for="deleteCommentIdText">刪除留言</label> 
					<input autocomplete="off"
						id="deleteCommentIdText" type="number" name="commentId" placeholder="commentId"> 
					<span>
					<input
						id="deleteCommentIdBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="deleteCommentIdErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<div>
						<label  for="deleteCommentMemberMText">
							刪除會員留言</label> 
							<input  autocomplete="off"
							 id="deleteCommentMemberMText" type="number"
							name="commentMemberId"  placeholder="memberId"> 
					</div>

					<div>
						<label  for="deleteCommentMemberPText">
							哪位播客</label> 
						<input  autocomplete="off"
							id="deleteCommentMemberPText" type="number"
							name="commentPodcasterId"  placeholder="podcasterId">
						<span>
						<input id="deleteCommentMemberBtn" type="button" value="send"
							class="btn btn-warning">
						<span id="deleteCommentMemberErr"></span>
						</span>
					</div>
			</div>

		</div>

		<!-- Category========================================================================-->
		<div class="areas" id="節目類別" style="display: none;">

			<div >
				<input id="showAllCategoryBtn" type="button" class="btn btn-danger btn-lg" 
				value="類別總覽" onclick="showAllCategory()">
			</div>

			<div>
					<label for="setNewCategoryText">新增類別</label> 
					<input id="setNewCategoryText"  autocomplete="off"
					type="text" name="categoryName" placeholder="categoryName"> 
					<span>
					<input
						id="setNewCategoryBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="setNewCategoryErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<div>
						<label for="upgradeCategoryIdText">修改類別</label> 
						<input  autocomplete="off"
							id="upgradeCategoryIdText" type="number" name="categoryId" placeholder="categoryId">
					</div>

					<div>
						<label for="upgradeCategoryNameText">新類別名</label> 
						<input  autocomplete="off"
							id="upgradeCategoryNameText" type="text" name="categoryNewName" placeholder="categoryName">
						<span>
						<input id="upgradeCategoryBtn"
							type="button" value="send" class="btn btn-warning">
						<span id="upgradeCategoryErr"></span>
						</span>
					</div>
			</div>

		</div>

		<!-- Subscription========================================================================-->

		<div class="areas" id="訂閱" style="display: none;">
		
			<div >
				<input id="showAllSubBtn" type="button" class="btn btn-danger btn-lg" 
				value="訂閱總覽" onclick="showAllSub()">
			</div>

			<div>
					<label for="selectSubMemberText">會員訂閱一覽</label> <input
					autocomplete="off"	id="selectSubMemberText" type="number" name="memberId"
						placeholder="MemberId"> <span> <input
						id="selectSubMemberBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectSubMemberErr"></span>
					</span>
			</div>
			<hr class="hr0">

			<div>
					<label for="selectSubPodcasterText">播客訂閱一覽</label>
					<input id="selectSubPodcasterText" type="number" name="podcasterId"
					autocomplete="off"	placeholder="PodcasterId"> <span> <input
						id="selectSubPodcasterBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectSubPodcasterErr"></span>
					</span>
			</div>

		</div>


		<!-- Activity========================================================================-->
		<div class="areas" id="活動" style="display: none;">

			<div >
				<input id="showAllActivityBtn" type="button" class="btn btn-danger btn-lg" 
				value="活動總覽" onclick="showAllActivity()">
			</div>

			<div>
					<label for="selectActIdText">活動查詢</label> <input autocomplete="off"
						id="selectActIdText" type="number" name="activityId"
						placeholder="ActivityId"> <span> <input
						id="selectActIdBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectActIdErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<label for="selectActPodcasterText">播客活動查詢</label> <input autocomplete="off"
						id="selectActPodcasterText" type="number" name="podcasterId"
						placeholder="PodcasterId"> <span> <input
						id="selectActPodcasterBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectActPodcasterErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<label for="selectActDateText">依日期搜尋活動</label> <input autocomplete="off"
						id="selectActDateText" type="text" name="activityDate"
						placeholder="YYYY-mm-dd"> <span> <input
						id="selectActDateBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectActDateErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<label for="deleteActIdText">刪除活動</label> <input autocomplete="off"
						id="deleteActIdText" type="number" name="activityId"
						placeholder="ActivityId"> <span> <input
						id="deleteActIdBtn" type="button" value="send"
						class="btn btn-warning"> <span id="deleteActIdErr"></span>
					</span>
			</div>

		</div>

		<!-- History========================================================================-->

		<div class="areas" id="收聽紀錄" style="display: none;">
		
			<div >
				<input id="showAllHistoryBtn" type="button" class="btn btn-danger btn-lg" 
				value="紀錄總覽" onclick="showAllHistory()">
			</div>

			<div>
					<label for="selectHistoryIdText">查詢紀錄</label> <input autocomplete="off"
						id="selectHistoryIdText" type="number" name="historyId"
						placeholder="historyId">
					<sapn> <input id="selectHistoryIdBtn" type="button"
						value="send" class="btn btn-warning"> <span
						id="selectHistoryIdErr"></span> </sapn>
			</div>
			<hr class="hr0">
			<div>

					<label for="selectHistoryMemberText">會員紀錄</label> <input autocomplete="off"
						id="selectHistoryMemberText" type="number" name="memberId"
						placeholder="memberId"> <span> <input
						id="selectHistoryMemberBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectHistoryMemberErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>

					<label for="selectHistoryPodcasterText">
					播客紀錄</label> <input id="selectHistoryPodcasterText" type="number"
					autocomplete="off"	name="podcasterId" placeholder="podcasterId">
					<sapn> <input id="selectHistoryPodcasterBtn" type="button"
						value="send" class="btn btn-warning"> <span
						id="selectHistoryPodcasterErr"></span> </sapn>
			</div>
			<hr class="hr0">
			<div>
					<label for="selectHistoryLastText">依收聽時間</label> <input autocomplete="off"
						id="selectHistoryLastText" type="text" name="historyLastListen"
						placeholder="YYYY-mm-dd"> <span> <input
						id="selectHistoryLastBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectHistoryLastErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>

					<label for="deleteHistoryDateText">批量刪除紀錄</label> <input autocomplete="off"
						id="deleteHistoryDateText" type="text" name="historyDeleteDate"
						placeholder="YYYY-mm-dd"> <span> <input
						id="deleteHistoryDateBtn" type="button" value="send"
						class="btn btn-warning"> <span id="deleteHistoryDateErr"></span>
					</span>

			</div>


		</div>

		<!-- Podcast========================================================================-->


		<div class="areas" id="節目" style="display: none;">
		
			<div >
				<input id="showAllPodcastBtn" type="button" class="btn btn-danger btn-lg" 
				value="節目總覽" onclick="showAllPodcast()">
			</div>

			<div>
					<label for="selectPodcastMemberText">播客節目列表</label> <input autocomplete="off"
						id="selectPodcastMemberText" type="number" name="memberId"
						placeholder="memberId"> <span> <input
						id="selectPodcastMemberBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectPodcastMemberErr"></span>
					</span>
			</div>
			<hr class="hr0">
			<div>
					<label for="deletePodcastIdText">刪除節目</label> <input autocomplete="off"
						id="deletePodcastIdText" type="number" name="podcastId"
						placeholder="podcastId"> <span> <input
						id="deletePodcastIdBtn" type="button" value="send"
						class="btn btn-warning"> <span id="deletePodcastIdErr"></span>
					</span>
			</div>

			<hr class="hr0">

			<div>
					<label for="topPodcastText">區間熱門節目</label> <input autocomplete="off"
						id="topPodcastText" type="text" name="uploadTime"
						placeholder="YYYY-mm-dd"> <span> <input
						id="topPodcastBtn" type="button" value="send"
						class="btn btn-warning"> <span id="topPodcastErr"></span>
					</span>
			</div>

		</div>

		<!-- Income Calculate========================================================================-->

		<div class="areas" id="收入計算" style="display: none;">

			<div>
					<div>
						<label for="subIncomeSDText">訂閱收入(起)</label> <input
						autocomplete="off"	id="subIncomeSDText" type="text" name="startDate"
							placeholder="YYYY-mm-dd">
					</div>
					<div>
						<label for="subIncomeEDText">訂閱收入(迄)</label> <input autocomplete="off"
							id="subIncomeEDText" type="text" name="endDate"
							placeholder="YYYY-mm-dd"> <span> <input
							id="subIncomeBtn" type="button" value="send"
							class="btn btn-warning"> <span id="subIncomeErr"></span>
						</span>
					</div>
			</div>
			<hr class="hr0">
			<div>
					<div>
						<label for="ticketIncomeSDText">票券收入(起)</label> <input
						autocomplete="off"	id="ticketIncomeSDText" type="text" name="startDate"
							placeholder="YYYY-mm-dd">
					</div>
					<div>
						<label for="ticketIncomeEDText">票券收入(迄)</label> <input autocomplete="off"
							id="ticketIncomeEDText" type="text" name="endDate"
							placeholder="YYYY-mm-dd"> <span> <input
							id="ticketIncomeBtn" type="button" value="send"
							class="btn btn-warning"> <span id="ticketIncomeErr"></span>
						</span>
					</div>
				<br>
			</div>

		</div>

	</div>
	<!--上面的是DIV.WRAP結束TAG/下面這是選取區域的DIV結束TAG -->
	</div>

	<div class="col-sm-7" style="background-color:hsla(9, 5%, 90%, 0.7);height:600px;">
	<!-- AJAX動態生成查詢結果 -->
		<h2 id="resultTag" style="text-align:center;margin-top: 15px;color:black;font-weight: bold;">查詢結果:</h2>
		<div id="ajaxTable" style="margin:0px auto;margin-top: 10px;">
			<img src="./img/magnifier3.png" alt="" style="margin-left:200px;margin-top:30px;">
		</div>
	
	
	</div>
	
	
	
<!-- SCRIPT!!!======================================================= -->	
	<script>
	//登出功能JS 
	document.getElementById("logoutBtn").onclick=function(){
		var r=confirm("確定要登出?")
		if(r==true){
			document.getElementById("logoutForm").submit();
			return true;
		}else{
	
		}		
		
	}

	//動態生成表格JS 
	//分區功能:Member===================
	function processMember(conn,input){
		let ajaxtableM=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("input:"+input);
		xhr.send("input="+input);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type2 = xhr.getResponseHeader("Content-Type");
				let selectMember = JSON.parse(xhr.responseText);
				if(selectMember[0]==null){
					console.log("NO RESULT!");
					ajaxtableM.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}

				let content="";
				
				for(var i=0;i<selectMember.length;i++){
				content+=
				"<table  class='ta'>"
				+"<tr>"	
				+"<th>MemberId</th>"	
				+"<th colspan='2'>Account</th>"

				+"<th>Name</th>"
				+"<th>NickName</th>"
				+"<th>Birthday</th>"
				+"<th>RegisterDate</th>"
				+"</tr>"
				+"</tr>"
				+"<tr>"
				+"<td rowspan='5'>"+selectMember[i].memberId+"</td>"
				+"<td colspan='2'>"+selectMember[i].account+"</td>"

				+"<td>"+selectMember[i].name+"</td>"
				+"<td>"+selectMember[i].nickname+"</td>"
				+"<td>"+selectMember[i].birthday+"</td>"
				+"<td>"+selectMember[i].registerDate+"</td>"
				+"</tr>"
				+"<tr>"
				+"<th colspan='2'>Info</th>"
				+"<th>Email</th>"
				+"<th>CellPhone</th>"
				+"<th colspan='2'>Address</th>"
				+"</tr>"			
				+"<tr>"
				+"<td colspan='2'>"+selectMember[i].info+"</td>"
				+"<td>"+selectMember[i].email+"</td>"
				+"<td>"+selectMember[i].cellphone+"</td>"
				+"<td colspan='2'>"+selectMember[i].address+"</td>"
				+"</tr>"			
				+"<tr>"
				+"<th>Sex</th>"
				+"<th>Image</th>"
				+"<th>Role</th>"
				+"<th>CreditCardNumber</th>"
				+"<th>BankAccount</th>"
				+"<th>MonthlyPayment</th>"
				+"</tr>"			
				+"<tr>"
				+"<td>"+selectMember[i].sex+"</td>"
				+"<td>"+selectMember[i].image+"</td>"
				+"<td>"+selectMember[i].role+"</td>"
				+"<td>"+selectMember[i].creditCardNumber+"</td>"
				+"<td>"+selectMember[i].bankAccount+"</td>"
				+"<td>"+selectMember[i].monthlyPayment+"</td>"
				+"</tr>"		
				+"</table>"				
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				
				
				ajaxtableM.innerHTML=content;
		}
	}
	}

	function processTicketOrder(conn,input){
		let ajaxtableT=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("input:"+input);
		xhr.send("input="+input);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectTicketOrder = JSON.parse(xhr.responseText);
				if(selectTicketOrder[0]==null){
					console.log("NO RESULT!");
					ajaxtableT.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;

				}

				let content="";
				
				for(var i=0;i<selectTicketOrder.length;i++){
				content+=
				"<table  class='ta'>"
				+"<tr>"	
				+"<th>TicketOrderId</th>"	
				+"<th colspan='2'>OrderDate</th>"
				+"<th>MemberId</th>"
				+"<th>ActivityId</th>"
				+"<th>OrderPrice</th>"
				+"</tr>"
				+"<tr>"
				+"<td rowspan='3'>"+selectTicketOrder[i].ticketOrderId+"</td>"
				+"<td colspan='2'>"+selectTicketOrder[i].orderDate+"</td>"
				+"<td>"+selectTicketOrder[i].memberId+"</td>"
				+"<td>"+selectTicketOrder[i].activityId+"</td>"
				+"<td>"+selectTicketOrder[i].orderPrice+"</td>"
				+"</tr>"
				+"<tr>"
				+"<th colspan='2'>ShippingAddress</th>"
				+"<th>BNO</th>"
				+"<th>InVoiceTitle</th>"
				+"<th>TotalAmount</th>"
				+"</tr>"
				+"<tr>"
				+"<td colspan='2'>"+selectTicketOrder[i].shippingAddress+"</td>"
				+"<td>"+selectTicketOrder[i].bno+"</td>"
				+"<td>"+selectTicketOrder[i].invoiceTitle+"</td>"
				+"<td>"+selectTicketOrder[i].totalAmount+"</td>"
				+"</tr>"
				+"</table>"				
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				ajaxtableT.innerHTML=content;
		}
	}
}


function processComment(conn,inputm,inputp){
		let ajaxtableCC=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("inputm:"+inputm);
		console.log("inputp:"+inputp);
		xhr.send("inputm="+inputm+"&inputp="+inputp);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectComment = JSON.parse(xhr.responseText);
				if(selectComment[0]==null){
					console.log("NO RESULT!");
					ajaxtableCC.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}

				let content="";
				
				for(var i=0;i<selectComment.length;i++){
				content+=
				"<table class='ta'>"
				+"<tr>"
				+"<th>CommentId</th>"
				+"<th colspan='2'>CommentMsg</th>"
				+"<th>MsgStatus</th>"
				+"</tr>"
				+"<tr>"
				+"<td rowspan='3'>"+selectComment[i].commentId+"</td>"
				+"<td colspan='2'>"+selectComment[i].commentMsg+"</td>"
				+"<td>"+selectComment[i].msgStatus+"</td>"
				+"</tr>"
				+"<tr>"
				+"<th>PodcasterId</th>"
				+"<th>MemberId</th>"
				+"<th>MsgDate</th>"
				+"</tr>"
				+"<tr>"
				+"<td>"+selectComment[i].podcasterId+"</td>"
				+"<td>"+selectComment[i].memberId+"</td>"
				+"<td>"+selectComment[i].msgDate+"</td>"
				+"</tr>"
				+"</table>"		
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				ajaxtableCC.innerHTML=content;
		}
	}
}


function processCategory(conn,inputo,inputn){
		let ajaxtableC=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("inputo:"+inputo);
		console.log("inputn:"+inputn);
		xhr.send("inputo="+inputo+"&inputn="+inputn);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectCategory = JSON.parse(xhr.responseText);
				if(selectCategory[0]==null){
					console.log("NO RESULT!");
					ajaxtableC.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}
				
				let content="<table class='ta'>"
				+"<tr>"
				+"<th>CategoryId</th>"
				+"<th>CategoryName</th>"
				+"</tr>";
				for(var i=0;i<selectCategory.length;i++){
				content+=
				"<tr>"
				+"<td>"+selectCategory[i].categoryId+"</td>"
				+"<td>"+selectCategory[i].categoryName+"</td>"
				+"</tr>";		
			}    
				content+="</table>";                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
				ajaxtableC.innerHTML=content;
		}
	}
}

function processSub(conn,input){
		let ajaxtableS=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("input:"+input);
		xhr.send("input="+input);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectSub = JSON.parse(xhr.responseText);
				if(selectSub[0]==null){
					console.log("NO RESULT!");
					ajaxtableS.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}
				
				let content="<table class='ta'>"
				+"<tr>"
				+"<th>SubOrderId</th>"
				+"<th>SubDateStart</th>"
				+"<th>SubDateEnd</th>"
				+"<th>MonthlyPayment</th>"
				+"<th>MemberId</th>"
				+"<th>PodcasterId</th>"
				+"<th>CreditCardNumber</th>"
				+"<th>Receipt</th>"
				+"</tr>";
				for(var i=0;i<selectSub.length;i++){
				content+=
				"<tr>"
				+"<td>"+selectSub[i].subOrderId+"</td>"
				+"<td>"+selectSub[i].subdateStart+"</td>"
				+"<td>"+selectSub[i].subdateEnd+"</td>"
				+"<td>"+selectSub[i].monthlyPayment+"</td>"
				+"<td>"+selectSub[i].memberId+"</td>"
				+"<td>"+selectSub[i].podcasterId+"</td>"
				+"<td>"+selectSub[i].creditCardNumber+"</td>"
				+"<td>"+selectSub[i].receipt+"</td>"
				+"</tr>";		
			}    
				content+="</table>";                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
				ajaxtableS.innerHTML=content;
		}
	}
}


function processActivity(conn,input){
		let ajaxtableA=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("input:"+input);
		xhr.send("input="+input);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectActivity = JSON.parse(xhr.responseText);
				if(selectActivity[0]==null){
					console.log("NO RESULT!");
					ajaxtableA.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}
				
				let content="<table class='ta'>";
				
				for(var i=0;i<selectActivity.length;i++){
					content+=
					"<tr>"
					+"<th>ActivityId</th>"
					+"<th>ActivityName</th>"
					+"<th>ActivityDate</th>"
					+"<th colspan='4'>ActivityContent</th>"
					+"<th>ActivityLocation</th>"	
					+"</tr>"
					+"<tr>"
					+"<td rowspan='3'>"+selectActivity[i].activityId+"</td>"
					+"<td>"+selectActivity[i].activityName+"</td>"
					+"<td>"+selectActivity[i].activityDate+"</td>"
					+"<td colspan='4'>"+selectActivity[i].activityContent+"</td>"
					+"<td>"+selectActivity[i].activityLocation+"</td>"
					+"</tr>"
					+"<tr>"
					+"<th>ActivityTime</th>"
					+"<th>PodcasterId</th>"
					+"<th>ActivityPrice</th>"
					+"<th>ActivityMaxPeople</th>"
					+"<th>Stock</th>"
					+"<th>ActivityStatus</th>"
					+"<th>ActivityImg</th>"
					+"</tr>"
					+"<tr>"
					+"<td>"+selectActivity[i].activityTime+"</td>"
					+"<td>"+selectActivity[i].podcasterId+"</td>"
					+"<td>"+selectActivity[i].activityPrice+"</td>"
					+"<td>"+selectActivity[i].activityMaxPeople+"</td>"
					+"<td>"+selectActivity[i].stock+"</td>"
					+"<td>"+selectActivity[i].activityStatus+"</td>"
					+"<td>"+selectActivity[i].activityImg+"</td>"
					+"</tr>";
				}
				content+="</table>";                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
				ajaxtableA.innerHTML=content;
			}    
				
		}
	}

function processHistory(conn,input){
		let ajaxtableH=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("input:"+input);
		xhr.send("input="+input);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectHistory = JSON.parse(xhr.responseText);
				if(selectHistory[0]==null){
					console.log("NO RESULT!");
					ajaxtableH.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}
				
				let content="<table class='ta'>"
				+"<tr>"
				+"<th>HistoryId</th>"
				+"<th>PodcastId</th>"
				+"<th>PodcastName</th>"
				+"<th>PublisherId</th>"
				+"<th>MemberId</th>"
				+"<th>LastListen</th>"
				+"</tr>";
				for(var i=0;i<selectHistory.length;i++){
				content+=
				"<tr>"
				+"<td>"+selectHistory[i].historyId+"</td>"
				+"<td>"+selectHistory[i].podcastId+"</td>"
				+"<td>"+selectHistory[i].podcastName+"</td>"
				+"<td>"+selectHistory[i].publisherId+"</td>"
				+"<td>"+selectHistory[i].memberId+"</td>"
				+"<td>"+selectHistory[i].lastListen+"</td>"
				+"</tr>";		
			}    
				content+="</table>";                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
				ajaxtableH.innerHTML=content;
		}
	}
}
	

function processPodcast(conn,input){
		let ajaxtableP=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("input:"+input);
		xhr.send("input="+input);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectPodcast = JSON.parse(xhr.responseText);
				if(selectPodcast[0]==null){
					console.log("NO RESULT!");
					ajaxtableP.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}

				let content="";
				
				for(var i=0;i<selectPodcast.length;i++){
				content+=
				"<table class='ta'>"
				+"<tr>"
				+"<th>PodcastId</th>"
				+"<th>CategoryId</th>"
				+"<th>Title</th>"
				+"<th colspan='3'>PodcastInfo</th>"
				+"</tr>"
				+"<tr>"
				+"<td rowspan='5'>"+selectPodcast[i].podcastId+"</td>"
				+"<td>"+selectPodcast[i].categoryId+"</td>"
				+"<td>"+selectPodcast[i].title+"</td>"
				+"<td colspan='3'>"+selectPodcast[i].podcastInfo+"</td>"
				+"</tr>"
				+"<tr>"
				+"<th>MemberId</th>"
				+"<th>UploadTime</th>"
				+"<th>OpenPayment</th>"
				+"<th>ClickAmount</th>"
				+"<th>LikesCount</th>"
				+"</tr>"
				+"<tr>"
				+"<td>"+selectPodcast[i].memberId+"</td>"
				+"<td >"+selectPodcast[i].uploadTime+"</td>"
				+"<td>"+selectPodcast[i].openPayment+"</td>"
				+"<td>"+selectPodcast[i].clickAmount+"</td>"
				+"<td>"+selectPodcast[i].likesCount+"</td>"
				+"</tr>"
				+"</table>"		
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
				ajaxtableP.innerHTML=content;
		}
	}
}


function processIncome(conn,inputS,inputE){
		let ajaxtableI=document.getElementById("ajaxTable");
		let xhr = new XMLHttpRequest();
		xhr.open("POST", conn, true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		console.log("conn:"+conn);
		console.log("inputS:"+inputS);
		console.log("inputE:"+inputE);
		xhr.send("inputS="+inputS+"&inputE="+inputE);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("readyState & status GOOD!");
				let type = xhr.getResponseHeader("Content-Type");
				let selectIncome = JSON.parse(xhr.responseText);
				if(selectIncome[2]==0.0){
					console.log("NO RESULT!");
					ajaxtableI.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>";
					return;
				}
				
				let content="<table class='ta'>"
				+"<tr>"
				+"<th>StartDate</th>"
				+"<th>EndDate</th>"
				+"<th>Income</th>"
				+"</tr>"
				+"<tr>"
				+"<td>"+selectIncome[0]+"</td>"
				+"<td>"+selectIncome[1]+"</td>"
				+"<td>"+selectIncome[2]+"</td>"
				+"</tr>"
				+"</table>"	;	
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
				ajaxtableI.innerHTML=content;
		}
	}
}
	
</script>

	<script type="text/javascript"
		src="<c:url value='/js/BackStageSelect.js'/>"></script>

	</div>
</body>
</html>