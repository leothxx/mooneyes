<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cashView.jsp</title>
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
					<div class="col">${product_name} 등 ${order_count}개</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">총 구매수량</div>
					<div class="col">${order_count}개</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">총 구입금액</div>
					<div class="col"><fmt:formatNumber value="${inputVO.order_price}" pattern="#,###" />원</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">배송비</div>
					<div class="col"><fmt:formatNumber value="${inputVO.delivery_price}" pattern="#,###" />원</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">포인트 사용</div>
					<div class="col"><fmt:formatNumber value="${inputVO.order_point}" pattern="#,###" />원</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">구매자</div>
					<div class="col">${inputVO.buyer_name}</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">전화번호</div>
					<div class="col">${inputVO.buyer_tel1}-${inputVO.buyer_tel2}-${inputVO.buyer_tel3}</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">배송지</div>
					<div class="col">${inputVO.postcode} ${inputVO.roadAddress} ${inputVO.detailAddress} ${inputVO.extraAddress}</div>
				</div>
				<div class="row p-2">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">배송메세지</div>
					<div class="col">${inputVO.delivery_msg}</div>
				</div>
				<div class="row p-2">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">적립 예정금액</div>
					<div class="col"><fmt:formatNumber value="${inputVO.order_tot_point}" pattern="#,###" />원</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">최종 구입금액</div>
					<div class="col" style="color: blue;"><fmt:formatNumber value="${inputVO.order_tot_price}" pattern="#,###" />원</div>
				</div>
			</div>
			<div class="text-center mt-4" style="font-size: 1rem;">무통장 입금 결제시, 입금 후 발송까지 최소 2일 이내 소요될 수 있다는 점 양해 부탁드립니다.<br/><font color="red">아래의 입금계좌로 입금예정인 이름과 동일한 이름으로 입금해주시기 바랍니다.</font></div>
			<div class="order-info-view mt-4">
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">입금계좌</div>
					<div class="col">국민 712401-01-603058 문아이즈(서하늘)</div>
				</div>
				<div class="row p-2" style="border-bottom: 1px solid #ececec;">
					<div class="col-2 text-center" style="border-right: 1px solid #ececec;">입금예정인</div>
					<div class="col">${inputVO.paymethod_bank_buyer_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #aaa; font-weight: 500; font-size: 0.8rem;">입금시 착오가 없도록 주의해주세요!</span></div>
				</div>
			</div>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>