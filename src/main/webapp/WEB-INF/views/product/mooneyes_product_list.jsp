<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_product_list.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<link rel="stylesheet" href="${ctp}/resources/css/product-list.css">
	<script>
		'use strict';
		function wishlist_input(product_idx) {
			let query = {
	 				product_idx : product_idx,
	 				product_size : '',
	 				product_color : ''
	 		};
	 		
	 		$.ajax({
	 			type: "post",
	 			url: "${ctp}/product/wishlist-input",
	 			data : query,
	 			success : function(res) {
	 				if(res == 0) alert("위시리스트 저장중 에러가 발생하였습니다.\n다시 시도해 주세요!");
	 				else {
	 					alert("위시리스트에 성공적으로 저장되었습니다!");
	 				}
	 			},
	 			error : function() {
	 				alert("전송 오류!");
	 			}
	 		});			
		}
	</script>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<br/>
	<div style="width: 100%; margin: 0 auto;">
		<div style="width: 75%; margin: 0 0 0 300px;">
			<p><br/><br/></p>
			<div class="row text-center"><div class="col"><c:if test="${category_vo == null }">ALL ITEM.</c:if><c:if test="${category_vo != null}">${category_name}.</c:if></div></div><br/>
			<c:if test="${category_vo != null}">
				<div class="row category-menu">
					<ul class="menu-category">
						<c:if test="${mini_vos == null}">
							<c:forEach var="vo" items="${sub_vos}" varStatus="st">
								<li><a href="${ctp}/product/main_category_view?category_main=${param.category_main}&category_sub=${vo.category_sub}">${vo.category_sub_name}.</a></li>
							</c:forEach>
						</c:if>
						<c:if test="${mini_vos != null}">
							<c:forEach var="vo" items="${mini_vos}" varStatus="st">
							<li><a href="${ctp}/product/main_category_view?category_main=${param.category_main}&category_sub=${vo.category_sub}&category_mini=${vo.category_mini}">${vo.category_mini_name}.</a></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</c:if>
			<div class="row pl-3 mb-4">
				<select id="product_view_option" name="product_view_option">
					<option value="new-item">신상품</option>
					<option value="name-item">상품명</option>
					<option value="lowPrice-item">낮은가격</option>
					<option value="HighPrice-item">높은가격</option>
					<option value="hot-item">인기상품</option>
					<option value="review-item">리뷰</option>
					<option value="hits-item">조회수</option>
					<option value="like-item">좋아요</option>
				</select>
			</div>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<c:set var="product_images" value="${fn:split(vo.product_fSName,'/')}"></c:set>
				<c:if test="${st.index % 5 == 0}"><div class="row"></c:if>
					<div class="col">
						<a href="${ctp}/product/product_view?product_idx=${vo.product_idx}" class="product-click">
				    		<img src="/green2209S_09/data/product/${product_images[0]}" class="best-product_image"/><br/>
				    		<p class="product-name" style="height:50px;">${vo.product_name}</p><hr/>
				    		<c:if test="${vo.product_sale_price == 0}"><p class="product-price"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/>원</p></c:if>
				    		<c:if test="${vo.product_sale_price != 0}"><p class="text-center"><span class="product-price"><img src="${ctp}/images/sale-icon.png" width="30vw"/>&nbsp;<del><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/>원</del></span><span class="product-sale-price">&nbsp;<fmt:formatNumber value="${vo.product_sale_price}" pattern="#,###"/>원</span></p></c:if>
				    		<p style="text-align: center;"><a href="javascript:wishlist_input('${vo.product_idx}')"><img src="${ctp}/images/icon_add_to_wishlist.png" class="cart-images"/></a></p>
			    		</a>
					</div>
				<c:if test="${st.count % 5 == 0}"></div></c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 블록 페이지 시작 -->
	<div class="text-center" style="width: 75%; margin: 0 0 0 300px;">
		<ul class="pagination justify-content-center">
     		<li class="page-item ml-1 mr-1">
	     		<a class="this-circle" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=1&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}" class="first"><i class="fas fa-angle-double-left"></i></a>
     		</li>
     		<li class="page-item ml-1 mr-1">
     			<c:if test="${(pageVo.curBlock-1)*pageVo.blockSize + 1 > 1}"><a class="this-circle" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}"><i class="fas fa-angle-left"></i></a></c:if>
     			<c:if test="${(pageVo.curBlock-1)*pageVo.blockSize + 1 < 1}"><a class="this-circle" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=${pageVo.pag}&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}"><i class="fas fa-angle-left"></i></a></c:if>
     		</li>
	   		<c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
	     		<c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
	   				<li class="page-item active ml-1 mr-1">
	   					<a class="this" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=${i}&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}">${i}</a>
   					</li>
	   			</c:if>
	     		<c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
	   				<li class="page-item ml-1 mr-1">
	   					<a class="this" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=${i}&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}">${i}</a>
   					</li>
	   			</c:if>
	   		</c:forEach>
     		<li class="page-item ml-1 mr-1">
	     		<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><a class="this-circle" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}" class="first"><i class="fas fa-angle-right"></i></a></c:if>
	     		<c:if test="${pageVo.curBlock == pageVo.lastBlock}"><a class="this-circle" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=${pageVo.pag}&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}" class="first"><i class="fas fa-angle-right"></i></a></c:if>
    			</li>
			<li class="page-item ml-1 mr-1">
	     		<a class="this-circle" href="${ctp}/product/main_category_view?pageSize=${pageVo.pageSize}&pag=${pageVo.totPage}&category_main=${param.category_main}&category_sub=${param.category_sub}&category_mini=${param.category_mini}" class="first"><i class="fas fa-angle-double-right"></i></a>
			</li>
		</ul>
	</div>
	<!-- 블록 페이지 끝 -->
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>