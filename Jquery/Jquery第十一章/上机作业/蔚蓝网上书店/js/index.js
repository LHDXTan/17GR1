$(document).ready(function() {
	//弹出广告窗口
	window.open('open.html', '', 'top=0,left=200,width=500,height=300,scrollbars=0,resizable=0');
	//随滚动条上下移动
	$(window).scroll(function() {
		var st = $(this).scrollTop() + 50;
		$("#right").css("top", st);
	});
	$("#right a").click(function() {
		$("#right").hide();
	})
	//中间的广告图片循环显示
	function LunBo() {
		var index = 0;
		var stop = false;
		var $li = $("#scroll_img li");
		var $page = $("#scroll_number li");
		$page.eq(index).addClass("scroll_number_over").stop(true, true).siblings().removeClass("scroll_number_over");
		$page.mouseover(function() {
			stop = true;
			index = $page.index($(this));
			$li.eq(index).stop(true, true).fadeIn().siblings().fadeOut();
			$(this).addClass("scroll_number_over").stop(true, true).siblings().removeClass("scroll_number_over")
		}).mouseout(function() {
			stop = false;
		});
		setInterval(function() {
			if(stop) return;
			index++;
			if(index >= $li.length) {
				index = 0;
			}
			$li.eq(index).stop(true, true).fadeIn().siblings().fadeOut();
			$page.eq(index).addClass("scroll_number_over").stop(true, true).siblings().removeClass("scroll_number_over");
		}, 3000);
	}
	LunBo();
	$(".book ul img").mouseenter(function() {
		$(this).animate({
			width: "110%"
		}, "slow");
	});
	$(".book ul img").mouseleave(function() {
		$(this).animate({
			width: "80%"
		}, "slow");
	});
	//书讯快递
	function shuXun() {
		var marginTop = 0;
		var stop = false;
		var interval = setInterval(function() {
			if(stop) return;
			$("#express").children("li").first().animate({
				"margin-top":marginTop--
			}, 0, function(){
				var $first = $(this);
				if(!$first.is(":animated")) {
					if((-marginTop) > $first.height()) {
						$first.css({
							"margin-top": 0
						}).appendTo($("#express"));
						marginTop = 0;
					}
				}
			});
		},
		50);
		$("#express").mousemove(function(){
			stop=true;
		}).mouseout(function(){
			stop=false;
		});
		}
		shuXun();
		
});