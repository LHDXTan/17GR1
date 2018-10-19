/**
 * Created by zongjuan.wang on 2016/6/1.
 */

/*关闭窗口*/
function close_plan(){
    window.close();
}
function collection(){
    var flag=confirm("移入收藏后，将不再购物车显示，是否继续操作?");
    if(flag==true){
        alert("移入收藏成功!");
    }
}
function del(){
    var flag=confirm("您确定要删除商品吗?");
    if(flag==true){
        alert("删除成功!");
    }
}
function minus(num){
    var prices=document.getElementsByName("price")[num].value;
    var count=parseInt(document.getElementsByName("amount")[num].value)-1;
    if(count<1){
        alert("不能再减了，再减就没有啦！");
    }
    else{
        document.getElementsByName("amount")[num].value=count;
        var totals=parseFloat(prices*count);
        document.getElementById("price"+num).innerHTML="¥"+totals ;
        total();
    }
}
function plus(num){
    var prices=document.getElementsByName("price")[num].value;
    var count=parseInt(document.getElementsByName("amount")[num].value)+1;
    document.getElementsByName("amount")[num].value=count;
    var totals=parseFloat(prices*count);
    document.getElementById("price"+num).innerHTML="¥"+ totals;
    total();
}
function total(){
    var prices=document.getElementsByName("price");
    var count=document.getElementsByName("amount");
    var sum=0;
    for(var i=0; i<prices.length;i++){
       sum+=prices[i].value*count[i].value;
    }
    document.getElementById("totalPrice").innerHTML="¥" +sum;
}
total();
function accounts(){
	    var sl=	document.getElementsByName("amount");
	    var jia=document.getElementsByName("price");
	 	var str="欢迎来到当当购物车页面</br>以下为你购买商品的清单:</br>"+"白岩松：白说 &nbsp 单价￥"+jia[0].value+"&nbsp &nbsp 数量："
	 	+sl[0].value+"</br>"+"岛上书店 &nbsp  单价￥"+jia[1].value+"&nbsp &nbsp 数量："
	 	+sl[1].value+"</br> 总计："+(parseFloat(jia[0].value)*parseInt(sl[0].value)+parseFloat(jia[1].value)*parseInt(sl[1].value));
	 	document.getElementById("cartList").nextElementSibling.innerHTML=str;
 }