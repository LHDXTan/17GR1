$(document).ready(function() {
	//下拉菜单
	$("#menu").hover(
		function() {
			$("#dd_menu_top_down").slideDown(1000);
		},
		function () {
			$("#dd_menu_top_down").slideUp(1000);
		}
	);
})