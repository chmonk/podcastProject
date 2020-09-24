
/**
 * UI 互動
 */
$(document).ready(() => {

	$("svg").on("click", function (e) {

		$(e.currentTarget.parentNode).toggleClass("like");

	})

});