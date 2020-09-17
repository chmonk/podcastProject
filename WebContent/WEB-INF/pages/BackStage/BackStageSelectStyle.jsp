<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BackStage Select</title>


<style>
p {
	color: red;
	font-size: 20px
}

#body {
	font-family: "Lato", sans-serif;
	color: white;
	background-color: teal;
}

h1 {
	font-size: 60px;
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
	background-color: teal;
	-webkit-transition: top 0.2s ease-in-out, font-size 0.2s ease-in-out;
	transition: top 0.2s ease-in-out, font-size 0.2s ease-in-out;
}

.active {
	top: -25px;
	font-size: 20px;
}

input[type="text"] {
	width: 100%;
	padding: 20px;
	border: 1px solid white;
	font-size: 20px;
	background-color: teal;
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
	background-color: teal;
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
		<h1>BackStage Function Select</h1>
		<div>
			<form id="select">
				<select id="options" name="options" onchange="showhide()">
					<option value="members">Members</option>
					<option value="ticketorder">TicketOrder</option>
					<option value="programcomment">ProgramComment</option>
					<option value="category">Category</option>
					<option value="subscription">Subscription</option>
					<option value="activity">Activity</option>
					<option value="history">History</option>
					<option value="income">Income</option>
					<option value="podcast">Podcast</option>
				</select>
			</form>
		</div>


		<div class="areas" id="members" style="display: none;">

			<div>
				<form id="selectMemberByIdForm"
					action="<c:url value="/BackStageSelectMember.controller"/>"
					method="POST">
					<label for="fname">Select Member By Id</label> <input
						id="selectMemberIdText" type="number" name="selectmemberId">
					<input id="memberIdBtn" type="button" value="send"
						class="btn btn-warning">
					<p id="selectMemberByIdErr"></p>
				</form>

			</div>

			<div>
				<form id="selectMemberByAccountForm"
					action="<c:url value="/BackStageSelectMemberByAccount.controller"/>"
					method="POST">
					<label for="fname">Select Member By Account</label> <input
						id="selectMemberAccountText" type="text" name="account"> <input
						id="selectMemberAccountBtn" type="button" value="send"
						class="btn btn-warning">
					<p id="selectMemberAccountErr"></p>

				</form>
			</div>

			<div>
				<form id="deleteMemberForm"
					action="<c:url value="/BackStageDeleteMember.controller"/>"
					method="POST">
					<label for="fname">Delete Member By Id</label> <input
						id="deleteMemberText" type="number" name="deletememberId">
					<input id="deleteMemberBtn" type="button" value="send"
						class="btn btn-warning">
					<p id="deleteMemberErr"></p>
				</form>
			</div>

		</div>

		<!-- TicketOrder============================================================================== -->

		<div class="areas" id="ticketorder" style="display: none">

			<div>
				<form id="selectOrderIdForm"
					action="<c:url value="/BackStageSelectOrderById.controller"/>"
					method="POST">
					<label for="fname">Select Order By Id</label> <input
						id="selectOrderIdText" type="number" name="orderId"> <input
						id="selectOrderIdBtn" type="button" value="send"
						class="btn btn-warning">
					<p id="selectOrderIdErr"></p>
				</form>
			</div>


			<div>
				<form id="selectOrderMemberForm"
					action="<c:url value="/BackStageSelectOrderByMember.controller"/>"
					method="POST">
					<label for="fname">Select Order By Member</label> <input
						id="selectOrderMemberText" type="number" name="memberId">
					<input id="selectOrderMemberBtn" type="button" value="send"
						class="btn btn-warning">
					<p id="selectOrderMemberErr"></p>
				</form>
			</div>

			<div>
				<form id="selectOrderActForm"
					action="<c:url value="/BackStageSelectOrderByActivity.controller"/>"
					method="POST">
					<label for="fname">Select Order By Activity</label> <input
						id="selectOrderActText" type="number" name="activityId"> <input
						id="selectOrderActBtn" type="button" value="send"
						class="btn btn-warning">
					<p id="selectOrderActErr"></p>
				</form>
			</div>
		</div>

		<!-- ProgramComment========================================================================-->

		<div class="areas" id="programcomment" style="display: none;">
			<div>

				<form id="selectCommentIdForm"
					action="<c:url value="/BackStageSelectCommentById.controller"/>"
					method="POST">
					<label for="fname">Select Comment By ID</label> <input
						id="selectCommentIdText" type="number" name="commentId"> <input
						id="selectCommentIdBtn" type="button" value="send"
						class="btn btn-warning" >
						<p id="selectCommentIdErr"></p>
					</form>
			</div>
			
		</div>

	</div>

	<script type="text/javascript"
		src="<c:url value='/js/BackStageSelect.js'/>"></script>


</body>
</html>