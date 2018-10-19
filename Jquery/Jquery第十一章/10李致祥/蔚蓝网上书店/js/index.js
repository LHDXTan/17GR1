$(document).ready(function() {
	//弹出广告
	window.open('open.html', '', 'top=0,left=200,width=500,height=327,scrollbars=0,resizable=0');
	//上下滚动广告
	$("#dd_close").click(function() {
		$("#right").hide();
	})
	var rightTop = parseInt($("#right").css("top"));
	$(window).scroll(function() {
		var scollTop = parseInt($(this).scrollTop());
		$("#right").offset({
			top: scollTop + rightTop
		})
	})
	//轮播图
	function changeImg() {
		var index = 0;
		var stop = false;
		var $li = $("#content").find("#scroll_img").children("li");
		var $page = $("#content").find("#scroll_number").children("li");
		$page.eq(index).addClass("scroll_number_over").stop(true, true).siblings().removeClass("scroll_number_over");
		$page.mouseover(function() {
			stop = true;
			index = $page.index($(this));
			$li.eq(index).stop(true, true).fadeIn().siblings().fadeOut();
			$(this).addClass("scroll_number_over").stop(true, true).siblings().removeClass("scroll_number_over");
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
	changeImg();
	//tab切换
	$(".tab ol li:first").bind("click", bg1 = function() {
		$(".tab ol li:last-of-type").css({
			"background": "#efefef",
			"border-left": "1px solid #cccccc",
			"border-bottom": "1px solid #ccc",
			"width": "118px"
		});
		$(this).css({
			"width": "119px",
			"background": "#ffffff",
			"border": "none"
		});
	}).bind("click", con1 = function() {
		$(".tab ul:first").show();
		$(".tab ul:last").hide();
	})
	$(".tab ol li:last").bind("click", function() {
		$(".tab ol li:first-of-type").css({
			"background": "#efefef",
			"border-right": "1px solid #cccccc",
			"border-bottom": "1px solid #ccc",
			"width": "118px"
		});
		$(this).css({
			"width": "119px",
			"background": "#ffffff",
			"border": "none"
		});
	}).bind("click", function() {
		$(".tab ul:first").hide();
		$(".tab ul:last").show();
	});
	$(".tab ul li p").mouseenter(function() {
		$(this).next().show();
		$(this).hide();
		$(this).parent().siblings().children("p").show().end().children("dl").hide();
	})
	//等比放大
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
	//书讯
	function movedome() {
		var margintop = 0; //上边距的偏移量
		var stop = false;
		setInterval(function() {
			if(stop == true) {
				return;
			}
			$("#express").children("li").first().animate({
				"margin-top": margintop--
			}, 0, function() {
				var $li = $(this);
				if(!$li.is(":animated")) { //第一个li的动画结束时
					if(-margintop > $li.height()) {
						$li.css("margin-top", "0px").appendTo($("#express"));
						margintop = 0;
					}
				}
			});
		}, 50);
		//鼠标放到快递信息(ul)上时
		$("#express").hover(function() {
			$(this).css("cursor", "pointer");
			stop = true; //停止动画
		}, function() {
			stop = false; //开始动画
		});
	}
	movedome();
})