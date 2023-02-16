<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<link rel="stylesheet" href="${ctp}/resources/css/new-item.css">
	<script>
		'use strict';
		
		$(window).scroll(function() {
			
			// windowScrollTop : 현재 viewport의 스크롤 윗점
	    	const windowScrollTop = $(window).scrollTop();
	  		// height : 백분율을 구할 높이 (위 예시에서 2000-500을 하는 과정)
	    	const height = $(document).height() - $(window).height();
	  		// procent : 현재 위치의 스크롤 백분율
	    	const procent = Math.floor(windowScrollTop / height * 100);
	    	
		    if(procent == 25) {
				$(".best-item").addClass("animate__animated animate__bounceInRight");
			}
		    else if(procent == 30) {
				$(".best-product_image").addClass("animate__animated animate__pulse");
		    }
		    else if(procent == 35) {
				$(".new-product_image").addClass("animate__animated animate__pulse");
				$(".best-item").removeClass("animate__animated animate__bounceInRight");
		    }
		    else if(procent == 45) {
				$(".new-product_image").removeClass("animate__animated animate__pulse");
		    }
		    else if(procent == 55) {
				$(".new-product_image").addClass("animate__animated animate__pulse");
		    }
		    else if(procent == 65) {
				$(".new-product_image").removeClass("animate__animated animate__pulse");
		    }
		    else if(procent == 75) {
				$(".new-product_image").addClass("animate__animated animate__pulse");
		    }
		    else if(procent == 85) {
				$(".new-product_image").removeClass("animate__animated animate__pulse");
		    }
			
		    
		});
		
	</script>
	<style>
		body, code {
		    font-size: 1.5rem;
		    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움','AppleGothic','Apple SD Gothic Neo','sans-serif';
		    color: #353535;
		    background: #fff;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"></jsp:include>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"></jsp:include>
	<!-- AD -->
	<p><img src="${ctp}/resources/images/backgroundimage.jpg" width="100%" height="100%"/><p>
	<!-- 메인 -->
	<div class="container">
	</div>
	<!-- 베스트 상품 -->
	<jsp:include page="/WEB-INF/views/product/mooneyes_product_best_item.jsp"></jsp:include>
	<!-- 신상품 -->
	<div class="new_item_line">
		<div class="new-item animate__animated mt-5" style="width: 100%; margin: 0px auto;">
			<p><br/><br/><br/></p>
			<div class="row mb-3"><div class="col new-item-logo">NEW ARRIVAL ITEM!</div></div>
			<div class="row mb-5"><div class="col new-item-text">MOONEYES KOREA에 입고 된 신상품 입니다 QQ</div></div>
			<div style="width: 75%; margin: 0 auto;">
				<c:forEach var="new_vo" items="${new_vos}" varStatus="st">
					<c:set var="new_product_images" value="${fn:split(new_vo.product_fSName,'/')}"></c:set>
			    		<c:if test="${st.index % 5 == 0}"><div class="row" style="margin: 0 auto;"></c:if>
					    	<div class="col">
					    		<a href="${ctp}/product/product_view?product_idx=${new_vo.product_idx}" class="product-click">
						    		<img src="/green2209S_09/data/product/${new_product_images[0]}" class="new-product_image"/><br/>
						    		<p class="product-name">${new_vo.product_name}</p><hr/>
						    		<c:if test="${new_vo.product_sale_price == 0}"><p class="product-price"><fmt:formatNumber value="${new_vo.product_price}" pattern="#,###"/>원</p></c:if>
						    		<c:if test="${new_vo.product_sale_price != 0}"><p class="text-center"><span class="product-price"><img src="${ctp}/images/sale-icon.png" width="30vw"/>&nbsp;<del><fmt:formatNumber value="${new_vo.product_price}" pattern="#,###"/>원</del></span><span class="product-sale-price">&nbsp;<fmt:formatNumber value="${new_vo.product_sale_price}" pattern="#,###"/>원</span></p></c:if>
					    		</a>
					    	</div>
		    		<c:if test="${st.count % 5 == 0}"></div></c:if>	
				</c:forEach>
			</div>		
		</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>