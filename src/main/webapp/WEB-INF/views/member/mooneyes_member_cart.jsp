<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		let select_cnt = 0;
		$(function(){
			$("#cart").addClass("show");
			$(".product_opt_view").hide();
		});
		
		// 상품 수량을 - 했을 시
		function count_down(index, price, sale_price) {
			if($("#basket_chk_id_"+index+"").is(":checked") == true) {
				$("#basket_chk_id_"+index+"").prop("checked",false);
				basket_chk(index);
			}
			
			let count = document.getElementById("basket_product_count_"+index+"").value;
			let product_price = document.getElementById("product_price_"+index+"").innerText;
			let product_sale_price = document.getElementById("product_sale_price_"+index+"").innerText;
			let product_point = document.getElementById("product_point_"+index+"").innerText;
			product_sale_price = product_price.replaceAll(',','');
			product_price = product_price.replaceAll(',','');
			product_point = product_point.replaceAll(',','').replace('원','');
			
			if(count <= 1) {
				alert("최소 구매 수량은 1개입니다.");
				return false;
			}
			
			count --;
			document.getElementById("basket_product_count_"+index+"").value = count;
			
			if(product_sale_price != '0') {
				sale_price = (sale_price * count).toLocaleString('ko-KR');
				document.getElementById("product_sale_price_"+index+"").innerText = sale_price;
			}
			
			product_price = (price * count).toLocaleString('ko-KR');
			product_point = ((price * count) * 0.01).toLocaleString('ko-KR');
			document.getElementById("product_price_"+index+"").innerHTML = product_price;
			document.getElementById("product_point_"+index+"").innerHTML = product_point+"원";
			
			if($("#basket_chk_id_"+index+"").is(":checked") == true) {
				basket_chk(index);	
			}
		}
		
		// 상품 수량을 + 했을 시
		function count_up(index, price, sale_price) {
			if($("#basket_chk_id_"+index+"").is(":checked") == true) {
				$("#basket_chk_id_"+index+"").prop("checked",false);
				basket_chk(index);
			}
			
			let count = document.getElementById("basket_product_count_"+index+"").value;
			let product_price = document.getElementById("product_price_"+index+"").innerText;
			let product_sale_price = document.getElementById("product_sale_price_"+index+"").innerText;
			let product_point = document.getElementById("product_point_"+index+"").innerText;
			product_sale_price = product_price.replaceAll(',','');
			product_price = product_price.replaceAll(',','');
			product_point = product_point.replaceAll(',','').replace('원','');
			
			count ++;
			document.getElementById("basket_product_count_"+index+"").value = count;
			
			if(product_sale_price != '0') {
				sale_price = (sale_price * count).toLocaleString('ko-KR');
				document.getElementById("product_sale_price_"+index+"").innerText = sale_price;
			}
			
			product_price = (price * count).toLocaleString('ko-KR');
			product_point = ((price * count) * 0.01).toLocaleString('ko-KR');
			document.getElementById("product_price_"+index+"").innerHTML = product_price;
			document.getElementById("product_point_"+index+"").innerHTML = product_point+"원";
		}
		
		// 체크박스 선택시
		function basket_chk(index) {
			let product_price = document.getElementById("product_price_"+index+"").innerText;
			let product_sale_price = document.getElementById("product_sale_price_"+index+"").innerText;
			let product_point = document.getElementById("product_point_"+index+"").innerText;
			product_sale_price = product_sale_price.replaceAll(',','');
			product_price = product_price.replaceAll(',','');
			product_point = product_point.replaceAll(',','').replace('원','');
			
			let tot_buy_price = document.getElementById("tot_buy_price").innerText.replace('원','').replaceAll(',','');
			let tot_price = document.getElementById("tot_price").innerText.replace('원','').replaceAll(',','');
			let tot_delivery = document.getElementById("tot_delivery").innerText.replace('원','').replaceAll(',','');
			let tot_point = document.getElementById("tot_point").innerText.replace('원','').replaceAll(',','');
			
			
			if($("#basket_chk_id_"+index+"").is(":checked") == true) {
				let price = Number(product_price - product_sale_price);
				let final_buy_price = Number(tot_buy_price) + price;
				let final_price = Number(tot_price) + price;
				let final_point = Number(tot_point) + Number(product_point);
				document.getElementById("tot_buy_price").innerText = final_buy_price.toLocaleString('ko-KR')+'원';
				document.getElementById("tot_price").innerText = final_price.toLocaleString('ko-KR')+'원';
				document.getElementById("tot_point").innerText = final_point.toLocaleString('ko-KR')+'원';
				if(Number(tot_price + price) < 50000) {
					document.getElementById("tot_delivery").innerText = '3,000원';
				}
				else {
					document.getElementById("tot_delivery").innerText = '0원';
				}
			}
			
			else if($("#basket_chk_id_"+index+"").is(":checked") == false) {
				let price = Number(product_price) - Number(product_sale_price);
				let final_buy_price = Number(tot_buy_price) - Number(price);
				let final_price = Number(tot_price) - Number(price);
				let final_point = Number(tot_point) - Number(product_point);
				document.getElementById("tot_buy_price").innerText = final_buy_price.toLocaleString('ko-KR')+'원';
				document.getElementById("tot_price").innerText = final_price.toLocaleString('ko-KR')+'원';
				document.getElementById("tot_point").innerText = final_point.toLocaleString('ko-KR')+'원';
				if((tot_price - price) < 50000) {
					document.getElementById("tot_delivery").innerText = '3,000원';
				}
				else {
					document.getElementById("tot_delivery").innerText = '0원';
				}
				
			}
		}
		
		// 결제 금액 초기화 메소드
		function money_reset() {
			document.getElementById("tot_buy_price").innerText = '0원';
			document.getElementById("tot_price").innerText = '0원';
			document.getElementById("tot_delivery").innerText = '3,000원';
			document.getElementById("tot_point").innerText = '0원';
		}
		// 결제 금액 재계산 메소드
		function money_count(index) {
			let product_price_total = 0;
			let product_point_total = 0;
			
			for(let i=0; i<index; i++) {
				let product_price = document.getElementById("product_price_"+i+"").innerText;
				let product_sale_price = document.getElementById("product_sale_price_"+i+"").innerText;
				let product_point = document.getElementById("product_point_"+i+"").innerText;
				product_sale_price = product_sale_price.replaceAll(',','').replace('원','');
				product_price = product_price.replaceAll(',','').replace('원','');
				product_point = product_point.replaceAll(',','').replace('원','');
				
				product_price_total += Number(product_price) - Number(product_sale_price);
				product_point_total += Number(product_point);
				
				
				if(product_price_total < 50000) {
					document.getElementById("tot_delivery").innerText = '3,000원';
				}
				else {
					document.getElementById("tot_delivery").innerText = '0원';
				}
				document.getElementById("tot_buy_price").innerText = product_price_total.toLocaleString('ko-KR')+'원';
				document.getElementById("tot_price").innerText = product_price_total.toLocaleString('ko-KR')+'원';
				document.getElementById("tot_point").innerText = product_point_total.toLocaleString('ko-KR')+'원';
			}
		}
		
		// 상품 전체 선택 클릭시
		function all_chk(size) {
			if(select_cnt == 0) {
				for(let i=0; i<size; i++) {
					$("#basket_chk_id_"+i+"").prop('checked',true);
					money_count(size);
				}
				select_cnt = 1;
			}
			else if(select_cnt == 1) {
				for(let i=0; i<size; i++) {
					$("#basket_chk_id_"+i+"").prop('checked',false);
					money_reset();
				}
				select_cnt = 0;
			}
		}
		
		// 상품 옵션변경 선택시
		function opt_open(index, idx) {
			$("#product_opt_view_"+index+"").show();
		}
		
		// 상품 옵션 변경 취소
		function opt_close(index) {
			$("#product_opt_view_"+index+"").hide();
		}
		
		// 상품 옵션 변경
		function opt_change(index, member_cart_idx) {
			let size = $("#product_opt_size_"+index+"").val();
			let color = $("#product_opt_color_"+index+"").val();
			
			let query = {
					size : size,
					color: color,
					member_cart_idx : member_cart_idx
			};
			
			$.ajax({
				type: "post",
				url : "${ctp}/product/cart_opt_change",
				data : query,
				success : function(res) {
					if(res == 1) {
						alert("상품의 옵션이 변경되었습니다.");
						$("#colorANDsize_"+index+"").load(location.href+' #colorANDsize_'+index+'');
					}
					else alert("상품 옵션 변경 중 에러가 발생하였습니다.\n다시 시도해 주세요!");
				},
				error : function() {
					alert("전송 오류!");
				}
			});
		}
		
		// 상품 삭제 버튼 클릭시
		function basket_product_del(index, member_cart_idx, product_name) {
			let res = confirm(product_name+"\n상품을 삭제하시겠습니까??");
			if(res == false) {
				return false;
			}
			
			$.ajax({
				type: "post",
				url : "${ctp}/product/cart_product_delete",
				data : {member_cart_idx : member_cart_idx},
				success : function(res) {
					if(res == 1) {
						alert("상품이 삭제되었습니다.");
						location.reload();
					}
					else alert("상품 삭제 중 에러가 발생하였습니다.\n다시 시도해 주세요!");
				},
				error : function() {
					alert("전송 오류!");
				}
			});
		}
		
		// 선택 삭제 클릭시
		function del_chk(size) {
			let ans = confirm("선택된 상품을 삭제하시겠습니까?");
			if(ans == false) {
				return false;
			}
			
			let member_cart_idx = '';
			for(let i=0; i<size; i++) {
				if($("#basket_chk_id_"+i+"").is(":checked") == true) {
					member_cart_idx += $("#member_cart_idx_"+i+"").val() + "/";
				}
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/product/select_basket_del",
				data : {member_cart_idx : member_cart_idx},
				success : function(res) {
					if(res == 0) alert("상품 삭제 중 에러가 발생하였습니다.");
					else {
						alert("상품이 정상적으로 삭제되었습니다.");
						location.reload();
					}
				},
				error : function() {
					alert("전송 오류 발생!");
				}
			});
		}
		// 주문하기 버튼 클릭
		function basket_product_order(idx, index) {
			location.href="${ctp}/payment/payment?member_cart_idx="+idx;
		}
	</script>
	<style>
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
		.cart-product-menu {
			background-color: #ececec;
			border: 0px;
			font-size: 1rem;
			width: 100%;
			padding: 10px;
		}
		.cart-product-menu:focus {
			outline: none;
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
		.tot_point {
			font-size: 0.9rem;
			font-weight: 800;
		}
		#toggle-arrow-img {
			transition: all ease 1s;
		}
		.toggle-img-change {
			transform: rotate(180deg);
		}
		#basket_count {
			width: 100%;
			margin: 0 auto; 
			padding: 10px 0px; 
			font-weight: 800; 
			font-size: 1.1rem;
			border-bottom: 1px solid #ececec;
		}
		#basket_product {
			width: 99%;
			border-bottom: 1px solid #ececec;
			margin: 0 auto;
			padding-left: 0px;
		}
		#basket_product_img {
			width: 100%;
			margin-top: 10px;
		}
		#basket_product_name {
			font-weight: 800;
			font-size: 1.5rem;
		}
		.basket_product_count {
			width: 50px;
			border: 1px solid #ececec;
			font-size: 0.8rem;
		}
		.basket_product_count:focus {
			outline: none;
		}
		#product_option_change {
			padding: 5px;
			font-size: 0.9rem;
			color: #666;
			background-color: #ececec;
			border: 0px;
		}
		.basket_product_start {
			width: 99%;
			margin: 0 auto;
			border-top: 1px solid #ececec;
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
		#white-button-css:hover, #black-button-css:hover {
			text-decoration: none;
			color: #888;
			transition: 0.3s;
		}
		.basket_product_info {
			font-size: 1rem;
			font-weight: 700;
		}
		.basket_product_info span {
			display: inline-block;
			margin-bottom: 10px;
		}
		.basket_product_count_btn a img {
			width: 30px;
		}
		.basket-cart a:hover {
			text-decoration: none;
		}
		.product_opt_view {
			margin: 0 auto;
			width: 98%;
			height: 15vh;
			background-color: #ececec;
			font-size: 0.9rem;
			padding: 10px;
		}
		.product_opt_view div {
			padding: 0px;
			padding-left: 20px;
		}
		.product_opt_size, .product_opt_color {
			width: 100%;
		    max-width: 100%;
		    height: 29px;
		    margin: 0;
		    padding: 0 20px 0 8px;
		    line-height: 29px;
		    font-size: 0.9rem;
		    color: #000;
		    word-break: break-all;
		    font-weight: 700;
		    border: 1px solid #ececec;
		    border-radius: 0;
		    background: #fff url(//img.echosting.cafe24.com/skin/mobile/common/ico_select.gif) no-repeat 100% 49%;
		    background-size: auto 40px;
		    -webkit-appearance: none;
		}
		.product_opt_size:focus, .product_opt_color:focus {
			outline: none;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div style="width: 100%; margin: 0 auto;">
		<div class="basket-cart" style="width: 75%; margin: 0 auto;">
			<br/><br/>
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<button data-toggle="collapse" data-target="#cart" class="cart-product-menu" id="cart-product-menu"><div class="row"><div class="col text-left">장바구니 상품</div><div class="col text-right" id="arrow-btn-img"><img src="${ctp}/images/arrow_down.png" width="20px" /></div></div></button>
			<div id="cart" class="collapse">
				<div class="row text-left" id="basket_count">상품(${basket})</div>
				<c:set var="size" value="${fn:length(vos)}"/>
				<div class="row" style="margin: 5px 0px; padding-left: 20px;"><a href="javascript:all_chk(${size})" id="white-button-css">전체선택</a>&nbsp;<a href="javascript:del_chk(${size})" id="white-button-css">선택삭제</a></div>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<c:set var="split1" value="${fn:split(vo.product_fSName,'/') }"/>
					<c:set var="product_fSName" value="${split1[0]}"/>
					<c:if test="${st.index > 0}"><br/></c:if>
					<div class="row text-left basket_product_start"><div class="col"><input type="checkbox" id="basket_chk_id_${st.index}" name="basket_chk" onclick="basket_chk(${st.index})"/></div></div>
					<div class="row" id="basket_product">
						<div class="col-1"><img src="${ctp}/data/product/${product_fSName}" id="basket_product_img"></div>
						<div class="col text-left basket_product_info">
							<span id="basket_product_name">${vo.product_name}</span>
							<input type="hidden" name="member_cart_idx" id="member_cart_idx_${st.index}" value="${vo.member_cart_idx}" />
							<br/>
							<span>배송비 : <c:if test="${vo.product_price > 50000 || vo.product_sale_price > 50000}">[무료] / 기본배송</c:if><c:if test="${vo.product_price < 50000 && vo.product_sale_price < 50000}">3,000원</c:if></span><br/>
							<span><img src="${ctp}/images/ico_product_point.gif" /> <span id="product_point_${st.index}"><c:if test="${vo.product_sale_price == 0}"><fmt:formatNumber value="${(vo.product_price * vo.product_count) * 0.01}" pattern="#,###"/></c:if><c:if test="${vo.product_sale_price != 0}"><fmt:formatNumber value="${(vo.product_sale_price * vo.product_count) * 0.01}" pattern="#,###"/></c:if>원</span></span><br/>
							<span>상품 구매금액 : <span id="product_price_${st.index}"><fmt:formatNumber value="${vo.product_price * vo.product_count}" pattern="#,###"/></span>원</span><br/>
							<span>상품 할인금액 : <font color='red'>-<span id="product_sale_price_${st.index}"><c:if test="${vo.product_sale_price == 0}">0</c:if><c:if test="${vo.product_sale_price != 0}"><fmt:formatNumber value="${vo.product_price - vo.product_sale_price}" pattern="#,###"/></c:if></span></font>원</span><br/>
							<span class="basket_product_count_btn">
								<a href="javascript:count_down(${st.index},${vo.product_price},${vo.product_sale_price})"><img src="${ctp}/images/ico_quantity_down.jpg" /></a>
								<input type="tel" class="basket_product_count" style="text-align: right; padding-right: 5px;" name="basket_product_count" id="basket_product_count_${st.index}" value="${vo.product_count}" readonly />
								<a href="javascript:count_up(${st.index},${vo.product_price},${vo.product_sale_price})"><img src="${ctp}/images/ico_quantity_up.jpg" /></a>
							</span>
						</div>
					</div>
					<div class="row mb-3 pt-3" style="margin: 10px 0px; font-weight: 700; font-size: 0.9rem;">
						<div class="col text-left" id="colorANDsize_${st.index}">컬러 : ${vo.product_color} , 사이즈 : ${vo.product_size}</div>
						<div class="col text-right"><a href="javascript:opt_open(${st.index},${vo.member_cart_idx})" id="product_option_change">옵션변경</a></div>
					</div>
					<div class="row product_opt_view" id="product_opt_view_${st.index}">
						<div class="row" style="width: 100%;">
							<span><b>사이즈</b></span>&nbsp;&nbsp;&nbsp;
							<div class="col">
								<select class="product_opt_size" name="product_opt_size" id="product_opt_size_${st.index}">
									<c:forEach var="sizeVO" items="${product_vos}" varStatus="sst">
										<c:if test="${st.index == sst.index}">
											<c:forEach var="size" items="${fn:split(sizeVO.product_size,',')}">
												<option value="${size}">${size}</option>
											</c:forEach>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row" style="width: 100%;">
							<span><b>컬러</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="col">
								<select class="product_opt_color" name="product_opt_color" id="product_opt_color_${st.index}">
									<c:forEach var="colorVO" items="${product_vos}" varStatus="cst">
										<c:if test="${st.index == cst.index}">
											<c:forEach var="color" items="${fn:split(colorVO.product_color,',')}">
												<option value="${color}">${color}</option>
											</c:forEach>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row mt-3" style="width: 100%; margin: 0 auto; padding: 0px;">
							<div class="col text-center" style="padding: 0px;">
								<a href="javascript:opt_change(${st.index},${vo.member_cart_idx})" id="black-button-css">변경</a>
								<a href="javascript:opt_close(${st.index})" id="white-button-css">취소</a>
							</div>
						</div>
					</div>
					<div class="row" style="margin: 10px 0px;">
						<div class="col text-left"><a href="javascript:basket_product_del('${st.index}','${vo.member_cart_idx}','${vo.product_name}')" id="white-button-css">삭제</a> <a href="" id="white-button-css">관심상품</a></div>
						<div class="col text-right"><a href="javascript:basket_product_order(${vo.member_cart_idx},${st.index})" id="black-button-css">주문하기</a></div>
					</div>
					<c:if test="${st.count == fn:length(vos)}"><p><br/></p></c:if>
				</c:forEach>
			</div>
			<div class="row cart-product-sub" style="background-color: #000; color: #fff;"><div class="col text-left" style=" font-weight: 800;">결제예정금액</div><div class="col text-right tot_buy_price" id="tot_buy_price">0원</div></div>
			<div class="row cart-product-sub" style="background-color: #ececec; color: #000;"><div class="col text-left">총 상품금액</div><div class="col text-right tot_price" id="tot_price">0원</div></div>
			<div class="row cart-product-sub" style="background-color: #ececec; color: #000;"><div class="col text-left">총 배송비</div><div class="col text-right tot_delivery" id="tot_delivery">3,000원</div></div>
			<div class="row cart-product-sub" style="background-color: #ececec; color: #000;"><div class="col text-left">총 적립금</div><div class="col text-right tot_point" id="tot_point">0원</div></div>
		</div>
		<div class="row mt-3" style="width: 75%; margin: 0 auto; padding: 0px;">
			<div class="col" style="padding: 0px 5px 0px 0px;"><a href="javascript:select_product_order()" id="white-button-css" style="width: 100%; display: inline-block; text-align: center;">선택상품주문</a></div>
			<div class="col" style="padding: 0px 0px 0px 5px;"><a href="javascript:all_product_order()" id="black-button-css" style="width: 100%; display: inline-block; text-align: center;">전체상품주문</a></div>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>