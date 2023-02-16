<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_product_best_item.jsp</title>
	<script>
		'use strict';
		$(function(){
		});
	</script>
	<style>
		.carousel-control-next, .carousel-control-prev {
		    position: relative;
		    top: 0;
		    bottom: 0;
		    z-index: 1;
		    display: -ms-flexbox;
		    display: flex;
		    -ms-flex-align: center;
		    align-items: center;
		    -ms-flex-pack: center;
		    justify-content: center;
		    width: 15%;
		    color: #000;
		    text-align: center;
		    opacity: .5;
		    transition: opacity .15s ease;
		}
		.carousel-control-next-icon {
    		background-image: url(${ctp}/images/right_arrow_icon.png);
		}
		.carousel-control-prev-icon {
    		background-image: url(${ctp}/images/left_arrow_icon.png);
		}
		.best-item-main-logo {
			font-weight: 800;
			font-size: 2rem;
			color: #000;
		}
		.best-item-message {
			font-weight: 800;
			font-size: 1rem;
			color: #aaa;
		}
		.product-name {
			text-align: center;
			font-weight: 700;
			font-size: 1.1rem;
			color: #111;
			padding: 5px;
		}
		.product-price {
			text-align: center;
			font-weight: 800;
			font-size: 1rem;
			color: #333;
		}
		.product-sale-price {
			text-align: center;
			font-weight: 800;
			font-size: 1rem;
			color: red;
		}
		.best-product_image, .new-product_image {
			width: 250px;
			height: 320px;
		}
		.product-click:hover {
			text-decoration: none;
			transition: 0.5s ease-out;
			opacity: 0.7;
		}
		.product-click:not(:hover) {
    		transition: 1s ease-out;
		}
	</style>
</head>
<body>
	<p><br/><br/><br/></p>
	<div class="mt-5" style="width: 100%; margin: 0px auto;">
		<div id="carouselExampleControls" class="best-item carousel slide mb-4" data-ride="carousel">
		  	<div class="row"><div class="col text-center"><font class="best-item-main-logo">BEST ITEM</font></div></div>
			<div class="row mt-2" style="width: 50%; margin: 0 auto;">
				<div class="col" style="text-align: left;">
				    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				      <span class="carousel-control-prev-icon"></span>
				      <span class="sr-only">Previous</span>
				    </a>
			  	</div>
			    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			      <span class="carousel-control-next-icon"></span>
			      <span class="sr-only">Next</span>
			    </a>
		  	</div>
		  	<div class="row mb-5"><div class="col text-center"><font class="best-item-message">BEST ITEM과 MD 추천아이템! GO! WITH MQQNEYES!</font></div></div>
			<div class="carousel-inner" style="width: 75%; margin: 0px auto;">
				<c:forEach var="vo" items="${product_vos}" varStatus="st">
					<c:set var="product_images" value="${fn:split(vo.product_fSName,'/')}"></c:set>
			    	<c:if test="${st.index == 0}"><div class="row carousel-item active"></c:if>
			    	<c:if test="${st.index != 0 && st.index % 5 == 0}"><div class="row carousel-item"></c:if>
			    		<c:if test="${st.index % 5 == 0}"><div class="row" style="margin: 0 auto;"></c:if>
					    	<div class="col">
					    		<a href="${ctp}/product/product_view?product_idx=${vo.product_idx}" class="product-click">
						    		<img src="/green2209S_09/data/product/${product_images[0]}" class="best-product_image"/><br/>
						    		<p style="height: 50px;" class="product-name">${vo.product_name}</p><hr/>
						    		<c:if test="${vo.product_sale_price == 0}"><p class="product-price"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/>원</p></c:if>
						    		<c:if test="${vo.product_sale_price != 0}"><p class="text-center"><span class="product-price"><img src="${ctp}/images/sale-icon.png" width="30vw"/>&nbsp;<del><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/>원</del></span><span class="product-sale-price">&nbsp;<fmt:formatNumber value="${vo.product_sale_price}" pattern="#,###"/>원</span></p></c:if>
					    		</a>
					    	</div>
			    		<c:if test="${st.count % 5 == 0}"></div></c:if>
		    		<c:if test="${st.count % 5 == 0}"></div></c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<p><br/><br/><br/></p>
</body>
</html>