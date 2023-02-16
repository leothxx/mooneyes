<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_product_view.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		let count = 0;
	  	let tot_size = "";
	  	let tot_color = "";
	  	let buy_su = "";
	  	let select_product = [];
	  	
		$(function(){
			$(".tab2").hide();
			$(".tab02").hide();
			$(".tab03").hide();
			$(".tab04").hide();
		});
		
		function tab1_click() {
			$(".tab2").removeClass("animate__animated animate__fadeIn");		
			$(".tab2").hide();
			
			$(".tab1").show();
			$(".tab1").addClass("animate__animated animate__fadeIn");		
		}
		
		function tab2_click() {
			$(".tab1").removeClass("animate__animated animate__fadeIn");
			$(".tab1").hide();
			
			$(".tab2").show();
			$(".tab2").addClass("animate__animated animate__fadeIn");		
		}
		
		function tab01_click() {
			$(".tab02").removeClass("animate__animated animate__fadeIn");
			$(".tab02").hide();
			$(".tab03").removeClass("animate__animated animate__fadeIn");
			$(".tab03").hide();
			$(".tab04").removeClass("animate__animated animate__fadeIn");
			$(".tab04").hide();
			
			$(".tab01").show();
			$(".tab01").addClass("animate__animated animate__fadeIn");		
		}
		
		function tab02_click() {
			$(".tab01").removeClass("animate__animated animate__fadeIn");
			$(".tab01").hide();
			$(".tab03").removeClass("animate__animated animate__fadeIn");
			$(".tab03").hide();
			$(".tab04").removeClass("animate__animated animate__fadeIn");
			$(".tab04").hide();
			
			$(".tab02").show();
			$(".tab02").addClass("animate__animated animate__fadeIn");		
		}
		
		function tab03_click() {
			$(".tab01").removeClass("animate__animated animate__fadeIn");
			$(".tab01").hide();
			$(".tab02").removeClass("animate__animated animate__fadeIn");
			$(".tab02").hide();
			$(".tab04").removeClass("animate__animated animate__fadeIn");
			$(".tab04").hide();
			
			$(".tab03").show();
			$(".tab03").addClass("animate__animated animate__fadeIn");		
		}
		
		function tab04_click() {
			$(".tab01").removeClass("animate__animated animate__fadeIn");
			$(".tab01").hide();
			$(".tab02").removeClass("animate__animated animate__fadeIn");
			$(".tab02").hide();
			$(".tab03").removeClass("animate__animated animate__fadeIn");
			$(".tab03").hide();
			
			$(".tab04").show();
			$(".tab04").addClass("animate__animated animate__fadeIn");		
		}
		//제품의 컬러 선택시
	  	function colorSelect(color) {
	  		let size = $("#size").val();
	  		
	  		if(color != '--선택--' && size =='--선택--') {
	  			$("#size option").show();
	  		}
	  		
	  		else if(color =='--선택--') {
	  			$("#size").val('--선택--');
		  		$("#size option").hide();
	  		}
	  		
	  		if(color != '--선택--' && size != '--선택--') {
	  			select_product[count] = color+"-"+size;
	  			for(let i=0; i<select_product.length; i++) {
	  				for(let j=i+1; j<select_product.length; j++) {
		  				if(count != 0 && select_product[i] == select_product[j]) {
		  					$("#color").val('--선택--');
		  		  			$("#size").val('--선택--');
		  					alert("이미 동일한 컬러와 동일한 사이즈를 선택하셨습니다.\n다량 구매를 원할 시 수량을 증가해 주세요.");
		  					return false;
		  				}
	  				}
	  			}
	  			
	  			tot_color += color + "/";
	  			tot_size += size + "/";
	  			let product_totPrice = new Intl.NumberFormat('ko-kr').format("${vo.product_price}");
	  			let product_totPoint = new Intl.NumberFormat('ko-kr').format("${product_point}");
	  			
	  			let demo = '<div class="row product-order-box mb-1 animate__animated animate__fadeIn" style="text-align:center">';
	  			demo += '<div class="col-4">';
	  			demo += '<span style="font-weight: 700;">${vo.product_name}</span><br/> - '+color+' - '+size+'';
	  			demo += '</div>';
	  			demo += '<div class="col-2" style="text-align:left">';
	  			demo += '<input type="number" class="product-order-su" name="product_su" id="product_su'+count+'" min="1" value="1" required style="width:3vw;" onchange="product_suSelect(this.value,'+count+')"/>&nbsp;';
	  			demo += '<a href="javascript:product_del('+count+');"><img src="${ctp}/images/btn_price_delete.gif" /></a>';
	  			demo += '</div>';
	  			demo += '<div class="col-2"></div>';
	  			demo += '<div class="col-4" style="text-align:right">';
	  			demo += '<div class="col suprice p-0" id="suprice'+count+'" style="text-align:right">&#8361; <span id="totp'+count+'" style="font-weight: 700;">'+product_totPrice+'원</span><br/><span style="font-weight: 700;">(<img src="${ctp}/images/ico_product_point.gif" />&nbsp;<span id="totpoint'+count+'">'+product_totPoint+'</span>원)<span></div>';
	  			demo += '</div>';
	  			demo += '</div>';
	  			demo += "</div>";
	  			
	  			$("#demo").append(demo);
	  			
	  			count ++;
	  			$("#color").val('--선택--');
	  			$("#size").val('--선택--');
	  		}
	  		
	  	}
	  	
	  	let product_allPrice = 0*1;
	  	
	  	// 제품의 사이즈 선택시
	  	function sizeSelect(size) {
	  		let color = $("#color").val();
	  		
	  		if(color != '--선택--' && size != '--선택--') {
				select_product[count] = color+"-"+size;
	  			for(let i=0; i<select_product.length; i++) {
	  				for(let j=i+1; j<select_product.length; j++) {
		  				if(count != 0 && select_product[i] == select_product[j]) {
		  					$("#color").val('--선택--');
		  		  			$("#size").val('--선택--');
		  					alert("이미 동일한 컬러와 동일한 사이즈를 선택하셨습니다.\n다량 구매를 원할 시 수량을 증가해 주세요.");
		  					return false;
		  				}
	  				}
	  			}
	  			
	  			tot_color += color + "/";
	  			tot_size += size + "/";
	  			let product_totPrice = new Intl.NumberFormat('ko-kr').format("${vo.product_price}");
	  			let product_totPoint = new Intl.NumberFormat('ko-kr').format("${product_point}");
	  			
	  			let demo = '<div class="row product-order-box mb-1 animate__animated animate__fadeIn" style="text-align:center">';
	  			demo += '<div class="col-4">';
	  			demo += '<span style="font-weight: 700;">${vo.product_name}</span><br/> - '+color+' - '+size+'';
	  			demo += '</div>';
	  			demo += '<div class="col-2" style="text-align:left">';
	  			demo += '<input type="number" class="product-order-su" name="product_su" id="product_su'+count+'" min="1" value="1" required style="width:3vw;" onchange="product_suSelect(this.value,'+count+')"/>&nbsp;';
	  			demo += '<a href="javascript:product_del('+count+');"><img src="${ctp}/images/btn_price_delete.gif" /></a>';
	  			demo += '</div>';
	  			demo += '<div class="col-2"></div>';
	  			demo += '<div class="col-4" style="text-align:right">';
	  			demo += '<div class="col suprice p-0" id="suprice'+count+'" style="text-align:right">&#8361; <span id="totp'+count+'" style="font-weight: 700;">'+product_totPrice+'원</span><br/><span style="font-weight: 700;">(<img src="${ctp}/images/ico_product_point.gif" />&nbsp;<span id="totpoint'+count+'">'+product_totPoint+'</span>원)<span></div>';
	  			demo += '</div>';
	  			demo += '</div>';
	  			demo += "</div>";
	  			
	  			$("#demo").append(demo);
	  			
	  			count ++;
	  			$("#color").val('--선택--');
	  			$("#size").val('--선택--');
		  		product_allPrice = 0*1;
				product_output();
	  		}
	  		
	  	}
	  	
	 	// 총 가격 더하기
	  	function product_output() {
	  		
	  		let product_all_count = 0;
	  		
	  		for(let i=0; i<count; i++){
		  		let innerText = document.getElementById('totp'+i).innerText;
	  			innerText = innerText.replaceAll(",","");
	  			product_allPrice += parseInt(innerText) * 1;
		  		
		  		product_all_count += parseInt(document.getElementById('product_su'+i).value);
	  			
	  		}
	  		
	  		product_allPrice = new Intl.NumberFormat('ko-kr').format(product_allPrice);
			$(".total-price").html("<b>Total :</b> <span class='total-real-price'>"+product_allPrice+"원</span> ("+product_all_count+"개)");
	  	}
	 	
	 	// 담은 제품의 삭제버튼 클릭시
	  	function product_del(ctt) {
	  		/* let innerText = document.getElementById('totp'+ctt).innerText;
	  			$("#p"+ctt).remove();
				innerText = innerText.replaceAll(",","");
				product_allPrice = product_allPrice.replaceAll(",","");
				product_allPrice = product_allPrice - innerText;
	  			product_allPrice = new Intl.NumberFormat('ko-kr').format(product_allPrice);
				$("#demo2").html("<div class='text-right'>총 구매가격 : &#8361; "+product_allPrice+"원</div>"); */
			location.reload();
	  	}
	 	
	 	// 장바구니 버튼 클릭
	  	function productCart() {
	  		if(product_allPrice <= 0) {
	  			alert("장바구니에 담으실 상품을 선택해 주세요!");
	  			return false;
	  		}
	  		for(let i=0; i<count; i++) {
		  		buy_su += $("#product_su"+i).val() + "/";
	  		}
	  		let buy_size = tot_size.substring(0, tot_size.length-1);
	  		let buy_color = tot_color.substring(0, tot_color.length-1);
	  		let buy_count = buy_su.substring(0, buy_su.length-1);
	  		alert("해당 상품을 장바구니에 담으셨습니다.");
	  		location.href="${ctp}/member/cart_input?product_point=${product_point}&product_vat=${product_vat}&buy_totPrice="+encodeURI(product_allPrice)+"&buy_size="+encodeURI(buy_size)+"&buy_color="+encodeURI(buy_color)+"&buy_su="+encodeURI(buy_count)+"&product_idx=${vo.product_idx}";
	  	}
	</script>
	<style>
		.product-name div {
			font-weight: 500;
			text-align: center;
		}
		.product-price div {
			font-weight: 800;
			text-align: center;
			font-size: 1.5rem;
		}
		.in-vat {
			font-size: 0.7rem;
			color: #888;
		}
		.product-main-view {
			
		}
		.product-view-main-image {
			width: 100%;
		}
		.tap-container {
			font-size: 0.9rem;
		}
		.nav-item a {
			font-size: 1rem;
			font-weight: 500;
		}
		.nav-item a:hover {
			text-decoration: none;
			cursor: pointer;
			border-bottom: 1px solid #000;
		}
		.nav-tabs .nav-link.active {
			font-weight: 800;
		}
		.nav-tabs {
		    border-bottom: 1px solid #000;
		}
		.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
		    border-color: #000 #000 #fff;
		}
		.nav-tabs .nav-link {
		    border: 1px solid transparent;
		    border-top-left-radius: 0.25rem;
		    border-top-right-radius: 0.25rem;
		}
		.tab1 {
			padding: 10px;
		}
		.tab2 {
			padding: 10px 30px;			
		}
		.color-tab, .size-tab {
			font-size: 1.2rem;
			font-weight: 800;
		}
		.color-tab select, .size-tab select {
			font-size: 0.9rem;
			font-weight: 500;
			width: 100%;
			border: 1px solid #ececec;
			padding-left: 5px;
		}
		.product-order-box {
			text-align: center;
			border: 1px solid #ececec;
			font-size: 1rem;
			padding: 10px;
			display: table-cell;
			vertical-align: middle;
			margin-left: 20px;
		}
		.product-order-box div {
			padding: 10px;
			display: table-cell;
			vertical-align: middle;
		}
		.black-btn {
			width: 100%;
			background-color: #000;
			border: 1px solid #000;
			color: #fff;
			font-weight: 800;
			font-size: 1.2rem;
			height: 7vh;
		}
		.white-btn {
			width: 100%;
			background-color: #fff;
			border: 1px solid #ececec;
			color: #000;
			font-weight: 800;
			font-size: 1.2rem;
			height: 7vh;
		}
		.black-btn:hover, .white-btn:hover {
			transition: color 0.5s ease-in-out;
			color: #aaa;
		}
		.btn-set div {
			padding: 0px 1px;
		}
		.total-price {
			font-size: 1.2rem;
			text-align: right;
		}
		.total-real-price {
			font-size: 1.8rem;
			font-weight: 800;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<br/>
	<div style="width: 100%; margin: 0 auto;">
		<div style="width: 75%; margin: 0 auto">
			<div class="product-name row mt-5"><div class="col">${vo.product_name}</div></div>
			<div class="product-price row mt-2"><div class="col"><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/>원&nbsp;<span class="in-vat">(IN VAT)</span></div></div>
			<hr/>
			<div class="row product-main-view p-5">
			<!-- 메인에 상품 이미지 출력 -->
			<div class="col product-main-image">
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<c:set var="product_image_file" value="${fn:split(vo.product_fSName,'/')}" />
						<c:set var="length" value="${fn:length(product_image_file)}" />
					<c:forEach var="product_fSName" items="${product_image_file}" varStatus="st">
						<c:if test="${st.index == 0}">
							<c:forEach var="i" begin="1" end="${length}" varStatus="oll">
								    <c:if test="${oll.index == 0}"><li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li></c:if>
								    <c:if test="${oll.index != 0}"><li data-target="#carouselExampleIndicators" data-slide-to="${oll.index}"></li></c:if>
								<c:if test="${oll.count == length}"></ol></c:if>
							</c:forEach>
						</c:if>
						<c:if test="${st.index == 0}"><div class="carousel-inner"></c:if>
	   					<c:if test="${st.index == 0}">
	   						<div class="carousel-item active">
	     						<img class="product-view-main-image" src="${ctp}/data/product/${product_fSName}">
	   						</div>
	   					</c:if>
	   					<c:if test="${st.index != 0}">
	   						<div class="carousel-item">
	     						<img class="product-view-main-image" src="${ctp}/data/product/${product_fSName}">
	   						</div>
	   					</c:if>
					<c:if test="${st.count == length}"></div></c:if>
					</c:forEach>
					<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	  					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	  					<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-1"></div>
			<!-- 메인에 상품 정보 출력 -->
			<div class="col product-main-info">
				<div class="row">
	       			<div class="col">
	        			<ul class="nav nav-tabs flex-column flex-md-row" role="tablist">
	               			<li class="nav-item">
	                   			<a class="nav-link active" data-toggle="tab" onclick="tab1_click();">상세정보</a>
	               			</li>
			                <li class="nav-item">
			                    <a class="nav-link" data-toggle="tab" onclick="tab2_click();">교환 & 반품안내</a>
			                </li>
	           			</ul>
		       			<div class="tap-container">
		       				<div class="tab1">
		       					<div class="row mb-1"><div class="col-2">·POINT</div><div class="col"><fmt:formatNumber value="${product_point}" pattern="#,###"/>원&nbsp;(1%)</div></div>
		       					<div class="row mb-1"><div class="col-2">·VAT</div><div class="col"><fmt:formatNumber value="${product_vat}" pattern="#,###"/>원</div></div>
		       					<div class="row mb-1"><div class="col-2">·BRAND</div><div class="col">문아이즈 MOONEYES</div></div>
		       					<div class="row mb-1"><div class="col-2">·구매후기</div><div class="col">0</div></div>
		       					<div class="row mb-1"><div class="col-2">·배송방법</div><div class="col">택배</div></div>
		       					<div class="row mb-1"><div class="col-2">·배송비</div><div class="col">3,000원 (50,000원 이상 구매 시 무료)</div></div>
		       				</div>
		       				<div class="tab2">
			       				<div class="row"><b>교환 및 반품이 가능한 경우</b></div>
			       				<div class="row">- 상품을 공급 받으신 날로부터 7일 이내 가능합니다.<br/>단, 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.</div><br/>
			       				<div class="row"><b>교환 및 반품이 불가능한 경우</b></div>
			       				<div class="row">- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우.<br/>- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우.<br/>- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우.<br/>- 시간의 경과에 의하여 재 판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우.</div><br/>
			       				<div class="row">※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품 반송 비용은 고객님께서 부담하셔야 합니다.<br/>(색상 교환, 사이즈 교환 등 포함)</div>
		       				</div>
		       			</div>
		       			<br/>
		       			<div class="color-tab row">
		       				<div class="col-2" style="margin: 10px;"><b>COLOR</b></div>
					    	<div class="col" style="margin: 10px;">
					    		<select name="color" id="color" onchange="colorSelect(this.value);">
					    			<option value="--선택--">- [필수] 옵션을 선택해 주세요 -</option>
					    			<c:forEach var="product_color" items="${fn:split(vo.product_color,',')}">
					    				<option value="${product_color}">${product_color}</option>
					    			</c:forEach>
					    		</select> 
				    		</div>
		       			</div>
		       			<div class="size-tab row">
		       				<div class="col-2" style="margin: 10px;"><b>SIZE</b></div>
					    	<div class="col" style="margin: 10px;">
					    		<select name="size" id="size" onchange="sizeSelect(this.value);">
					    			<option value="--선택--">- [필수] 옵션을 선택해 주세요 -</option>
					    			<c:forEach var="product_size" items="${fn:split(vo.product_size,',')}">
					    				<option value="${product_size}">${product_size}</option>
					    			</c:forEach>
					    		</select> 
				    		</div>
		       			</div>
		       			<div id="demo" class="row pl-3 pr-3 mt-5"></div><br/>
		       			<div class="row p-3"><div class="col total-price"><b>Total :</b> <span class="total-real-price">0원</span> (0개)</div></div>
	       			</div>
	   			</div>
	   			<div class="row p-3 btn-set">
	   				<div class="col"><input type="button" value="BUY NOW" onclick="buy_click();" class="black-btn" /></div>
	   				<div class="col"><input type="button" value="CART" onclick="productCart();" class="white-btn" /></div>
	   				<div class="col"><input type="button" value="WISH" onclick="buy_click();" class="white-btn" /></div>
	   			</div>
			</div>
		</div>
		<div style="width: 90%; margin: 0 auto;">
			<div class="row" style="width: 100%; margin: 0 auto;">
				<div class="col" style="margin: 0 auto;">
	       			<!-- <ul class="nav nav-tabs flex-column flex-md-row" role="tablist" style="text-align: center;"> -->
	       			<ul class="nav nav-tabs" role="tablist" style="margin: 0 auto;">
	             		<li class="nav-item" style="display: inline-block;">
	                 		<a class="nav-link active" data-toggle="tab" onclick="tab01_click();">상품 상세정보</a>
	             		</li>
	             		<li class="nav-item" style="display: inline-block;">
		                    <a class="nav-link" data-toggle="tab" onclick="tab02_click();">구매 안내</a>
		                </li>
	             		<li class="nav-item" style="display: inline-block;">
	                 		<a class="nav-link" data-toggle="tab" onclick="tab03_click();">상품 후기</a>
	             		</li>
	             		<li class="nav-item" style="display: inline-block;">
		                    <a class="nav-link" data-toggle="tab" onclick="tab04_click();">상품 문의</a>
		                </li>
	        		</ul>
        		</div>
       		</div>
       		<br/>
       		<div class="tap-info-container">
       			<div class="tab01" style="text-align: center;">
       				${vo.product_desc}
       			</div>
       			<div class="tab02" style="text-align: center;">
       				<div><b>상품 결제 정보</b><br/><br/><b>국민은행 712401-01-603058</b> / 예금주 : <b>문아이즈 (서하늘)</b></div>
       				<br/>
       				<div>주문시 입력한 입금자명과 실제 입금자의 성명이 반드시 일치하여야 합니다.<br/>2일 이내로 입금되지 않은 주문은 취소 처리 될 수 있습니다.</div>
       			</div>
       			<div class="tab03" style="text-align: center;">
       			
       			</div>
       			<div class="tab04" style="text-align: center;">
       			
       			</div>
      		</div>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
<script>
	'use strict';
	
	// 제품의 수량을 바꿀시
  	function product_suSelect(cnt,ctt) {
  		let price;
 		let sale_price = "${vo.product_sale_price}";
 		let product_point = "${product_point}";
 		if(sale_price == 0) {
	  		price = "${vo.product_price}";
 		}
 		else {
 			price = sale_price;
 		}
  		let product_totPrice = price * cnt;
  		let product_totPoint = product_point * cnt;
  		
  		product_totPrice = new Intl.NumberFormat('ko-kr').format(product_totPrice);
  		product_totPoint = new Intl.NumberFormat('ko-kr').format(product_totPoint);
  		$("#suprice"+ctt).html("&#8361; <span id='totp"+ctt+"' style='font-weight: 700;'>"+product_totPrice+"원</span><br/><span style='font-weight: 700;'>(<img src='${ctp}/images/ico_product_point.gif' />&nbsp;<span id='totpoint"+ctt+"'>"+product_totPoint+"</span>원)</span>");
  		product_allPrice = 0*1;
  		product_output();
  	}
</script>
</html>