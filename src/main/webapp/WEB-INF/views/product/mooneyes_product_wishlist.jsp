<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_product_wishlist.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<style>
		.product-wishlist a:hover {
			text-decoration: none;
		}
		.wish_img {
			width: 70px;
		}
		.title_move img {
			position: relative;
			-webkit-animation: myfirst 0.7s linear 1s infinite alternate;
			animation: myfirst 0.7s linear 1s infinite alternate;
		}
		@-webkit-keyframes myfirst {
			0% {opacity: 1.0; top: 15px;}
			100% {opacity: 1.0; top: 0px;}
		}
		@keyframes myfirst {
			0% {opacity: 1.0; top: 15px;}
			100% {opacity: 1.0; top: 0px;}
		}
		input[type="checkbox"] {
		    width: 18px;
		    height: 18px;
		    border: 0;
		    background: url(//img.echosting.cafe24.com/skin/mobile/common/bg_checkbox.png) no-repeat 0 0;
		    background-size: 18px 18px;
		    -webkit-appearance: none;
		}
		input[type="checkbox"]:checked {
		    background-image: url(//img.echosting.cafe24.com/skin/mobile/common/bg_checkbox_checked.png);
		    -webkit-appearance: none;
		}
		.wish-list {
			border: 1px solid #ececec;
			padding: 10px 30px;
			font-size: 1rem;
		}
		#white-button-css {
			padding: 5px;
			font-size: 0.9rem;
			color: #000;
			background-color: #fff;
			border: 1px solid #ececec;
		}
		#black-button-css {
			padding: 5px;
			font-size: 0.9rem;
			color: #fff;
			background-color: #000;
			border: 1px solid #000;
		}
		#wish-product-name, #wish-product-price {
			font-weight: 800;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div style="width: 100%; margin: 0 auto;">
		<div class="product-wishlist" style="width: 75%; margin: 0 auto;">
			<br/><br/>
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<div class="row mb-4 text-center"><div class="col text-center" style="font-weight: 800;">관심상품</div></div>
			<c:if test="${vos == null}"><div class="text-center">관심 상품이 없습니다.</div></c:if>
			<c:if test="${vos != null}">
				<div class="wish-list">
					<c:forEach var="vo" items="${vos}" varStatus="st">
						<div class="row">
							<div class="col-1" id="wish-img" style="border-bottom: 1px solid #ececec; padding: 10px 10px 10px 20px;">
								<input type="checkbox" id="wish_chk_id_${st.index}" name="wish_chk" onclick="wish_chk(${st.index})"/><br/>
								<c:set var="product_image_arr" value="${fn:split(vo.product_fSName,'/')}"/>
								<c:forEach var="product_image" items="${product_image_arr}" varStatus="imgCnt">
									<c:if test="${imgCnt.index == 0}"><img src="${ctp}/data/product/${product_image}" class="wish_img"/></c:if>
								</c:forEach>
							</div>
							<div class="col-11" style="border-bottom: 1px solid #ececec; padding: 10px 10px 10px 20px;">
								<br/>
								<span id="wish-product-name">${vo.product_name}</span><br/>
								<span id="wish-product-price"><c:if test="${vo.product_sale_price == 0}"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></c:if><c:if test="${vo.product_sale_price != 0}"><font color='red'><fmt:formatNumber value="${vo.product_sale_price}" pattern="#,###"/></font></c:if></span>원
							</div>
						</div>
						<div class="row" style="padding-top: 5px;">
							<div class="col-6 text-left" style="padding: 10px 10px 10px 20px; font-weight: 800;"><c:if test="${vo.product_size != '' && vo.product_size != ''}">[옵션:${vo.product_color}/${vo.product_size}]</c:if></div>
							<div class="col-6 text-right" style="padding: 10px 10px 10px 20px;"><a href="" id="white-button-css"  style="background-color: #ececec;">옵션변경</a></div>
						</div>
						<div class="row" style="padding-bottom: 5px;">
							<div class="col-6 text-left" style="padding: 10px 10px 10px 20px;"><a href="" id="white-button-css"><b>삭제</b></a>&nbsp;<a href="" id="white-button-css">장바구니담기</a></div>
							<div class="col-6 text-right" style="padding: 10px 10px 10px 20px;"><a href="" id="black-button-css">주문하기</a></div>
						</div>
					</c:forEach>
					<div class="row" style="border-top: 1px solid #ececec; height:5vh; padding: 20px 0px 5px 5px;">
						<div class="col"><a href="" id="white-button-css">전체선택</a>&nbsp;<a href="" id="white-button-css">선택삭제</a></div>
					</div>
				</div>
			</c:if>
		</div>
	</div>	
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>