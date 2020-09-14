<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Select</title>
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
<body onload="fff();showhide()">
	<script>
		function fff() {
			let oValue = document.getElementById('options');
			console.log(oValue.value);
			document.getElementById("result").innerHTML = oValue.value;
		}

		function showhide() {
			var x = document.getElementById('options');
			var xv = x.value;
			let displayobj = document.getElementById(xv);
			let areas = document.getElementsByClassName('areas');
			var i;
			for (i = 0; i < areas.length; i++) {
				areas[i].style.display = "none";
			}

			displayobj.style.display = "block";

		}
	</script>


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
						<form action="<c:url value="/BackStageSelectMember.controller"/>"
							method="POST">
							<input type="text" name="selectmemberId"> <input
								type="submit" value="send">
						</form><br>

						<h4 style="color: #0067FF">Select Member By Account:</h4>
						<form
							action="<c:url value="/BackStageSelectMemberByAccount.controller"/>"
							method="POST">
							<input type="text" name="account"> <input type="submit"
								value="send">
						</form><br>

						<h4 style="color: #0067FF">Delete Member:</h4>
						<form action="<c:url value="/BackStageDeleteMember.controller"/>"
							method="POST">
							<input type="text" name="deletememberId"> <input
								type="submit" value="send"> ${msg}<br>
						</form>
					</div>
				</div>

				<!-- TicketOrder============================================================================== -->

				<div class="areas" id="ticketorder"
					style="background-color: #00C7FF; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">
					
					<h4 style="color: #FF4500">Select Order By Id:</h4>
					<form
						action="<c:url value="/BackStageSelectOrderById.controller"/>"
						method="POST">
						<input type="text" name="orderId"> <input type="submit"
							value="send">
					</form><br>

					<h4 style="color: #FF4500">Select Order By Member:</h4>
					<form
						action="<c:url value="/BackStageSelectOrderByMember.controller"/>"
						method="POST">
						<input type="text" name="memberId"> <input type="submit"
							value="send">
					</form><br>

					<h4 style="color: #FF4500">Select Order By Activity:</h4>
					<form
						action="<c:url value="/BackStageSelectOrderByActivity.controller"/>"
						method="POST">
						<input type="text" name="activityId"> <input type="submit"
							value="send">
					</form><br>
					
					</div>
					
				</div>

				<!-- ProgramComment============================================================================== -->

				<div class="areas" id="programcomment"
					style="background-color: #94FF00; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">
										
					<h4 style="color: #972031">Select Comment By ID:</h4>
					<form
						action="<c:url value="/BackStageSelectCommentById.controller"/>"
						method="POST">
						<input type="text" name="commentId"> <input type="submit"
							value="send">
					</form><br>

					<h4 style="color: #972031">Select Comment By Member:</h4>
					<form
						action="<c:url value="/BackStageSelectCommentByMember.controller"/>"
						method="POST">
						<input type="text" name="commentmemberId"><br>
						memberId <br>
						<input type="text" name="commentpodcasterId"><br>
						podcasterId <br>
						<input type="submit" value="send">
					</form><br>

					<h4 style="color: #972031">Select Comment By Podcaster:</h4>
					<form
						action="<c:url value="/BackStageSelectCommentByPodcaster.controller"/>"
						method="POST">
						<input type="text" name="commentpodcasterId"> <input
							type="submit" value="send">
					</form><br>

					<h4 style="color: #972031">Delete Comment By Id:</h4>
					<form
						action="<c:url value="/BackStageDeleteCommentById.controller"/>"
						method="POST">
						<input type="text" name="commentId"> <input type="submit"
							value="send">
					</form><br>

					<h4 style="color: #972031">Delete Comment By Member:</h4>
					<form
						action="<c:url value="/BackStageDeleteCommentByMember.controller"/>"
						method="POST">
						<input type="text" name="commentMemberId"> <br>
						memberId<br>
						<input type="text" name="commentPodcasterId"><br>
						podcasterId<br>
						<input type="submit" value="send">
					</form><br>
					
					</div>
					
				</div>

				<!-- Category============================================================================== -->

				<div class="areas" id="category"
					style="background-color: #FFB100; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #0067FF">Set New Category:</h4>
					<form action="<c:url value="/BackStageSetNewCategory.controller"/>"
						method="POST">
						<input type="text" name="categoryName"> <input
							type="submit" value="send"><br> ${SetnewCatError}
					</form><br>

					<h4 style="color: #0067FF">Update Category:</h4>
					<form
						action="<c:url value="/BackStageUpdateCategoryById.controller"/>"
						method="POST">
						<input type="text" name="categoryId"><br>
						categoryId<br> 
						<input type="text" name="categoryNewName"><br>
						categoryNewName<br>

						<input type="submit" value="send">${updateCategoryError}<br>
					</form><br>
					
					</div>
					
				</div>

				<!--Subscription============================================================================== -->

				<div class="areas" id="subscription"
					style="background-color: #00C7FF; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #FF4500">Select Subscription By Member:</h4>
					<form
						action="<c:url value="/SelectSubscriptionByMember.controller"/>"
						method="POST">
						<input type="text" name="memberId"> 
						<input type="submit"
							value="send"><br>
					</form><br>

					<h4 style="color: #FF4500">Select Subscription By Podcaster:</h4>
					<form
						action="<c:url value="/SelectSubscriptionByPodcaster.controller"/>"
						method="POST">
						<input type="text" name="podcasterId"> <input
							type="submit" value="send"><br>
					</form><br>

					</div>

				</div>

				<!-- activity============================================================================== -->

				<div class="areas" id="activity"
					style="background-color: #94FF00; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #972031">Select Activity By ID:</h4>
					<form action="<c:url value="/SelectActivityById.controller"/>"
						method="POST">
						<input type="text" name="activityId"> <input type="submit"
							value="send"><br>
					</form><br>

					<h4 style="color: #972031">Select Activity By Podcaster:</h4>
					<form
						action="<c:url value="/SelectActivityByPodcaster.controller"/>"
						method="POST">
						<input type="text" name="podcasterId"> <input
							type="submit" value="send"><br>
					</form><br>

					<h4 style="color: #972031">Select Activity By Date:</h4>
					<form action="<c:url value="/SelectActivityByDate.controller"/>"
						method="POST">
						<input type="text" name="activityDate"> <input
							type="submit" value="send"><br>
					</form><br>

					<h4 style="color: #972031">Delete Activity By ID:</h4>
					<form action="<c:url value="/DeleteActivityByID.controller"/>"
						method="POST">
						<input type="text" name="activityId"> <input type="submit"
							value="send"><br>
					</form><br>
					
					</div>


				</div>

				<!-- History============================================================================== -->

				<div class="areas" id="history"
					style="background-color: #FFB100; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">
					
					<h4 style="color: #0067FF">Select History By ID:</h4>
					<form action="<c:url value="/SelectHistoryById.controller"/>"
						method="POST">
						<input type="text" name="historyId"> <input type="submit"
							value="send"><br>
					</form><br>

					<h4 style="color: #0067FF">Select History By Member:</h4>
					<form action="<c:url value="/SelectHistoryByMember.controller"/>"
						method="POST">
						<input type="text" name="memberId"> <input type="submit"
							value="send"><br>
					</form><br>

					<h4 style="color: #0067FF">Select History By Podcaster:</h4>
					<form
						action="<c:url value="/SelectHistoryByPodcaster.controller"/>"
						method="POST">
						<input type="text" name="podcasterId"> <input
							type="submit" value="send"><br>
					</form><br>

					<h4 style="color: #0067FF">Select History By LastListen:</h4>
					<form
						action="<c:url value="/SelectHistoryByLastListen.controller"/>"
						method="POST">
						<input type="text" name="historyLastListen"> <input
							type="submit" value="send"><br>
					</form><br>

					<h4 style="color: #0067FF">Delete history By Date:</h4>
					<form action="<c:url value="/DeleteHistoryByDate.controller"/>"
						method="POST">
						<input type="text" name="historyDeleteDate"> <input
							type="submit" value="send"><br>
					</form><br>
					
					</div>

				</div>

				<!-- Income Calculate============================================================================== -->

				<div class="areas" id="income"
					style="background-color: #DD77FF; display: none;padding: 20px;">
					
					<div style="width:250px;margin:0px auto ">

					<h4 style="color: #6EE98F">Subscription Income:</h4>
					<form action="<c:url value="/SubscriptionIncome.controller"/>"
						method="POST">
						<input type="text" name="startDate"><br>
						StartDate<br>
						 <input type="text" name="endDate"><br>
						 EndDate<br>
						  <input type="submit" value="send"><br>
					</form><br>

					<h4 style="color: #6EE98F">Ticket Income:</h4>
					<form action="<c:url value="/TicketIncome.controller"/>"
						method="POST">
						<input type="text" name="startDate"><br>
						StartDate<br> 
						<input type="text" name="endDate"><br>
						EndDate<br> 
						<input type="submit" value="send"><br>
					</form><br>
					
					</div>
					
				</div>

			</div>

			<div class="col-sm-4"></div>

		<div>
			<
		</div>
		
		</div>

	

</body>
</html>