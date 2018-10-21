$().ready(function(){
	function zuoce(){
		var list=new Array(
            "中国当代小说（13880）","中国近现代小...（640）","中国古典小说（1547）",
            "四大名著（696）","港澳台小说（838）","外国小说（5119）",
            "侦探/悬疑/推...（2519）","惊悚/恐怖（798）","魔幻（369）","科幻 （513）",
            "武侠（574）","军事（726）","情感 （6700）",
            "社会（4855）","都市（949）","乡土（99）","职场（176）",
            "财经（292）","官场（438）","历史（1329）","影视小说（501）",
            "作品集（2019）","世界名著（3273）"
        );
		var html=[];
		$.each(list, function(i,v) {
			html.push("<li><a href='#' class='blue'>"+v+"</a></li>");
		});
		$("#product_catList_class").html(html);
	}
	zuoce();
	
	
	
	//获取列表形式
	var liebiao=$("#product_storyList_content").html();
	function bigbook(){
	var $initContent=$("#product_storyList_content");
	var $bookImg=$initContent.find(".product_storyList_content_left");
	var contents="";
	$initContent.find(".product_storyList_content_right").find("ul").each(function(i,v){
		var div="";
		var content=[div,"<div class='big_img_list'><ul><li class='bookImg'>"+$($bookImg[i]).html()+"</li>"];
		var $li=$(v).children("li");
		var $price=$($li[6]).find("span");
		content.push("<li><dl><dd class='footer_dull_red'>"
		 		+$($price[1]).text()+"</dd><dd class='product_content_delete'>"
                +$($price[2]).text()+"</dd><dd class='footer_dull_red'>"
                +$($price[0]).text()+"</dd></dl></li>");
       		content.push("<li class='detail'>"+$($li[5]).html()+"</li>");//简介
            content.push("<li class='detail'>"+$($li[2]).html()+"</li>");//作　者
            content.push("<li class='detail'>"+$($li[1]).html()+"</li>");//顾客评分
            content.push("<li class='detail'>"+$($li[3]).html()+"</li>");//出版社
            content.push("<li class='detail'>"+$($li[4]).html()+"</li></ul></div>");//出版时间
            contents+=content.join("");
	});


	return contents;
	}
	var bigbooklist=bigbook();
	$("#product_array").children("a").click(function(){
		if($(this).is("[class='click']")){
			return 
		}
		$(this).siblings().removeClass("click");
		$(this).addClass("click");
		if($(this).attr("name")=="array"){
			$("#product_storyList_content").empty().html(liebiao);
		}else{
			$("#product_storyList_content").empty().html(bigbooklist);
			$("#product_storyList_content").children(".big_img_list").find("ul").mouseover(function(){
				$(this).addClass("over");
				$(this).parent().addClass("over");
			}).mouseout(function(){
				$(this).removeClass("over");
				$(this).parent().removeClass("over");
			})
		}
		
		
	})
	
})
