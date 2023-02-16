/**
 메뉴 js
 */
'use strict';
$(function(){
	
	$(".sub_apparel").hide();
	$(".sub_goods").hide();
	$(".sub_collabo").hide();
	$(".sub_car").hide();
	$(".sub_motorcycle").hide();
	$(".sub_RF").hide();
	$("#searchForm").hide();
	$("#sidebar").hide();
	
	$(".menu_APPAREL, .sub_apparel").hover(function(){$(".sub_apparel").show();});
	$(".menu_GOODS, .sub_goods").hover(function(){$(".sub_goods").show();});
	$(".menu_SPECIALCOLLABO, .sub_collabo").hover(function(){$(".sub_collabo").show();});
	$(".menu_CUSTOMCARPARTS, .sub_car").hover(function(){$(".sub_car").show();});
	$(".menu_MOTORCYCLEPARTS, .sub_motorcycle").hover(function(){$(".sub_motorcycle").show();});
	$(".menu_RATFINKFEVER, .sub_RF").hover(function(){$(".sub_RF").show();});
	
	$(".menu_APPAREL, .sub_apparel").mouseleave(function(){$(".sub_apparel").hide();});
	$(".menu_GOODS, .sub_goods").mouseleave(function(){$(".sub_goods").hide();});
	$(".menu_SPECIALCOLLABO, .sub_collabo").mouseleave(function(){$(".sub_collabo").hide();});
	$(".menu_CUSTOMCARPARTS, .sub_car").mouseleave(function(){$(".sub_car").hide();});
	$(".menu_MOTORCYCLEPARTS, .sub_motorcycle").mouseleave(function(){$(".sub_motorcycle").hide();});
	$(".menu_RATFINKFEVER, .sub_RF").mouseleave(function(){$(".sub_RF").hide();});
	
	$(".categoryOn").click(function(){
		if($("#category1").css("display") == 'none') {
			$("#category1").show(100);
		}
		else {
			$("#category1").hide();
		}
	});
	
	$(window).scroll(function() {
		
		// windowScrollTop : 현재 viewport의 스크롤 윗점
    	const windowScrollTop = $(window).scrollTop();
  		// height : 백분율을 구할 높이 (위 예시에서 2000-500을 하는 과정)
    	const height = $(document).height() - $(window).height();
  		// procent : 현재 위치의 스크롤 백분율
    	const procent = Math.floor(windowScrollTop / height * 100);
    	
	    if($(window).scrollTop() + $(window).height() == $(document).height()) {
	        $("#left").css("display","none");
	    }
	    
	    if(procent > 80) {
			$(".footer").removeClass("animate__fadeOutDown");
	        $(".footer").addClass("animate__fadeInUp");
	        $("#left").removeClass("animate__fadeIn");
	        $("#left").addClass("animate__fadeOut");
		}
		else {
			$(".footer").removeClass("animate__fadeInUp");
	        $(".footer").addClass("animate__fadeOutDown");
	        $("#left").removeClass("animate__fadeOut");
	        $("#left").addClass("animate__fadeIn");
	        $("#left").css("display","block");
		}
	});
	
});

function searchFormClick() {
	$("#searchForm").show(200);
}
function searchFormClose() {
	$("#searchForm").hide();
}
function sidebarOn() {
	$("#sidebar").fadeTo(1000,0.9);
	$("#side_on").hide();
}
function sidebarClose() {
	$("#sidebar").hide();
	$("#side_on").show();
}