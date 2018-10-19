$(function() {

	//弹出广告
	function uu() {
		window.open("open.html", "", "width=500,height=300,top=350,left=500");
	}
	uu();
	//滚动的小广告
	$(window).scroll(function() {
		var s = $(this).scrollTop() + 50;
		$("#right").css("top", s);
	})

	//关闭右边的小广告
	$("#dd_close").click(function() {
		$("#right").hide();
	});

	//下拉框
	$("#menu").mouseover(function() {
		$("#dd_menu_top_down").show();
	}).mouseout(function() {
		$("#dd_menu_top_down").hide();
	});

	//轮播图

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
	//书序快递
	function zo() {
		var b = false;
		var ytop = 0;
		var s = setInterval(function() {

			if(b == true) {
				return;
			}
			$("#express").children("li").first().animate({ "margin-top": ytop-- }, 0, function() {
				var t = $(this);
				if(!t.is(":animated")) {
					if(-ytop > t.height()) {
						ytop = 0;
						t.css("margin-top", ytop).appendTo($("#express"));
					}
				};
			});
		}, 50);

		$(".book_class").mouseover(function() {
			b = true;
		}).mouseout(function() {
			b = false;
		});
	}
	zo();

	//电子书动画
	$(".book ul li img").mouseenter(function() {
		$(this).animate({ width: "110%" }, "slow");
	}).mouseleave(function() {
		$(this).animate({ width: "80%" }, "slow");
	});
	//右侧图书
	$(".tab ol").children().first().mouseenter(function() {
		$(this).css({ "background": "#efefef", "border-right": "1px solid #cccccc", "border-bottom": "1px solid #ccc", "width": "118px" });
		$(".tab ol li:last").css({ "width": "119px", "background": "#ffffff", "border": "none" })

		$(".tab").children("ul:first").show().next().hide();
	});
	$(".tab ol").children().last().mouseenter(function() {
		$(this).css({ "background": "#efefef", "border-right": "1px solid #cccccc", "border-bottom": "1px solid #ccc", "width": "118px" });
		$(".tab ol li:first").css({ "width": "119px", "background": "#ffffff", "border": "none" })
		$(".tab").children("ul:last").show().prev().hide();
	});
	$(".tab ul>li>p").mouseenter(function() {
		$(this).next().show();
		$(this).hide();
		$(this).parent().siblings().children("p").show().end().children("dl").hide();
	})

})