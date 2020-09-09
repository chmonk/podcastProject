<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Styles -->
<!-- Bootstrap CSS -->
<link href="../../../css/bootstrap.min.css" rel="stylesheet">
<!-- Animate CSS -->
<link href="../../../css/animate.min.css" rel="stylesheet">
<!-- Basic stylesheet -->
<link rel="stylesheet" href="../../css/owl.carousel.css">
<!-- Font awesome CSS -->
<link href="../../../css/font-awesome.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../../../css/style.css" rel="stylesheet">
<link href="../../../css/style-color.css" rel="stylesheet">


</head>
<body>
	<!-- modal for booking ticket form -->
	<div class="modal fade" id="bookTicket" tabindex="-1" role="dialog"
		aria-labelledby="BookTicket">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						Name of The Event &nbsp; <small><span
							class="label label-success">Available</span> &nbsp; <span
							class="label label-danger">Not Available</span></small>
					</h4>
				</div>


				<!-- form for events ticket booking -->
				<form>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input type="email"
								class="form-control" id="exampleInputEmail1"
								placeholder="example@mail.com">
						</div>
						<div class="form-group">
							<label for="exampleInputContact">Contact</label> <input
								type="text" class="form-control" id="exampleInputContact"
								placeholder="+91 55 5555 5555">
						</div>
						<div class="form-group">
							<label for="exampleInputSeats">Number of Tickets</label> <select
								class="form-control" id="exampleInputSeats">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> I accept the
								Terms of Service
							</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<!-- link to payment gatway here -->
						<button type="button" class="btn btn-primary">Book Now</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>