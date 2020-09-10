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
			  var xv=x.value;
			  let displayobj=document.getElementById(xv);
			  let areas=document.getElementsByClassName('areas');
			  var i;
			  for(i=0;i<areas.length;i++){
				  areas[i].style.display="none";
			}
			 
			  displayobj.style.display="block";
			  
		}
		
	</script>
	<h3>BackStage Function Select</h3>
	<div>
		<form>
			<select id="options" name="options" onchange="fff();showhide()">
				<option value="members">Members</option>
				<option value="ticketorder">TicketOrder</option>
				<option value="programcomment">ProgramComment</option>
				<option value="category">Category</option>
				<option value="subscription">Subscription</option>
				<option value="ativity">Activity</option>
				<option value="history">History</option>
			</select>
			<!-- <input type="submit" value="send"> -->
		</form>
	</div>
	<div>
		<h3 id="result"></h3>
	</div>
	<div class="areas" id="members" style="background-color: #FFB100 ;display:none;" >
		<div>
			<h4 style="color: #0067FF ">SelectMemberById:</h4>
			<form action="<c:url value="/BackStageSelectMember.controller"/>"
				method="GET">
				<input type="text" name="selectmemberId"> <input
					type="submit" value="send">
			</form>

			<h4 style="color: #0067FF ">SelectMemberByAccount:</h4>
			<form
				action="<c:url value="/BackStageSelectMemberByAccount.controller"/>"
				method="GET">
				<input type="text" name="account"> <input type="submit"
					value="send">
			</form>

			<h4 style="color: #0067FF ">DeleteMember:</h4>
			<form action="<c:url value="/BackStageDeleteMember.controller"/>"
				method="GET">
				<input type="text" name="deletememberId"> <input
					type="submit" value="send"> ${msg}<br>
			</form>
		</div>
	</div>
	<div class="areas" id="ticketorder" style="background-color: #00C7FF;display: none; ">
		<h4 style="color: #FF4500 ">SelectOrderById:</h4>
			<form action="<c:url value="/BackStageSelectOrderById.controller"/>"method="GET">
				<input type="text" name="orderId"> <input
					type="submit" value="send">
			</form>
			
			<h4 style="color: #FF4500 ">SelectOrderByMember:</h4>
			<form action="<c:url value="/BackStageSelectOrderByMember.controller"/>"method="GET">
				<input type="text" name="memberId"> 
				<input type="submit" value="send">
			</form>
			
			<h4 style="color: #FF4500 ">SelectOrderByActivity:</h4>
			<form action="<c:url value="/BackStageSelectOrderByActivity.controller"/>"method="GET">
				<input type="text" name="activityId"> <input
					type="submit" value="send">
			</form>
	</div>

	<div class="areas" id="programcomment" style="background-color: #94FF00 ;display: none;">
		<h4 style="color: #972031  ">SelectCommentByID:</h4>
		<form action="<c:url value="/BackStageSelectCommentById.controller"/>"method="GET">
			<input type="text" name="commentId">
			 <input type="submit" value="send">
		</form>
			
		<h4 style="color: #972031  ">SelectCommentByMember:</h4>
		<form action="<c:url value="/BackStageSelectCommentByMember.controller"/>"method="GET">
			<input type="text" name="commentmemberId">memberId <br>
			<input type="text" name="commentpodcasterId">podcasterId <br>
			<input type="submit" value="send">
		</form>
		
		<h4 style="color: #972031  ">SelectCommentByPodcaster:</h4>
		<form action="<c:url value="/BackStageSelectCommentByPodcaster.controller"/>"method="GET">
			<input type="text" name="commentpodcasterId"> 
			<input type="submit" value="send">
		</form>
		
		<h4 style="color: #972031  ">DeleteCommentById:</h4>
		<form action="<c:url value="/BackStageDeleteCommentById.controller"/>"method="GET">
			<input type="text" name="commentId">
			<input type="submit" value="send">
		</form>
		
		<h4 style="color: #972031  ">DeleteCommentByMember:</h4>
		<form action="<c:url value="/BackStageDeleteCommentByMember.controller"/>"method="GET">
			<input type="text" name="commentMemberId"> memberId<br>
			<input type="text" name="commentPodcasterId">podcasterId<br>
			<input type="submit" value="send">
		</form>
	</div>
	
	<div class="areas" id="category" style="background-color: #00C7FF;display: none; ">
		<h4 style="color: #FF4500 ">Update Category:</h4>
			<form action="<c:url value="/BackStageUpdateCategoryById.controller"/>"method="GET">
				<input type="text" name="categoryId"> <input
					type="submit" value="send">
			</form>
	</div>

</body>
</html>