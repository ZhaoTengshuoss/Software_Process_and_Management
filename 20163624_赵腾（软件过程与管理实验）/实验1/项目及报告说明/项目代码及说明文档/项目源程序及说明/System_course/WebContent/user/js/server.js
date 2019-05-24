var num1; 
var num2;
var pro1 = ["农业","林业","畜牧业"];
var cits1 = [
	["谷物种植","豆类、油料和薯类种植","棉、麻、糖、烟草种植","蔬菜、食用菌及园艺作物种植","水果种植 ","坚果、含油果、香料和饮料作物种植","中药材种植","其他农业"],
	["林木育种和育苗","造林和更新","森林经营和管护","木材和竹材采运","林产品采集"],
	["牲畜饲养","家禽饲养"," 狩猎和捕捉动物","其他畜牧业"]	
];

var counts = [
[
["稻谷种植","小麦种植","玉米种植","其他谷物种植"],
["豆类种植","油料种植","薯类种植"],
["棉花种植","麻类种植","糖料种植","烟草种植"],
["蔬菜种植","食用菌种植","花卉种植","其他园艺作物种植"],
["葡萄种植","柑橘类种植","香蕉等亚热带水果种植","其他水果种植"],
["坚果种植","含油果种植","香料作物种植","茶及其他饮料作物种植"],
["中药材种植"],
["其他农业"]
],
[
["林木育种","林木育苗"],
["造林和更新"],
["森林经营和管护"],
["木材采运","竹材采运"],
["木竹材林产品采集","非木竹材林产品采集"]
],
[
["牛的饲养","马的饲养","猪的饲养","羊的饲养","骆驼饲养","其他饲养"],
["鸡的饲养","鸭的饲养","鹅的饲养","其他家禽饲养"],
["狩猎和捕捉动物"],
["其他畜牧业"]
]
];

$(function(){
	var o=0;
    for(var i=0;i<pro1.length;i++){
    	$("#service_A").append("<option>"+pro1[i]+"</option>");
    }
    $("#service_A").change(function(){
        $("#city").children().not(":eq(0)").remove();
        num1=$(this).children("option:selected").index();
        var acity1=cits1[num1-1];
        for(var j=0;j<acity1.length;j++)
        {
        $("#service_B").append("<option>"+acity1[j]+"</option>");
        }
    $("#service_B").change(function(){
        $("#service_C").children().not(":eq(0)").remove();
        num2=$(this).children("option:selected").index();
        var contries1=counts[num1-1][num2-1];
        for( var z=0;z<contries1.length;z++)
        {
        $("#service_C").append("<option>"+contries1[z]+"</option>");
        }
        });
        });
    });