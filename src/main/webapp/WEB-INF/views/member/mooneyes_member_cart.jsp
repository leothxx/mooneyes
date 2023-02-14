<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_member_cart.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		$(function(){
			$("#cart-product-menu").click(function(){
				let arrowImg = $(this).children("#arrow-btn-img");
				arrowImg.attr("src",function(index, attr){
					if(attr.match('up')) {
						return attr.replace('up','down');
					}
					else {
						return attr.replace('down','up');
					}
				});
			});
		});
	</script>
	<style>
		.cart-product-menu {
			background-color: #ececec;
			border: 0px;
			font-size: 1rem;
			width: 100%;
			padding: 10px;
		}
		.cart-product-sub {
			border: 0px;
			font-size: 1rem;
			width: 100%;
			margin: 0 auto;
			padding: 10px;
		}
		.cart-product-sub div {
			padding: 0px;
		}
		.tot_buy_price {
			font-size: 1.2rem;
		}
		.tot_price, .tot_delivery {
			font-size: 1.2rem;
			font-weight: 800;
		}
		#toggle-arrow-img {
			transition: all ease 1s;
		}
		.toggle-img-change {
			transform: rotate(180deg);
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div style="width: 100%; margin: 0 auto;">
		<div style="width: 75%; margin: 0 auto;">
			<br/><br/><br/>
			<button data-toggle="collapse" data-target="#cart" class="cart-product-menu" id="cart-product-menu"><div class="row"><div class="col text-left">장바구니 상품</div><div class="col text-right" id="arrow-btn-img"><img src="${ctp}/images/arrow_down.png" width="20px" /></div></div></button>
			<div id="cart" class="collapse">Lorem ipsum dolor text....</div>
			<div class="row cart-product-sub" style="background-color: #000; color: #fff;"><div class="col text-left" style=" font-weight: 800;">결제예정금액</div><div class="col text-right tot_buy_price">55,000원</div></div>
			<div class="row cart-product-sub" style="background-color: #ececec; color: #000;"><div class="col text-left">총 상품금액</div><div class="col text-right tot_price">55,000원</div></div>
			<div class="row cart-product-sub" style="background-color: #ececec; color: #000;"><div class="col text-left">총 배송비</div><div class="col text-right tot_delivery">3,000원</div></div>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>