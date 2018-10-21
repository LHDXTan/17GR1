$(document).ready(function() {
	//弹出广告窗口
	window.open('open.html', '', 'top=0,left=200,width=500,height=327,scrollbars=0,resizable=0');
	$("#menu").mouseover(function() {
		//把内容show（）
		$("#dd_menu_top_down").show();
	});
	$("#menu").mouseout(function() {
		//隐藏
		$("#dd_menu_top_down").hide();
	});
	//滚动窗口
	$(window).scroll(function() {
		//为窗口的书籍定位置
		var st = $(this).scrollTop() + 50;
		$("#right").css("top", st);
	});
	$("#right").find("a").click(function() {
		$("#right").hide();
	});
	//轮播
	function lunbo() {
		//创建轮播图片的数组
		var v = ["images/scroll-01.jpg", "images/scroll-02.jpg", "images/scroll-03.jpg", "images/scroll-04.jpg"];
		var i = 0;
		var x = 1;
		$("#scroll_number li").mouseenter(function() {
			var value = $(this).html();
			// parseInt() 函数可解析一个字符串,并返回一个整数
			i = parseInt(value);
			//得到第一张图片
			$("#scroll_img>li").first().children().attr("src", v[i - 1]);
			// siblings()遍历方法改变样式
			$(this).css("background-color", "orange").siblings().css("background-color", "#1965B3");
			//图片变为第二张
			x = 2;
		});
		//鼠标离开时图片变为第一张
		$("#scroll_number li").mouseleave(function() {
			x = 1;
		});
		//轮播速度的方法
		var b = setInterval(function() {
			if(x == 1) {
				$("#scroll_img>li").first().children().attr("src", v[i]);
				$("#scroll_number li:eq(" + (i) + ")").css("background-color", "orange").siblings().css("background-color", "#1965B3");
				//循环+1
				i++;
			} else {
				i = i;
			}
			//轮播到第四张时有回到第一张图片继续轮播
			if(i == 4) {
				i = 0;
			}
		}, 2000);
	}
	lunbo();
	//电子书变大
	$(".book ul img").mouseenter(function() {
		//animate动画
		$(this).animate({ width: "100%" }, "slow");
	});
	$(".book ul img").mouseleave(function() {
		$(this).animate({ width: "70%" }, "slow");
	});
	//图书畅销榜切换
	$(".tab ol li:first-of-type").mouseover(function() {
		//悬停改变样式
		$(".tab ol li:last-of-type").css({ "background": "#efefef", "border-left": "1px solid #cccccc", "border-bottom": "1px solid #ccc", "width": "118px" });
		$(this).css({ "width": "119px", "background": "#ffffff", "border": "none" });
		//显示和隐藏
		$(".tab ul:first-of-type").show();
		$(".tab ul:last-of-type").hide();
	});
	$(".tab ol li:last-of-type").mouseover(function() {
		$(".tab ol li:first-of-type").css({ "background": "#efefef", "border-right": "1px solid #cccccc", "border-bottom": "1px solid #ccc", "width": "118px" });
		$(this).css({ "width": "119px", "background": "#ffffff", "border": "none" });
		$(".tab ul:first-of-type").hide();
		$(".tab ul:last-of-type").show();
	});
	$(".tab ul li p").mouseenter(function() {
		$(this).next().show();
		$(this).hide();
		//把所有的子标签p显示把所有的子标签dl隐藏
		$(this).parent().siblings().children("p").show().end().children("dl").hide();
	});
	//书讯快递
	function move() {
		//设置位置
		var marginTop = 0;
		var stop = false;
		//setInterval(函数,秒数)
		var interval = setInterval(function() {
			//如果返回的是false(不停止)执行下面的移动方法
			if(stop) return;
			//animate(css样式,速度,执行的函数)
			$("#express").children("li").first().animate({ "margin-top": marginTop-- }, 0, function() {
				//当前的第一行
				var $first = $(this);
				if(!$first.is(":animated")) {
					//最后一行>第一行的高时
					if((-marginTop) > $first.height()) {
						//再把第一行追加到最后一行之后
						$first.css({ "margin-top": 0 }).appendTo($("#express"));
						marginTop = 0;
					}
				}
			});
		}, 50);
		$("#express").mouseover(function() {
			//等于true时停止					
			stop = true;
		});
		$("#express").mouseout(function() {
			stop = false;
		});
	}
	move();
});