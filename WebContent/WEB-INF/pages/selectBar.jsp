<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Styles -->

<!-- jquery-ui CSS -->

<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet"> 

<!-- Javascript files -->
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- Bootstrap JS -->
	<script src="js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	<!-- <script type="text/javascript" src="js/player.js"></script> -->
 	<script type="text/javascript">
		$.widget("custom.catcomplete", $.ui.autocomplete, {
			_renderMenu : function(ul, items) {
				var that = this, currentCategory = "";
				$.each(items, function(index, item) {
					if (item.category != currentCategory) {
						ul.append("<li class='ui-autocomplete-category'>"
								+ item.category + "</li>");
						currentCategory = item.category;
					}
					that._renderItemData(ul, item);
				});
			}
		});
		$(document).ready(function($) {
			xhr = $.ajax({
				url : "/SpringWebProject/getFuzzySelectAllDataName.controller",
				async : false
			})
			var availableTags = xhr.responseJSON
			console.log(availableTags);
			$("#tags2").catcomplete({
				source : availableTags
			});

		});
	</script>


</head>
<body>



	<!-- news letter -->
	<div class="news-letter" id="selectBar">
		<div class="container">
			<!-- news letter inner content -->
			<div class="news-content ">
				<!-- heading -->
				<h3>尋找屬於你的聲音</h3>
				<!-- paragraph -->
				<p>
					<strong>尋找</strong>你心之所向，只屬於你專屬的聲音吧！
				</p>
				<!-- subscribe form -->
				<form action="<c:url value="FuzzySelect.controller"/>" method="get">
					<div class="input-group">
						<input id="tags2" type="text" class="form-control input-lg"
							name="selectCondition" placeholder="輸入播客或節目名稱"> 
						<span class="input-group-btn">
							<button class="btn btn-default btn-lg" type="submit">搜尋</button>
						</span>
					</div>
					<!-- /input-group -->
				</form>
			</div>
		</div>
	</div>
	<!-- news letter end -->
</body>

</html>