<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mooneyes_order_list.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
<script type="text/javascript" src="${ctp}/js/menu.js"></script>
<link rel="stylesheet" href="${ctp}/resources/css/product-list.css">
<script>
	'use strict';
	$(function(){
		$("#order_status").change(function(){
			let payment = $("#order_status").val();
			location.href="${ctp}/order/order_list?payment="+payment;
		});
	});
</script>
<style>
	.mooneyes_order_list {
		padding: 10px;
	}
	.mooneyes_order_list input:focus, .mooneyes_order_list select:focus {
		outline: none;
	}
	.mooneyes_order_list .title_move img {
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
	#order_status {
		width: 100%;
		padding: 5px;
		font-size: 1rem;
		border: 1px solid #ececec;
	}
	.row div {
		text-align: center;
	}
	.order-list-view-css:hover {
		text-decoration: none;
		font-weight: 800;
		color: #000;
		transition: 0.5s;
	}
</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div style="width: 100%; margin: 0 auto;">
		<p><br/></p>
		<div class="mooneyes_order_list" style="width: 70%; margin: 0 auto;">
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<div class="row mt-2 mb-4"><div class="col text-center" style="font-weight: 800; font-size: 1.6rem;">주문 조회</div></div>
			<div class="mb-2" style="background: rgba(213,213,213,0.5); border: 1px solid #ececec; padding-right:10px; padding-left:10px;">
				<div class="row">
					<div class="col-1 text-center" style="font-weight: 700; font-size: 1rem; padding:10px; padding-top:15px;">상태</div>
					<div class="col" style="padding: 10px;">
						<select id="order_status" name="order_status">
							<option value="" ${payment == '' ? 'selected' : ''}>전체 주문처리상태</option>
							<option value="N" ${payment == 'N' ? 'selected' : ''}>입금전</option>
							<option value="Y" ${payment == 'Y' ? 'selected' : ''}>배송준비중</option>
							<option value="D" ${payment == 'D' ? 'selected' : ''}>배송중</option>
							<option value="O" ${payment == 'O' ? 'selected' : ''}>배송완료</option>
							<option value="C" ${payment == 'C' ? 'selected' : ''}>취소</option>
							<option value="E" ${payment == 'E' ? 'selected' : ''}>교환</option>
							<option value="R" ${payment == 'R' ? 'selected' : ''}>반품</option>
						</select>
					</div>
				</div>
			</div>
			<c:if test="${vos == null}"><div class="row mt-4"><div class="col text-center">주문 내역이 없습니다.</div></div></c:if>
			<c:if test="${vos != null}">
				<c:set var="size" value="${fn:length(vos)}" />
				<div class="row" style="font-size: 1rem; width: 100%; margin: 0 auto; padding:10px; border: 1px solid #ececec; background: rgba(236,236,236,0.5); font-weight: 800;">
					<div class="col-1 p-0" style="border-right: 1px solid #ececec;">주문번호</div>
					<div class="col-1 p-0" style="border-right: 1px solid #ececec;">주문자성명</div>
					<div class="col p-0" style="border-right: 1px solid #ececec;">상품명</div>
					<div class="col-1 p-0" style="border-right: 1px solid #ececec;">결제수단</div>
					<div class="col-1 p-0" style="border-right: 1px solid #ececec;">결제금액</div>
					<div class="col-1 p-0" style="border-right: 1px solid #ececec;">주문일자</div>
					<div class="col-1 p-0">주문상태</div>
				</div>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<c:if test="${empty vo.order_idx}"><div class="row mt-4"><div class="col text-center" style="font-size: 0.9rem; font-weight: 800;">주문 내역이 존재하지 않습니다.</div></div></c:if>
					<c:if test="${!empty vo.order_idx}">
					<c:set var="product_idx_arr" value="${fn:split(vo.product_idx,'/')}" />
					<c:set var="productCount" value="${fn:length(product_idx_arr)}" />
					<a href="${ctp}/order/order_list_view?order_idx=${vo.order_idx}&member_cart_idx=${vo.product_idx}" class="order-list-view-css">
						<div>
							<c:if test="${size != st.count}"><div class="row" style="font-size: 0.9rem; width: 100%; margin: 0 auto; padding: 10px; border: 1px solid #ececec; border-bottom: 0px;"></c:if>
							<c:if test="${size == st.count}"><div class="row" style="font-size: 0.9rem; width: 100%; margin: 0 auto; padding: 10px; border: 1px solid #ececec;"></c:if>
								<div class="col-1 p-0" style="border-right: 1px solid #ececec; padding: 10px;">${vo.order_idx}</div>
								<div class="col-1 p-0" style="border-right: 1px solid #ececec; padding: 10px;">${vo.order_name}</div>
								<div class="col p-0" style="border-right: 1px solid #ececec;">${vo.product_name} <c:if test="${productCount != 1}">등 ${productCount}개</c:if></div>
								<div class="col-1 p-0" style="border-right: 1px solid #ececec;"><c:if test="${vo.addr_paymethod == 'card'}">카드결제</c:if><c:if test="${vo.addr_paymethod == 'cash'}">무통장입금</c:if></div>
								<div class="col-1 p-0" style="border-right: 1px solid #ececec;"><fmt:formatNumber value="${vo.order_tot_price}" pattern="#,###"/>원</div>
								<div class="col-1 p-0" style="border-right: 1px solid #ececec;">${fn:substring(vo.order_date,0,16)}</div>
								<div class="col-1 p-0">
									<c:if test="${vo.payment == 'N'}">입금전</c:if>
									<c:if test="${vo.payment == 'Y'}">배송준비중</c:if>
									<c:if test="${vo.payment == 'D'}">배송중</c:if>
									<c:if test="${vo.payment == 'O'}">배송완료</c:if>
									<c:if test="${vo.payment == 'C'}">취소</c:if>
									<c:if test="${vo.payment == 'E'}">교환</c:if>
									<c:if test="${vo.payment == 'R'}">반품</c:if>
								</div>
							</div>
						</div>
					</a>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!-- 블록 페이지 시작 -->
	<div class="text-center mt-2" style="width: 75%; margin: 0 auto;">
		<ul class="pagination justify-content-center">
     		<li class="page-item ml-1 mr-1">
	     		<a class="this-circle" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=1&payment=${payment}" class="first"><i class="fas fa-angle-double-left"></i></a>
     		</li>
     		<li class="page-item ml-1 mr-1">
     			<c:if test="${(pageVo.curBlock-1)*pageVo.blockSize + 1 > 1}"><a class="this-circle" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}&payment=${payment}"><i class="fas fa-angle-left"></i></a></c:if>
     			<c:if test="${(pageVo.curBlock-1)*pageVo.blockSize + 1 < 1}"><a class="this-circle" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=${pageVo.pag}&payment=${payment}"><i class="fas fa-angle-left"></i></a></c:if>
     		</li>
	   		<c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
	     		<c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
	   				<li class="page-item active ml-1 mr-1">
	   					<a class="this" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=${i}&payment=${payment}">${i}</a>
   					</li>
	   			</c:if>
	     		<c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
	   				<li class="page-item ml-1 mr-1">
	   					<a class="this" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=${i}&payment=${payment}">${i}</a>
   					</li>
	   			</c:if>
	   		</c:forEach>
     		<li class="page-item ml-1 mr-1">
	     		<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><a class="this-circle" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}&payment=${payment}" class="first"><i class="fas fa-angle-right"></i></a></c:if>
	     		<c:if test="${pageVo.curBlock == pageVo.lastBlock}"><a class="this-circle" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=${pageVo.pag}&payment=${payment}" class="first"><i class="fas fa-angle-right"></i></a></c:if>
    			</li>
			<li class="page-item ml-1 mr-1">
	     		<a class="this-circle" href="${ctp}/order/order_list?pageSize=${pageVo.pageSize}&pag=${pageVo.totPage}&payment=${payment}" class="first"><i class="fas fa-angle-double-right"></i></a>
			</li>
		</ul>
	</div>
	<!-- 블록 페이지 끝 -->
	<!--푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>