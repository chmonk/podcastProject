<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Select</title>


<style>
td {
	width: 100px;
	text-align: center;
	border: 1px solid #3A3A3A;
	word-wrap: break-word;
	max-width: 1px;
	color:black;
}

th {
	width: 100px;
	text-align: center;
	border: 1px solid #3A3A3A;
	background-color: #3A3A3A;
}

#ajaxTable{
	margin-top:50px;
	height: 500px;
	width:650px;
    overflow: auto;
}
.ta {
	border: 3px solid #3A3A3A;
	border-collapse: collapse;
	background-color:white;
	
}

.center {
	margin: 0px auto;
	text-align: center;
}



.hr0{
	height:3px;
	border: none;
    border-top:3px dashed;
}

::placeholder {
	color: #EAE8E8;
	opacity: 1;
}

span {
	color: red;
	font-size: 20px;
	margin-top: 10px;
}

p {
	color: red;
	font-size: 20px
}

#body {
	font-family: "Lato", sans-serif;
	color: white;
	background-color: #515151;
}

h1 {
	font-size: 80px;
	margin: 0px;
	padding: 0px;
}

h3 {
	margin: 0px;
	padding: 0px;
	color: #999;
}

div.wrap {
	width: 350px;
	height:600px;
	overflow: auto;
}

div.wrap div {
	position: relative;
	margin: 25px 5px 25px 0px;
}

label {
	position: absolute;
	top: 0;
	font-size: 35px;
	margin: 10px;
	padding: 0 10px;
	background-color: #949494;
	-webkit-transition: top 0.2s ease-in-out, font-size 0.2s ease-in-out;
	transition: top 0.2s ease-in-out, font-size 0.2s ease-in-out;
}

.active {
	top: -25px;
	font-size: 20px;
}

.double {
	position: absolute;
	top: 0;
	font-size: 26px;
	margin: 13px;
	padding: 0 10px;
	background-color: #949494;
	-webkit-transition: top 0.2s ease-in-out, font-size 0.2s ease-in-out;
	transition: top 0.2s ease-in-out, font-size 0.2s ease-in-out;
}

.doubleact {
	top: -25px;
	font-size: 20px;
}

input[type="text"] {
	width: 100%;
	padding: 20px;
	border: 1px solid white;
	font-size: 20px;
	background-color: #949494;
	color: white;
}

input[type="text"]:focus {
	outline: none;
}

input[type="number"] {
	width: 100%;
	padding: 20px;
	border: 1px solid white;
	font-size: 20px;
	background-color: #949494;
	color: white;
}

input[type="number"]:focus {
	outline: none;
}

#select {
	color: black;
}

input[type="button"] {
	margin-top: 10px;
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.js"
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

<body id="body" onload="showhide();columnTestify()">

	
	
		<div style="margin-left: 30px;">
			<h1>後臺管理功能選擇 </h1>
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
		</div>

	<!-- Member============================================================================== -->
	<div class="col-sm-2">
		<!-- 選單放這裡 -->
	</div>
	<div class="col-sm-4" style="background-color: #949494;height:600px">
	<div class="wrap">
		<div class="areas" id="members" style="display: none;">
			
			<div >
				<input id="showAllMemberBtn" type="button" class="btn btn-danger btn-lg" 
				value="Member總覽" onclick="showAllMembers()">
			</div>	
			
			<div>
				
					<label for="selectMemberIdText">Member 詳情</label> <input autocomplete="off"
						id="selectMemberIdText" type="number" name="selectmemberId" placeholder="memberId">
					<span>
					<input id="memberIdBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectMemberByIdErr"></span>
					</span>
					
				

			</div>
			<hr class="hr0">
			<div>
				
					<label for="selectMemberAccountText">Nickname 搜尋</label> 
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
				
					<label for="deleteMemberText">刪除 Member</label> <input autocomplete="off"
						id="deleteMemberText" type="number" name="deletememberId" placeholder="memberId">
					<span>
					<input id="deleteMemberBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="deleteMemberErr"></span>
					</span>
				
			</div>

		</div>

		<!-- TicketOrder============================================================================== -->

		<div class="areas" id="ticketorder" style="display: none">
		
			<div >
				<input id="showAllOrderBtn" type="button" class="btn btn-danger btn-lg" 
				value="Order總覽" onclick="showAllOrder()">
			</div>

			<div>
				<form id="selectOrderIdForm" autocomplete="off"
					action="<c:url value="/BackStageSelectOrderById.controller"/>"
					method="POST">
					<label for="selectOrderIdText">單筆查詢</label> 
					<input
						id="selectOrderIdText" type="number" name="orderId" placeholder="ticketOrderId"> 
					<span>
					<input
						id="selectOrderIdBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectOrderIdErr"></span>
					</span>
				</form>
			</div>

			<hr class="hr0">
			<div>
				<form id="selectOrderMemberForm" autocomplete="off"
					action="<c:url value="/BackStageSelectOrderByMember.controller"/>"
					method="POST">
					<label for="selectOrderMemberText">會員訂單</label> 
					<input
						id="selectOrderMemberText" type="number" name="memberId" placeholder="memberId">
					<span>
					<input id="selectOrderMemberBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectOrderMemberErr"></span>
					</span>
				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="selectOrderActForm" autocomplete="off"
					action="<c:url value="/BackStageSelectOrderByActivity.controller"/>"
					method="POST">
					<label for="selectOrderActText">活動訂單</label> 
					<input
						id="selectOrderActText" type="number" name="activityId" placeholder="activityId"> 
					<span>
					<input
						id="selectOrderActBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectOrderActErr"></span>
					</span>
				</form>
			</div>
		</div>

		<!-- ProgramComment========================================================================-->

		<div class="areas" id="programcomment" style="display: none;">
		
			<div >
				<input id="showAllCommentBtn" type="button" class="btn btn-danger btn-lg" 
				value="Comment總覽" onclick="showAllComment()">
			</div>	
			<div>

				<form id="selectCommentIdForm" autocomplete="off"
					action="<c:url value="/BackStageSelectCommentById.controller"/>"
					method="POST">
					<label for="selectCommentIdText">留言查詢</label> 
					<input
						id="selectCommentIdText" type="number" name="commentId" placeholder="commentId"> 
					<span>
					<input
						id="selectCommentIdBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectCommentIdErr"></span>
					</span>
				</form>
			</div>
			<hr class="hr0">
			<div>

				<form id="selectCommentMemberForm" autocomplete="off"
					action="<c:url value="/BackStageSelectCommentByMember.controller"/>"
					method="POST">
					<div>
						<label  for="selectCommentMemberMText">
							留言會員</label> 
						<input 
							id="selectCommentMemberMText" type="number"
							name="commentmemberId" placeholder="memberId">
					</div>
					<div>
						<label  for="selectCommentMemberPText">
							哪位播客</label> 
							<input 
							id="selectCommentMemberPText" type="number"
							name="commentpodcasterId" placeholder="podcasterId">
						
						<span>
						<input id="selectCommentMemberBtn" type="button" value="send"
							class="btn btn-warning">
						<span id="selectCommentMemerErr"></span>
						</span>
					</div>

				</form>

			</div>
			<hr class="hr0">
			<div>

				<form id="selectCommentPodcasterForm" autocomplete="off"
					action="<c:url value="/BackStageSelectCommentByPodcaster.controller"/>"
					method="POST">
					<label for="selectCommentPodcasterText">播客所有留言</label>
					<input id="selectCommentPodcasterText" type="number"
						name="commentpodcasterId" placeholder="podcasterId"> 
					<span>
					<input
						id="selectCommentPodcasterBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="selectCommentPodcasterErr"></span>
					</span>
				</form>

			</div>
			<hr class="hr0">
			<div>


				<form id="deleteCommentIdForm" autocomplete="off"
					action="<c:url value="/BackStageDeleteCommentById.controller"/>"
					method="POST">
					<label for="deleteCommentIdText">刪除留言</label> 
					<input
						id="deleteCommentIdText" type="number" name="commentId" placeholder="commentId"> 
					<span>
					<input
						id="deleteCommentIdBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="deleteCommentIdErr"></span>
					</span>
				</form>

			</div>
			<hr class="hr0">
			<div>

				<form id="deleteCommentMemberForm" autocomplete="off"
					action="<c:url value="/BackStageDeleteCommentByMember.controller"/>"
					method="POST">

					<div>
						<label  for="deleteCommentMemberMText">
							刪除會員留言</label> 
							<input 
							 id="deleteCommentMemberMText" type="number"
							name="commentMemberId"  placeholder="memberId"> 
					</div>

					<div>
						<label  for="deleteCommentMemberPText">
							哪位播客</label> 
						<input 
							id="deleteCommentMemberPText" type="number"
							name="commentPodcasterId"  placeholder="podcasterId">
						<span>
						<input id="deleteCommentMemberBtn" type="button" value="send"
							class="btn btn-warning">
						<span id="deleteCommentMemberErr"></span>
						</span>
					</div>

				</form>

			</div>

		</div>

		<!-- Category========================================================================-->
		<div class="areas" id="category" style="display: none;">

			<div >
				<input id="showAllCategoryBtn" type="button" class="btn btn-danger btn-lg" 
				value="Category總覽" onclick="showAllCategory()">
			</div>

			<div>
				<form id="setNewCategoryForm" autocomplete="off"
					action="<c:url value="/BackStageSetNewCategory.controller"/>"
					method="POST">
					<label for="setNewCategoryText">新增類別</label> 
					<input id="setNewCategoryText" 
					type="text" name="categoryName" placeholder="categoryName"> 
					<span>
					<input
						id="setNewCategoryBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="setNewCategoryErr"></span>
					</span>
				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="upgradeCategoryForm" autocomplete="off"
					action="<c:url value="/BackStageUpdateCategoryById.controller"/>"
					method="POST">
					<div>
						<label for="upgradeCategoryIdText">修改類別</label> 
						<input
							id="upgradeCategoryIdText" type="number" name="categoryId" placeholder="categoryId">
					</div>

					<div>
						<label for="upgradeCategoryNameText">新類別名</label> 
						<input
							id="upgradeCategoryNameText" type="text" name="categoryNewName" placeholder="categoryName">
						<span>
						<input id="upgradeCategoryBtn"
							type="button" value="send" class="btn btn-warning">
						<span id="upgradeCategoryErr"></span>
						</span>
					</div>

				</form>
			</div>

		</div>

		<!-- Subscription========================================================================-->

		<div class="areas" id="subscription" style="display: none;">
		
			<div >
				<input id="showAllSubBtn" type="button" class="btn btn-danger btn-lg" 
				value="Sub總覽" onclick="showAllSub()">
			</div>

			<div>
				<form id="selectSubMemberForm" autocomplete="off"
					action="<c:url value="/SelectSubscriptionByMember.controller"/>"
					method="POST">
					<label for="selectSubMemberText">會員訂閱一覽</label> <input
						id="selectSubMemberText" type="number" name="memberId"
						placeholder="MemberId"> <span> <input
						id="selectSubMemberBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectSubMemberErr"></span>
					</span>

				</form>
			</div>
			<hr class="hr0">

			<div>
				<form id="selectSubPodcasterForm" autocomplete="off"
					action="<c:url value="/SelectSubscriptionByPodcaster.controller"/>"
					method="POST">
					<label for="selectSubPodcasterText">播客訂閱一覽</label>
					<input id="selectSubPodcasterText" type="number" name="podcasterId"
						placeholder="PodcasterId"> <span> <input
						id="selectSubPodcasterBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectSubPodcasterErr"></span>
					</span>

				</form>
			</div>

		</div>


		<!-- Activity========================================================================-->
		<div class="areas" id="activity" style="display: none;">

			<div >
				<input id="showAllActivityBtn" type="button" class="btn btn-danger btn-lg" 
				value="Activity總覽" onclick="showAllActivity()">
			</div>

			<div>
				<form id="selectActIdForm" autocomplete="off"
					action="<c:url value="/SelectActivityById.controller"/>"
					method="POST">
					<label for="selectActIdText">活動查詢</label> <input
						id="selectActIdText" type="number" name="activityId"
						placeholder="ActivityId"> <span> <input
						id="selectActIdBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectActIdErr"></span>
					</span>

				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="selectActPodcasterForm" autocomplete="off"
					action="<c:url value="/SelectActivityByPodcaster.controller"/>"
					method="POST">
					<label for="selectActPodcasterText">播客活動查詢</label> <input
						id="selectActPodcasterText" type="number" name="podcasterId"
						placeholder="PodcasterId"> <span> <input
						id="selectActPodcasterBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectActPodcasterErr"></span>
					</span>
				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="selectActDateForm" autocomplete="off"
					action="<c:url value="/SelectActivityByDate.controller"/>"
					method="POST">
					<label for="selectActDateText">依日期搜尋活動</label> <input
						id="selectActDateText" type="text" name="activityDate"
						placeholder="YYYY-mm-dd"> <span> <input
						id="selectActDateBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectActDateErr"></span>
					</span>
				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="deleteActIdForm" autocomplete="off"
					action="<c:url value="/DeleteActivityByID.controller"/>"
					method="POST">
					<label for="deleteActIdText">刪除活動</label> <input
						id="deleteActIdText" type="number" name="activityId"
						placeholder="ActivityId"> <span> <input
						id="deleteActIdBtn" type="button" value="send"
						class="btn btn-warning"> <span id="deleteActIdErr"></span>
					</span>
				</form>
			</div>

		</div>

		<!-- History========================================================================-->

		<div class="areas" id="history" style="display: none;">
		
			<div >
				<input id="showAllHistoryBtn" type="button" class="btn btn-danger btn-lg" 
				value="History總覽" onclick="showAllHistory()">
			</div>

			<div>
				<form id="selectHistoryIdForm" autocomplete="off"
					action="<c:url value="/SelectHistoryById.controller"/>"
					method="POST">
					<label for="selectHistoryIdText">查詢紀錄</label> <input
						id="selectHistoryIdText" type="number" name="historyId"
						placeholder="historyId">
					<sapn> <input id="selectHistoryIdBtn" type="button"
						value="send" class="btn btn-warning"> <span
						id="selectHistoryIdErr"></span> </sapn>
				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="selectHistoryMemberForm" autocomplete="off"
					action="<c:url value="/SelectHistoryByMember.controller"/>"
					method="POST">
					<label for="selectHistoryMemberText">會員紀錄</label> <input
						id="selectHistoryMemberText" type="number" name="memberId"
						placeholder="memberId"> <span> <input
						id="selectHistoryMemberBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectHistoryMemberErr"></span>
					</span>
				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="selectHistoryPodcasterForm" autocomplete="off"
					action="<c:url value="/SelectHistoryByPodcaster.controller"/>"
					method="POST">
					<label for="selectHistoryPodcasterText">
					播客紀錄</label> <input id="selectHistoryPodcasterText" type="number"
						name="podcasterId" placeholder="podcasterId">
					<sapn> <input id="selectHistoryPodcasterBtn" type="button"
						value="send" class="btn btn-warning"> <span
						id="selectHistoryPodcasterErr"></span> </sapn>
				</form>

			</div>
			<hr class="hr0">
			<div>
				<form id="selectHistoryLastForm" autocomplete="off"
					action="<c:url value="/SelectHistoryByLastListen.controller"/>"
					method="POST">
					<label for="selectHistoryLastText">依收聽時間</label> <input
						id="selectHistoryLastText" type="text" name="historyLastListen"
						placeholder="YYYY-mm-dd"> <span> <input
						id="selectHistoryLastBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectHistoryLastErr"></span>
					</span>
				</form>

			</div>
			<hr class="hr0">
			<div>
				<form id="deleteHistoryDateForm" autocomplete="off"
					action="<c:url value="/DeleteHistoryByDate.controller"/>"
					method="POST">
					<label for="deleteHistoryDateText">批量刪除紀錄</label> <input
						id="deleteHistoryDateText" type="text" name="historyDeleteDate"
						placeholder="YYYY-mm-dd"> <span> <input
						id="deleteHistoryDateBtn" type="button" value="send"
						class="btn btn-warning"> <span id="deleteHistoryDateErr"></span>
					</span>
				</form>

			</div>


		</div>

		<!-- Podcast========================================================================-->


		<div class="areas" id="podcast" style="display: none;">
		
			<div >
				<input id="showAllPodcastBtn" type="button" class="btn btn-danger btn-lg" 
				value="Podcast總覽" onclick="showAllPodcast()">
			</div>

			<div>
				<form id="selectPodcastMemberForm" autocomplete="off"
					action="<c:url value="/SelectPodcastByMember.controller"/>"
					method="POST">
					<label for="selectPodcastMemberText">播客節目列表</label> <input
						id="selectPodcastMemberText" type="number" name="memberId"
						placeholder="memberId"> <span> <input
						id="selectPodcastMemberBtn" type="button" value="send"
						class="btn btn-warning"> <span id="selectPodcastMemberErr"></span>
					</span>
				</form>

			</div>
			<hr class="hr0">
			<div>
				<form id="deletePodcastIdForm" autocomplete="off"
					action="<c:url value="/DeletePodcastbyId.controller"/>"
					method="POST">
					<label for="deletePodcastIdText">刪除節目</label> <input
						id="deletePodcastIdText" type="number" name="podcastId"
						placeholder="podcastId"> <span> <input
						id="deletePodcastIdBtn" type="button" value="send"
						class="btn btn-warning"> <span id="deletePodcastIdErr"></span>
					</span>
				</form>

			</div>

			<hr class="hr0">

			<div>
				<form id="topPodcastForm" autocomplete="off"
					action="<c:url value="/TopPodcst.controller"/>" method="POST">
					<label for="topPodcastText">區間熱門節目</label> <input
						id="topPodcastText" type="text" name="uploadTime"
						placeholder="YYYY-mm-dd"> <span> <input
						id="topPodcastBtn" type="button" value="send"
						class="btn btn-warning"> <span id="topPodcastErr"></span>
					</span>
				</form>

			</div>

		</div>

		<!-- Income Calculate========================================================================-->

		<div class="areas" id="income" style="display: none;">

			<div>
				<form id="subIncomeForm" autocomplete="off"
					action="<c:url value="/SubscriptionIncome.controller"/>"
					method="POST">
					<div>
						<label for="subIncomeSDText">訂閱收入(起)</label> <input
							id="subIncomeSDText" type="text" name="startDate"
							placeholder="YYYY-mm-dd">
					</div>
					<div>
						<label for="subIncomeEDText">訂閱收入(迄)</label> <input
							id="subIncomeEDText" type="text" name="endDate"
							placeholder="YYYY-mm-dd"> <span> <input
							id="subIncomeBtn" type="button" value="send"
							class="btn btn-warning"> <span id="subIncomeErr"></span>
						</span>
					</div>
				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="ticketIncomeForm" autocomplete="off"
					action="<c:url value="/TicketIncome.controller"/>" method="POST">
					<div>
						<label for="ticketIncomeSDText">票券收入(起)</label> <input
							id="ticketIncomeSDText" type="text" name="startDate"
							placeholder="YYYY-mm-dd">
					</div>
					<div>
						<label for="ticketIncomeEDText">票券收入(迄)</label> <input
							id="ticketIncomeEDText" type="text" name="endDate"
							placeholder="YYYY-mm-dd"> <span> <input
							id="ticketIncomeBtn" type="button" value="send"
							class="btn btn-warning"> <span id="ticketIncomeErr"></span>
						</span>
					</div>
				</form>
				<br>
			</div>

		</div>

<!-- LogOut========================================================================-->

		<div class="areas" id="logout" style="display: none;">
			<form id="logoutForm" action="<c:url value="logout"/>" method="GET">
			<input id="logoutBtn" type="button" value="登出" class="btn btn-warning">
			</form>
		</div>

	</div>
	<!--上面的是DIV.WRAP結束TAG/下面這是選取區域的DIV結束TAG -->
	</div>

	<div class="col-sm-6" style="background-color: #DCDCDC;height:600px">
	<!-- AJAX動態生成查詢結果 -->
		<h2 id="resultTag" style="text-align:center;margin-top: 15px;color:black">查詢結果:</h2>
		<div id="ajaxTable" style="margin:0px auto;margin-top: 10px;">
			<img src="./img/magnifier3.png" alt="" style="margin-left:50px;margin-top:10px;">
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
		let ajaxtable=document.getElementById("ajaxTable");
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
					ajaxtable.innerHTML="<h1 style='color:red;text-align:center;'>查無結果!</h1>"
				}

				let content="";
				
				for(var i=0;i<selectMember.length;i++){
				content+=
				"<table  class='ta'>"
				+"<tr>"	
				+"<th>MemberId</th>"	
				+"<th>Account</th>"
				+"<th>Password</th>"
				+"<th>Name</th>"
				+"<th>NickName</th>"
				+"<th>Birthday</th>"
				+"<th>RegisterDate</th>"
				+"</tr>"
				+"</tr>"
				+"<tr>"
				+"<td rowspan='5'>"+selectMember[i].memberId+"</td>"
				+"<td>"+selectMember[i].account+"</td>"
				+"<td>"+selectMember[i].password+"</td>"
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
				
				
				ajaxtable.innerHTML=content;
		}
	}
	}

	
	
</script>

	<script type="text/javascript"
		src="<c:url value='/js/BackStageSelect.js'/>"></script>


</body>
</html>