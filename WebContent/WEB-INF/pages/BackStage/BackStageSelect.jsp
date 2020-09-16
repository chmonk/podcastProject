<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Select</title>

<style>
p{
	color:red;
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
	
		
	
</head>
<body onload="fff();showhide();columnTestify()">
	


	<div class="container-fluid"
		style="margin: 0px auto; text-align: center;">

		<h2>BackStage Function Select</h2>

		<form>
			<select id="options" name="options" onchange="fff();showhide()">
				<option value="members">Members</option>
				<option value="ticketorder">TicketOrder</option>
				<option value="programcomment">ProgramComment</option>
				<option value="category">Category</option>
				<option value="subscription">Subscription</option>
				<option value="activity">Activity</option>
				<option value="history">History</option>
				<option value="income">Income</option>
			</select>
			<!-- <input type="submit" value="send"> -->
		</form>


		<div>
			<h3 id="result"></h3>
		</div>
	</div>

		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">

				<!-- MembersFunction============================================================================== -->

				<div class="areas" id="members"
					style="background-color: #FFB100; display: none; padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">
					
						<h4 style="color: #0067FF">Select Member By Id:</h4>
						<form id="selectMemberByIdForm" action="<c:url value="/BackStageSelectMember.controller"/>"
							method="POST">
							<input id="selectMemberIdText" type="text" name="selectmemberId">
							<input id="memberIdBtn" type="button" value="send"><br>
							<p id="selectMemberByIdErr" ></p>
						</form><br>

						<h4 style="color: #0067FF">Select Member By Account:</h4>
						<form id="selectMemberByAccountForm"
							action="<c:url value="/BackStageSelectMemberByAccount.controller"/>"
							method="POST">
							<input id="selectMemberAccountText" type="text" name="account">
							<input id="selectMemberAccountBtn" type="button" value="send"><br>
							<p id="selectMemberAccountErr"></p>
						</form><br>

						<h4 style="color: #0067FF">Delete Member:</h4>
						<form id="deleteMemberForm" action="<c:url value="/BackStageDeleteMember.controller"/>"
							method="POST">
							<input id="deleteMemberText" type="text" name="deletememberId"> 
							<input id="deleteMemberBtn" type="button" value="send"> <br>
							<p id="deleteMemberErr"></p>
						</form>
					</div>
				</div>

				<!-- TicketOrder============================================================================== -->

				<div class="areas" id="ticketorder"
					style="background-color: #00C7FF; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">
					
					<h4 style="color: #FF4500">Select Order By Id:</h4>
					<form id="selectOrderIdForm"
						action="<c:url value="/BackStageSelectOrderById.controller"/>"
						method="POST">
						<input id="selectOrderIdText" type="text" name="orderId"> 
						<input id="selectOrderIdBtn" type="button" value="send"><br>
						<p id="selectOrderIdErr"></p>
					</form><br>

					<h4 style="color: #FF4500">Select Order By Member:</h4>
					<form id="selectOrderMemberForm"
						action="<c:url value="/BackStageSelectOrderByMember.controller"/>"
						method="POST">
						<input id="selectOrderMemberText" type="text" name="memberId"> 
						<input id="selectOrderMemberBtn" type="button" value="send"><br>
						<p id="selectOrderMemberErr"></p>
					</form><br>

					<h4 style="color: #FF4500">Select Order By Activity:</h4>
					<form id="selectOrderActForm"
						action="<c:url value="/BackStageSelectOrderByActivity.controller"/>"
						method="POST">
						<input id="selectOrderActText" type="text" name="activityId"> 
						<input id="selectOrderActBtn" type="button" value="send"><br>
						<p id="selectOrderActErr"></p>
					</form><br>
					
					</div>
					
				</div>

				<!-- ProgramComment============================================================================== -->

				<div class="areas" id="programcomment"
					style="background-color: #94FF00; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">
										
					<h4 style="color: #972031">Select Comment By ID:</h4>
					<form id="selectCommentIdForm"
						action="<c:url value="/BackStageSelectCommentById.controller"/>"
						method="POST">
						<input id="selectCommentIdText" type="text" name="commentId"> 
						<input id="selectCommentIdBtn" type="button" value="send"><br>
						<p id="selectCommentIdErr"></p>
					</form><br>

					<h4 style="color: #972031">Select Comment By Member:</h4>
					<form id="selectCommentMemberForm"
						action="<c:url value="/BackStageSelectCommentByMember.controller"/>"
						method="POST">
						<input id="selectCommentMemberMText" type="text" name="commentmemberId"><br>
						memberId <br>
						<input id="selectCommentMemberPText" type="text" name="commentpodcasterId"><br>
						podcasterId <br>
						<input id="selectCommentMemberBtn" type="button" value="send"><p id="selectCommentMemerErr"></p>
					</form><br>

					<h4 style="color: #972031">Select Comment By Podcaster:</h4>
					<form id="selectCommentPodcasterForm"
						action="<c:url value="/BackStageSelectCommentByPodcaster.controller"/>"
						method="POST">
						<input id="selectCommentPodcasterText" type="text" name="commentpodcasterId"> 
						<input id="selectCommentPodcasterBtn" type="button" value="send"><br>
						<p id="selectCommentPodcasterErr"></p>
					</form><br>

					<h4 style="color: #972031">Delete Comment By Id:</h4>
					<form id="deleteCommentIdForm"
						action="<c:url value="/BackStageDeleteCommentById.controller"/>"
						method="POST">
						<input id="deleteCommentIdText" type="text" name="commentId"> 
						<input id="deleteCommentIdBtn" type="button" value="send"><br>
						<p id="deleteCommentIdErr"></p>
					</form><br>

					<h4 style="color: #972031">Delete Comment By Member:</h4>
					<form id="deleteCommentMemberForm"
						action="<c:url value="/BackStageDeleteCommentByMember.controller"/>"
						method="POST">
						<input id="deleteCommentMemberMText" type="text" name="commentMemberId"> <br>
						memberId<br>
						<input id="deleteCommentMemberPText" type="text" name="commentPodcasterId"><br>
						podcasterId<br>
						<input id="deleteCommentMemberBtn" type="button" value="send"><p id="deleteCommentMemberErr"></p>
					</form><br>
					
					</div>
					
				</div>

				<!-- Category============================================================================== -->

				<div class="areas" id="category"
					style="background-color: #FFB100; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #0067FF">Set New Category:</h4>
					<form id="setNewCategoryForm"
						action="<c:url value="/BackStageSetNewCategory.controller"/>"
						method="POST">
						<input id="setNewCategoryText" type="text" name="categoryName"> 
						<input id="setNewCategoryBtn" type="button" value="send"><br> 
						<p id="setNewCategoryErr"></p>
					</form><br>

					<h4 style="color: #0067FF">Update Category:</h4>
					<form id="upgradeCategoryForm"
						action="<c:url value="/BackStageUpdateCategoryById.controller"/>"
						method="POST">
						<input id="upgradeCategoryIdText" type="text" name="categoryId"><br>
						categoryId<br> 
						<input id="upgradeCategoryNameText" type="text" name="categoryNewName"><br>
						categoryNewName<br>

						<input id="upgradeCategoryBtn" type="button" value="send">
						<p id="upgradeCategoryErr"></p>
					</form><br>
					
					</div>
					
				</div>

				<!--Subscription============================================================================== -->

				<div class="areas" id="subscription"
					style="background-color: #00C7FF; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #FF4500">Select Subscription By Member:</h4>
					<form id="selectSubMemberForm"
						action="<c:url value="/SelectSubscriptionByMember.controller"/>"
						method="POST">
						<input id="selectSubMemberText" type="text" name="memberId"> 
						<input id="selectSubMemberBtn" type="button" value="send"><br>
						<p id="selectSubMemberErr"></p>
					</form><br>

					<h4 style="color: #FF4500">Select Subscription By Podcaster:</h4>
					<form id="selectSubPodcasterForm"
						action="<c:url value="/SelectSubscriptionByPodcaster.controller"/>"
						method="POST">
						<input id="selectSubPodcasterText" type="text" name="podcasterId"> 
						<input id="selectSubPodcasterBtn" type="button" value="send"><br>
						<p id="selectSubPodcasterErr"></p>
					</form><br>

					</div>

				</div>

				<!-- activity============================================================================== -->

				<div class="areas" id="activity"
					style="background-color: #94FF00; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #972031">Select Activity By ID:</h4>
					<form id="selectActIdForm"
						action="<c:url value="/SelectActivityById.controller"/>"
						method="POST">
						<input id="selectActIdText" type="text" name="activityId"> 
						<input id="selectActIdBtn" type="button" value="send"><br>
						<p id="selectActIdErr"></p>
					</form><br>

					<h4 style="color: #972031">Select Activity By Podcaster:</h4>
					<form id="selectActPodcasterForm"
						action="<c:url value="/SelectActivityByPodcaster.controller"/>"
						method="POST">
						<input id="selectActPodcasterText" type="text" name="podcasterId"> 
						<input id="selectActPodcasterBtn" type="button" value="send"><br>
						<p id="selectActPodcasterErr"></p>
					</form><br>

					<h4 style="color: #972031">Select Activity By Date:</h4>
					<form id="selectActDateForm"
						action="<c:url value="/SelectActivityByDate.controller"/>"
						method="POST">
						<input id="selectActDateText" type="text" name="activityDate" placeholder="YYYY-mm-dd"> 
						<input id="selectActDateBtn" type="button" value="send"><br>
						<p id="selectActDateErr"></p>
					</form><br>

					<h4 style="color: #972031">Delete Activity By ID:</h4>
					<form id="deleteActIdForm" 
						action="<c:url value="/DeleteActivityByID.controller"/>"
						method="POST">
						<input id="deleteActIdText"  type="text" name="activityId"> 
						<input id="deleteActIdBtn"  type="button" value="send"><br>
						<p id="deleteActIdErr" ></p>
					</form><br>
					
					</div>


				</div>

				<!-- History============================================================================== -->

				<div class="areas" id="history"
					style="background-color: #FFB100; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">
					
					<h4 style="color: #0067FF">Select History By ID:</h4>
					<form id="selectHistoryIdForm"
						action="<c:url value="/SelectHistoryById.controller"/>"
						method="POST">
						<input id="selectHistoryIdText" type="text" name="historyId"> 
						<input id="selectHistoryIdBtn" type="button" value="send"><br>
						<p id="selectHistoryIdErr"></p>
					</form><br>

					<h4 style="color: #0067FF">Select History By Member:</h4>
					<form id="selectHistoryMemberForm"
						action="<c:url value="/SelectHistoryByMember.controller"/>"
						method="POST">
						<input id="selectHistoryMemberText" type="text" name="memberId"> 
						<input id="selectHistoryMemberBtn" type="button" value="send"><br>
						<p id="selectHistoryMemberErr"></p>
					</form><br>

					<h4 style="color: #0067FF">Select History By Podcaster:</h4>
					<form id="selectHistoryPodcasterForm"
						action="<c:url value="/SelectHistoryByPodcaster.controller"/>"
						method="POST">
						<input id="selectHistoryPodcasterText" type="text" name="podcasterId"> 
						<input id="selectHistoryPodcasterBtn" type="button" value="send"><br>
						<p id="selectHistoryPodcasterErr"></p>
					</form><br>

					<h4 style="color: #0067FF">Select History By LastListen:</h4>
					<form id="selectHistoryLastForm"
						action="<c:url value="/SelectHistoryByLastListen.controller"/>"
						method="POST">
						<input id="selectHistoryLastText" type="text" name="historyLastListen" placeholder="YYYY-mm-dd"> 
						<input id="selectHistoryLastBtn" type="button" value="send"><br>
						<p id="selectHistoryLastErr"></p>
					</form><br>

					<h4 style="color: #0067FF">Delete history By Date:</h4>
					<form id="deleteHistoryDateForm"
						action="<c:url value="/DeleteHistoryByDate.controller"/>"
						method="POST">
						<input id="deleteHistoryDateText" type="text" name="historyDeleteDate" placeholder="YYYY-mm-dd"> 
						<input id="deleteHistoryDateBtn" type="button" value="send"><br>
						<p id="deleteHistoryDateErr"></p>
					</form><br>
					
					</div>

				</div>

				<!-- Income Calculate============================================================================== -->

				<div class="areas" id="income"
					style="background-color: #DD77FF; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #6EE98F">Subscription Income:</h4>
					<form id="subIncomeForm"
						action="<c:url value="/SubscriptionIncome.controller"/>"
						method="POST">
						<input id="subIncomeSDText" type="text" name="startDate"  placeholder="YYYY-mm-dd"><br>
						StartDate<br>
						 <input id="subIncomeEDText" type="text" name="endDate" placeholder="YYYY-mm-dd"><br>
						 EndDate<br>
						  <input id="subIncomeBtn" type="button" value="send">
						  <p id="subIncomeErr"></p>
					</form><br>

					<h4 style="color: #6EE98F">Ticket Income:</h4>
					<form id="ticketIncomeForm"
						action="<c:url value="/TicketIncome.controller"/>"
						method="POST">
						<input id="ticketIncomeSDText" type="text" name="startDate" placeholder="YYYY-mm-dd"><br>
						StartDate<br> 
						<input id="ticketIncomeEDText" type="text" name="endDate"  placeholder="YYYY-mm-dd"><br>
						EndDate<br> 
						<input id="ticketIncomeBtn" type="button" value="send">
						<p id="ticketIncomeErr"></p>
					</form><br>
					
					</div>
					
				</div>

			</div>

			<div class="col-sm-4"></div>

		<div>
			
		</div>
		
		</div>

<script type="text/javascript" src="<c:url value='/js/BackStageSelect.js'/>"></script>

</body>
</html>