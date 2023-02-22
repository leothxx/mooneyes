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
	<script>
		'use strict';
		let select_cnt = 0;
		$(function(){
			$(".wishlist_opt_view").hide();
		});
		function wishlist_opt_open(index) {
			$("#wishlist_opt_view_"+index+"").show();
		}
		function opt_exit(index) {
			$("#wishlist_opt_view_"+index+"").hide();
		}
		function opt_edit(index,idx) {
			let size = $("#wishlist_opt_size_"+index+"").val();
			let color = $("#wishlist_opt_color_"+index+"").val();
			
			let query = {
					size : size,
					color: color,
					product_wishlist_idx : idx
			};
			
			$.ajax({
				type: "post",
				url : "${ctp}/product/wishlist_opt_change",
				data : query,
				success : function(res) {
					if(res == 1) {
						alert("상품의 옵션이 변경되었습니다.");
						/* $("#colorAndSizeOpt_"+index+"").load(location.href+' #colorAndSizeOpt_'+index+''); */
						location.reload();
					}
					else alert("상품 옵션 변경 중 에러가 발생하였습니다.\n다시 시도해 주세요!");
				},
				error : function() {
					alert("전송 오류!");
				}
			});
		}
		function wishlist_del(idx) {
			let ans = confirm("해당 상품을 위시리스트에서 삭제하시겠습니까?");
			if(ans == false) return false;
			$.ajax({
				type: "post",
				url: "${ctp}/product/wishlist_del",
				data: {product_wishlist_idx : idx},
				success: function(res) {
					if(res == 1) {
						alert("위시리스트에서 삭제되었습니다.");
						location.reload();
					}
					else {
						alert("삭제도중 에러가 발생하였습니다.\n다시 시도해주세요.");
					}
				},
				error : function() {
					alert("전송 오류!!");
				}
			});
		}
		function wishlist_all_select(count) {
			if(select_cnt == 0) {
				for(let i=0; i<count; i++) {
					$("#wish_chk_id_"+i+"").prop('checked',true);
				}
				select_cnt = 1;
			}
			else {
				for(let i=0; i<count; i++) {
					$("#wish_chk_id_"+i+"").prop('checked',false);
				}
				select_cnt = 0;
			}
		}
		function wishlist_select_delete(size) {
			let ans = confirm("선택된 상품을 삭제하시겠습니까?");
			if(ans == false) {
				return false;
			}
			
			let product_wishlist_idx = '';
			for(let i=0; i<size; i++) {
				if($("#wish_chk_id_"+i+"").is(":checked") == true) {
					product_wishlist_idx += $("#product_wishlist_idx_"+i+"").val() + "/";
				}
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/product/select_wishlist_del",
				data : {product_wishlist_idx : product_wishlist_idx},
				success : function(res) {
					if(res == 0) alert("상품 삭제 중 에러가 발생하였습니다.");
					else {
						alert("상품이 정상적으로 삭제되었습니다.");
						location.reload();
					}
				},
				error : function() {
					alert("전송 오류!!");
				}
			});
		}
		function cart_in(idx, index) {
			let ans = confirm("해당 상품을 장바구니에 담으시겠습니까?")
			if(ans == false) return false;
			let option = $("#wishlist_option_"+index+"").text();
			if(option == null) {
				alert("상품의 옵션을 선택해주세요!");
				$("#wishlist_opt_view_"+index+"").show();
				return false;
			}
			$.ajax({
				type: "post",
				url: "${ctp}/product/cart_in",
				data: {product_wishlist_idx : idx},
				success : function(res) {
					if(res == 1) {
						alert("해당 상품을 장바구니에 담았습니다!");
						location.reload();
					}
					else {
						alert("장바구니에 담는 도중 에러가 발생하였습니다.\n다시 시도해주세요!");
					}
				},
				error : function() {
					alert("전송 오류!!");
				}
			});
		}
		function wishlist_order(idx, index) {
			let ans = confirm("해당 상품을 주문하시겠습니까?")
			if(ans == false) return false;
			let option = $("#wishlist_option_"+index+"").text();
			if(option.trim() == "") {
				alert("상품의 옵션을 선택해주세요!");
				$("#wishlist_opt_view_"+index+"").show();
				return false;
			}
			$.ajax({
				type: "post",
				url: "${ctp}/product/cart_in",
				data: {product_wishlist_idx : idx},
				success : function(res) {
					if(res == 1) {
						alert("해당 상품을 장바구니에 담았습니다!\n장바구니에서 주문을 진행해주세요!");
						location.reload();
					}
					else {
						alert("주문 도중 에러가 발생하였습니다.\n다시 시도해주세요!");
					}
				},
				error : function() {
					alert("전송 오류!!");
				}
			});
		}
	</script>
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
		#sale-icons {
			width: 20px;
		}
		.wishlist_opt_view {
			margin: 0 auto;
			width: 98%;
			height: 15vh;
			background-color: #ececec;
			font-size: 0.9rem;
			padding: 10px;
		}
		.wishlist_opt_view div {
			padding: 0px;
			padding-left: 20px;
		}
		.wishlist_opt_size, .wishlist_opt_color {
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
		.wishlist_opt_size:focus, .wishlist_opt_color:focus {
			outline: none;
		}
		.this {
			background: #fff;
			color: #000;
		    border: 1px solid #ececec;
		    border-radius: 50%;
		    font-size: 1rem;
		    padding: 0px 5px;
		}
		.this:hover {
		    background: #fff;
		    color: #000;
		    text-decoration: none;
		}
		.active .this {
		    background: #000;
		    color: #fff;
		    border: 1px solid #000;
		    border-radius: 50%;
		    font-size: 1rem;
		    padding: 0px 5px;
		}
		.this-circle {
			background: #fff;
		    color: #aaa;
		    border: 1px solid #ececec;
		    border-radius: 50%;
		    font-size: 1rem;
		    padding: 0px 5px;
		}
		.this-circle:hover {
			background: #000;
			border: 1px solid #000;
			color: #fff;
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
								<span id="wish-product-price"><c:if test="${vo.product_sale_price == 0}"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/></c:if><c:if test="${vo.product_sale_price != 0}"><img src="${ctp}/images/sale-icon.png" id="sale-icons"/>&nbsp;<font color='red'><fmt:formatNumber value="${vo.product_sale_price}" pattern="#,###"/></font></c:if></span>원
							</div>
						</div>
						<div class="row" style="padding-top: 5px;" id="colorAndSizeOpt_${st.index}">
							<div class="col-6 text-left" style="padding: 10px 10px 10px 20px; font-weight: 800;"><c:if test="${vo.product_size != '' && vo.product_color != ''}">[옵션:<span id="wishlist_option_${st.index}">${vo.product_color}/${vo.product_size}</span>]</c:if></div>
							<div class="col-6 text-right" style="padding: 10px 10px 10px 20px;"><a href="javascript:wishlist_opt_open(${st.index})" id="white-button-css"  style="background-color: #ececec;">옵션변경</a></div>
						</div>
						<div class="row wishlist_opt_view" id="wishlist_opt_view_${st.index}">
							<div class="row" style="width: 100%;">
								<span><b>사이즈</b></span>&nbsp;&nbsp;&nbsp;
								<div class="col">
									<select class="wishlist_opt_size" name="wishlist_opt_size" id="wishlist_opt_size_${st.index}">
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
									<select class="wishlist_opt_color" name="wishlist_opt_color" id="wishlist_opt_color_${st.index}">
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
									<a href="javascript:opt_edit(${st.index},${vo.product_wishlist_idx})" id="black-button-css">변경</a>
									<a href="javascript:opt_exit(${st.index})" id="white-button-css">취소</a>
								</div>
							</div>
						</div>
						<div class="row" style="padding-bottom: 5px;">
							<div class="col-6 text-left" style="padding: 10px 10px 10px 20px;"><a href="javascript:wishlist_del(${vo.product_wishlist_idx})" id="white-button-css"><b>삭제</b></a>&nbsp;<a href="javascript:cart_in(${vo.product_wishlist_idx},${st.index})" id="white-button-css">장바구니담기</a></div>
							<div class="col-6 text-right" style="padding: 10px 10px 10px 20px;"><a href="javascript:wishlist_order(${vo.product_wishlist_idx},${st.index})" id="black-button-css">주문하기</a></div>
						</div>
						<input type="hidden" name="product_wishlist_idx" id="product_wishlist_idx_${st.index}" value="${vo.product_wishlist_idx}" />
					</c:forEach>
					<div class="row" style="border-top: 1px solid #ececec; height:5vh; padding: 20px 0px 5px 5px;">
						<c:set var="size" value="${fn:length(vos)}"/>
						<div class="col"><a href="javascript:wishlist_all_select(${size})" id="white-button-css">전체선택</a>&nbsp;<a href="javascript:wishlist_select_delete(${size})" id="white-button-css">선택삭제</a></div>
					</div>
				</div>
			</c:if>
		</div>
		<!-- 블록 페이지 시작 -->
		<div class="text-center" style="width: 75%; margin: 0 0 0 300px;">
			<ul class="pagination justify-content-center">
	     		<li class="page-item ml-1 mr-1">
		     		<a class="this-circle" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=1" class="first"><i class="fas fa-angle-double-left"></i></a>
	     		</li>
	     		<li class="page-item ml-1 mr-1">
	     			<c:if test="${(pageVo.curBlock-1)*pageVo.blockSize + 1 < 1 == false}"><a class="this-circle" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}"><i class="fas fa-angle-left"></i></a></c:if>
	     			<c:if test="${(pageVo.curBlock-1)*pageVo.blockSize + 1 < 1}"><a class="this-circle" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=${pageVo.pag}"><i class="fas fa-angle-left"></i></a></c:if>
	     		</li>
		   		<c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
		     		<c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
		   				<li class="page-item active ml-1 mr-1">
		   					<a class="this" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=${i}">${i}</a>
	   					</li>
		   			</c:if>
		     		<c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
		   				<li class="page-item ml-1 mr-1">
		   					<a class="this" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=${i}">${i}</a>
	   					</li>
		   			</c:if>
		   		</c:forEach>
	     		<li class="page-item ml-1 mr-1">
		     		<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><a class="this-circle" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}" class="first"><i class="fas fa-angle-right"></i></a></c:if>
		     		<c:if test="${pageVo.curBlock == pageVo.lastBlock}"><a class="this-circle" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=${pageVo.pag}" class="first"><i class="fas fa-angle-right"></i></a></c:if>
	    			</li>
				<li class="page-item ml-1 mr-1">
		     		<a class="this-circle" href="${ctp}/product/wish_list?pageSize=${pageVo.pageSize}&pag=${pageVo.totPage}" class="first"><i class="fas fa-angle-double-right"></i></a>
				</li>
			</ul>
		</div>
	<!-- 블록 페이지 끝 -->
	</div>	
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>