//弹出固定大小的广告页面窗口
$(function($) {
	window.open('open.html', '', 'top=0,left=200,width=500,height=327,scrollbars=0,resizable=0');
	$("#menu").mouseover(function() {
		$("#dd_menu_top_down").show();
	});
	$("#menu").mouseout(function() {
		$("#dd_menu_top_down").hide();
	})
	//随滚动条上下移动
	$(window).scroll(function() {
		var st = $(this).scrollTop() + 50;
		$("#right").css("top", st);
	})
	//关闭广告图
	$("#dd_close a").click(function() {
		$("#right").hide();
	});
	//////////////////////////
	function lu() {
		var r = ["images/scroll-01.jpg", "images/scroll-02.jpg", "images/scroll-03.jpg", "images/scroll-04.jpg"];
		var i = 0;
		var x = 1;
		var b = 0;
		$("#scroll_number li").mouseenter(function() {
			var value = $(this).html();
			i = parseInt(value);
			$("#scroll_img>li").first().children().attr("src", r[i - 1]);
			$(this).css("background-color", "orange").siblings().css("background-color", "#808080");
			x = 2;
		}).mouseleave(function() {
			x = 1;
		})
		b = setInterval(function() {
			if(x == 1) {
				$("#scroll_img>li").first().children().attr("src", r[i]);
				$("#scroll_number li:eq(" + (i) + ")").css("background-color", "orange").siblings().css("background-color", "#808080")
				i++;
			} else {
				i = i;
			}
			if(i == 4) {
				i = 0;
			}
		}, 1500);
	}
	lu();

	//////////////////////////
	//畅销榜的切换
	$(".tab ol li:first-of-type").mouseover(function() {
		$(".tab ul:first-of-type").show();
		$(".tab ul:last-of-type").hide();
	});
	$(".tab ol li:last-of-type").mouseover(function() {
		$(".tab ul:first-of-type").hide();
		$(".tab ul:last-of-type").show();
	});
	//图片放大
	$(".book ul img").mouseover(function() {
		$(this).animate({
			width: "110%"
		}, "slow");
	});
	$(".book ul img").mouseout(function() {
		$(this).animate({
			width: "80%"
		}, "slow");
	});
	//书讯快递
	function shuxunkuaidi() {
		var bianliang = 0;
		var stop = false;
		var miaoshu = setInterval(function() {
			if(stop) return;
			$("#express").children("li").first().animate({
				"margin-top": bianliang--
			}, 0, function() {
				var $this = $(this);
				if(!$this.is(":animated")) {
					if((-bianliang) > $this.height()) {
						$this.css({
							"margin-top": 0
						}).appendTo($("#express"));
						bianliang = 0;
					}
				}

			})
		}, 50);
		$("#express").mouseover(function() {
			stop = true;
		})
		$("#express").mouseout(function() {
			stop = false;
		})
	}
	shuxunkuaidi();

})