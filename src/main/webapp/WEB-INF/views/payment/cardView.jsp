<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cardView.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<style>
		.container .title_move img {
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
		.order-product-view {
			font-size: 1rem;
			width: 50%;
			margin: 0 auto;
			border: 1px solid #ececec;
			padding: 0px 15px;
			letter-spacing: -1px;
		}
		.order-info-view {
			font-size: 1rem;
			width: 50%;
			margin: 0 auto;
			border: 1px solid #ececec;
			padding: 0px 15px;
			background: #fdfdfd;
			letter-spacing: -1px;			
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
			<br/><br/>
			<c:set var="cart_idx_arr" value="${fn:split(inputVO.product_idx,'/')}" />
			<c:set var="count" value="${fn:length(cart_idx_arr)}" />
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<div class="row mb-3"><div class="col text-center"><b>주문해 주셔서 감사합니다.<b></div></div>
			<div class="order-product-view mt-3">
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">상품명</div>
					<div class="col">${vo.name}</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">배송비</div>
					<c:if test="${vo.amount > 50000}"><c:set var="delivery_price" value="0" /></c:if>
					<c:if test="${vo.amount < 50000}"><c:set var="delivery_price" value="3000" /></c:if>
					<div class="col"><fmt:formatNumber value="${delivery_price}" pattern="#,###" />원</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">구매자</div>
					<div class="col">${vo.buyer_name}</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">전화번호</div>
					<div class="col">${vo.buyer_tel}</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">배송지</div>
					<div class="col">${vo.buyer_addr}</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">최종 구입금액</div>
					<div class="col" style="color: blue;"><fmt:formatNumber value="${vo.amount}" pattern="#,###" />원</div>
				</div>
			</div>
			<div class="text-center mt-4" style="font-size: 1rem;">카드결제가 완료되었습니다.<br/>주문해 주셔서 감사합니다.</div>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>