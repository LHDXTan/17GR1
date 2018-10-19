$(document).ready(function() {

	//下拉菜单
	$("#menu").mouseenter(function() {
		//slideDown() 方法通过使用滑动效果，显示隐藏的被选元素
		$("#dd_menu_top_down").slideDown(1000);
	}).mouseleave(function() {
		//通过使用滑动效果，隐藏被选元素
		$("#dd_menu_top_down").slideUp(1000);
	});

	//弹出广告                                                                                scrollbars:滚动条
	window.open('open.html', '', 'top=200,left=500,width=550,height=357,scrollbars=0');

	//小广告  当用户滚动指定的元素时，会发生 scroll 事件。
	$(window).scroll(function() {
		//scrollTop 设置 <div> 元素中滚动条的垂直偏移
		var st = $(this).scrollTop() + 50;
		$("#right").css("top", st);
	});
	//find() 方法获得当前元素集合中每个元素的后代
	//	$("#right").find("a").click(function () {
	//		$("#right").hide();
	//	})
	$("#right a").click(function() {
		$("#right").hide();
	});

	//轮播图
	function lunbo() {
		var index = 0;
		var stop = false;
		var $li = $("#content #scroll_img li");
		var $page = $("#content #scroll_number li");
		/*:eq() 选择器选取带有指定 index 值的元素。
		 * index 值从 0 开始，所有第一个元素的 index 值是 0（不是 1）*/
		//siblings() 获得匹配集合中每个元素的同胞
		$page.eq(index).addClass("scroll_number_over").siblings().removeClass("scroll_number_over");
		//鼠标指针位于元素上方时
		$page.mouseover(function() {
			stop = true;
			//获得下标
			index = $page.index($(this));
			//fadeIn() 方法使用淡入效果来显示被选元素
			//fadeOut() 方法使用淡出效果来隐藏被选元素
			$li.eq(index).fadeIn().siblings().fadeOut();
			$(this).addClass("scroll_number_over").siblings().removeClass("scroll_number_over");
		}).mouseout(function() {
			stop = false;
		});
		setInterval(function() {
			if (stop) return;
			//stop=false时，让图片轮播
			index++;
			//如果图片播到最后就从第一个开始
			if (index >= $li.length) {
				index = 0;
			}
			//图片改变
			$li.eq(index).fadeIn().siblings().fadeOut();
			//序号改变
			$page.eq(index).addClass("scroll_number_over").siblings().removeClass("scroll_number_over");
		}, 3000);
	}
	lunbo();
	//书本放大缩小动画
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
	//图书畅销榜切换
	$(".tab ol li:first-of-type").mouseover(function() {
		//改变样式
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
		$(".tab ul:first-of-type").show();
		$(".tab ul:last-of-type").hide();
	});
	$(".tab ol li:last-of-type").mouseover(function() {
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
		$(".tab ul:first-of-type").hide();
		$(".tab ul:last-of-type").show();
	});
	$(".tab ul li p").mouseenter(function() {
			$(this).next().show();
			$(this).hide();
			$(this).parent().siblings().children("p").show().end().children("dl").hide();
		})
		//书讯快递循环垂直向上滚动
	function movedome() {
		var marginTop = 0;
		var stop = false;
		var interval = setInterval(function() {
			if (stop) return;
			$("#express").children("li").first().animate({
				"margin-top": marginTop--
			}, 0, function() {
				var $first = $(this);
				if (!$first.is(":animated")) {
					if ((-marginTop) > $first.height()) {
						$first.css({
							"margin-top": 0
						}).appendTo($("#express"));
						marginTop = 0;
					}
				}
			});
		}, 50);
		$("#express").mouseover(function() {
			stop = true;
		}).mouseout(function() {
			stop = false;
		});
	}
	movedome();

})