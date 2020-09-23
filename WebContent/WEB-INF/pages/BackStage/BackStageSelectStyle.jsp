<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Select</title>


<style>

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
	background-color: #949494;
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
	width: 400px;
	margin: 0px auto
}

div.wrap div {
	position: relative;
	margin: 50px 0;
}

label {
	position: absolute;
	top: 0;
	font-size: 30px;
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

</head>

<body id="body" onload="showhide();columnTestify()">

	<div class="wrap">
	
		<div>
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

		<div class="areas" id="members" style="display: none;">
			<div >
			<form action="<c:url value="/showAllMember"/>" method="POST" target="_blank">
				<input id="showAllMemberBtn" type="submit" class="btn btn-danger btn-lg" value="Member總覽">
			</form>
			</div>	
			<div>
				<form id="selectMemberByIdForm" autocomplete="off"
					action="<c:url value="/BackStageSelectMember.controller"/>"
					method="POST">
					<label for="selectMemberIdText">Member 詳情</label> <input
						id="selectMemberIdText" type="number" name="selectmemberId" placeholder="memberId">
					<span>
					<input id="memberIdBtn" type="button" value="send"
						class="btn btn-warning"><span id="selectMemberByIdErr"></span>
					</span>
					
				</form>

			</div>
			<hr class="hr0">
			<div>
				<form id="selectMemberByAccountForm" autocomplete="off"
					action="<c:url value="/BackStageSelectMemberByAccount.controller"/>"
					method="POST">
					<label for="selectMemberAccountText">Nickname 搜尋</label> 
						<input id="selectMemberAccountText" type="text"
						name="account" placeholder="nickname"> 
					<span>
					<input id="selectMemberAccountBtn"
						type="button" value="send" class="btn btn-warning">
					<span id="selectMemberAccountErr"></span>
					</span>

				</form>
			</div>
			<hr class="hr0">
			<div>
				<form id="deleteMemberForm" autocomplete="off"
					action="<c:url value="/BackStageDeleteMember.controller"/>"
					method="POST">
					<label for="deleteMemberText">刪除 Member</label> <input
						id="deleteMemberText" type="number" name="deletememberId" placeholder="memberId">
					<span>
					<input id="deleteMemberBtn" type="button" value="send"
						class="btn btn-warning">
					<span id="deleteMemberErr"></span>
					</span>
				</form>
			</div>

		</div>

		<!-- TicketOrder============================================================================== -->

		<div class="areas" id="ticketorder" style="display: none">

			<div>
				<form id="selectOrderIdForm" autocomplete="off"
					action="<c:url value="/BackStageSelectOrderById.controller"/>"
					method="POST">
					<label for="selectOrderIdText">Find Order</label> 
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
					<label for="selectOrderMemberText">Find Order By Member</label> 
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
					<label for="selectOrderActText">Find Order By Activity</label> 
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
			<div>

				<form id="selectCommentIdForm" autocomplete="off"
					action="<c:url value="/BackStageSelectCommentById.controller"/>"
					method="POST">
					<label for="selectCommentIdText">Find Comment</label> 
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
						<label class="double" for="selectCommentMemberMText">
							Comment By Member</label> 
						<input class="dinput"
							id="selectCommentMemberMText" type="number"
							name="commentmemberId" placeholder="memberId">
					</div>
					<div>
						<label class="double" for="selectCommentMemberPText">
							Under Which Podcaster</label> 
							<input class="dinput"
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
					<label for="selectCommentPodcasterText">Comment by Podcaster</label>
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
					<label for="deleteCommentIdText">Delete Comment</label> 
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
						<label class="double" for="deleteCommentMemberMText">Delete
							Comment By Member</label> 
							<input 
							class="dinput" id="deleteCommentMemberMText" type="number"
							name="commentMemberId"  placeholder="memberId"> 
					</div>

					<div>
						<label class="double" for="deleteCommentMemberPText">Under
							Which Podcaster</label> 
						<input class="dinput"
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

			<div>
				<form id="setNewCategoryForm" autocomplete="off"
					action="<c:url value="/BackStageSetNewCategory.controller"/>"
					method="POST">
					<label for="setNewCategoryText">Set New Category</label> 
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
						<label for="upgradeCategoryIdText">Update Category</label> 
						<input
							id="upgradeCategoryIdText" type="number" name="categoryId" placeholder="categoryId">
					</div>

					<div>
						<label for="upgradeCategoryNameText">To New Name</label> 
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

			<div>
				<form id="selectSubMemberForm" autocomplete="off"
					action="<c:url value="/SelectSubscriptionByMember.controller"/>"
					method="POST">
					<label for="selectSubMemberText">Subscription By Member</label> <input
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
					<label for="selectSubPodcasterText">Subscription By Podcaster</label>
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

			<div>
				<form id="selectActIdForm" autocomplete="off"
					action="<c:url value="/SelectActivityById.controller"/>"
					method="POST">
					<label for="selectActIdText">Find Activity</label> <input
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
					<label for="selectActPodcasterText">Activity By Podcaster</label> <input
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
					<label for="selectActDateText">Activity By Date</label> <input
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
					<label for="deleteActIdText">Delete Activity</label> <input
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

			<div>
				<form id="selectHistoryIdForm" autocomplete="off"
					action="<c:url value="/SelectHistoryById.controller"/>"
					method="POST">
					<label for="selectHistoryIdText">Find History</label> <input
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
					<label for="selectHistoryMemberText">History By Member</label> <input
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
					<label for="selectHistoryPodcasterText">History By
						Podcaster</label> <input id="selectHistoryPodcasterText" type="number"
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
					<label for="selectHistoryLastText">History By Last Listen</label> <input
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
					<label for="deleteHistoryDateText">Delete History By Date</label> <input
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

			<div>
				<form id="selectPodcastMemberForm" autocomplete="off"
					action="<c:url value="/SelectPodcastByMember.controller"/>"
					method="POST">
					<label for="selectPodcastMemberText">Podcast By Member</label> <input
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
					<label for="deletePodcastIdText">Delete Podcast</label> <input
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
					<label for="topPodcastText">Popular Podcast</label> <input
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
						<label for="subIncomeSDText">Sub Income StartDate</label> <input
							id="subIncomeSDText" type="text" name="startDate"
							placeholder="YYYY-mm-dd">
					</div>
					<div>
						<label for="subIncomeEDText">Sub Income EndDate</label> <input
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
						<label for="ticketIncomeSDText">Ticket Income StartDate</label> <input
							id="ticketIncomeSDText" type="text" name="startDate"
							placeholder="YYYY-mm-dd">
					</div>
					<div>
						<label for="ticketIncomeEDText">Ticket Income EndDate</label> <input
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
	
	<script>
	document.getElementById("logoutBtn").onclick=function(){
		var r=confirm("確定要登出?")
		if(r==true){
			document.getElementById("logoutForm").submit();
			return true;
		}else{
	
		}		
		
	}
	</script>

	<script type="text/javascript"
		src="<c:url value='/js/BackStageSelect.js'/>"></script>


</body>
</html>