<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_product_input.jsp</title>
	<script src="${ctp}/resources/ckeditor/ckeditor.js"></script>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		let mainCategory;
		
		function main_category_select(main) {
	  		mainCategory = main;
	  		
	  		if(mainCategory == '1') {
	  			$("#category_sub").html("");
	  		}
	  		else if(mainCategory == '2') {
	  			$("#category_sub").html("<option value='20' selected>KIDS & LADIES WEAR</option><option value='21'>HAT & CAP</option><option value='22'>T-SHIRTS</option><option value='23'>JACKET</option><option value='24'>COVER ALL</option><option value='25'>LONG T-SHIRTS</option><option value='26'>SHIRTS</option><option value='27'>PANTS</option><option value='28'>SHOES</option><option value='29'>ACCESOIRES</option>");
	  		}
	  		else if(mainCategory == '3') {
	  			$("#category_sub").html("<option value='30' selected>DIECAST</option><option value='31'>KEYRING</option><option value='32'>SIGN BOARD</option><option value='33'>GARAGE</option><option value='34'>LIVING</option><option value='35'>OFFICE SUPPLY</option><option value='36'>PRINT & DVD</option><option value='37'>STICKER & DECAL</option><option value='38'>IPHONE CASE</option>");
	  		}
	  		else if(mainCategory == '4') {
	  			$("#category_sub").html("<option value='40' selected>VANS</option><option value='41'>G-SHOCK</option><option value='42'>SHAKEPISTON</option><option value='43'>NEW ERA</option><option value='44'>GALLOP HELMET</option>");
	  		}
	  		else if(mainCategory == '5') {
	  			$("#category_sub").html("<option value='50' selected>AIR FRESHENERS</option><option value='51'>ANTENA BALL</option><option value='52'>BOLTS</option><option value='53'>INTERIORS</option><option value='54'>MAT</option><option value='55'>STREEING WHEELS</option><option value='56'>SUN SHADE</option><option value='57'>TRUCK GOODS</option><option value='58'>WHEELS & TIRES</option>");
	  		}
	  		else if(mainCategory == '6') {
	  			$("#category_sub").html("<option value='60' selected>ACCESSORIES</option><option value='61'>AIR FILTERS & SCOOPS</option><option value='62'>BOLTS</option><option value='63'>EXHAUST PARTS</option><option value='64'>HARLEY-DAVIDSON PARTS</option><option value='65'>MQQN TANKS</option><option value='66'>MOON DISC</option><option value='67'>TIRES & ACC</option>");
	  		}
	  		else if(mainCategory == '7') {
	  			$("#category_sub").html("<option value='70' selected>APPAREL</option><option value='71'>GOODS</option>");
	  		}
	  		else if(mainCategory == '8') {
	  			$("#category_sub").html("");
	  		}
	  	}
	</script>
	<style>
		body {
			font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움','AppleGothic','Apple SD Gothic Neo','sans-serif';
		}
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
		.form-title {
			text-align: center;
			font-weight: 800;
			font-size: 1.5rem;
		}
	</style>
</head>
<body>
	<p><br/><br/><br/></p>
	<div class="container">
		<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
		<div class="mb-4 form-title">상품 등록</div>
		<div class="row">
			<div class="col">메인 카테고리</div>
			<div class="col">
				<select id="category_main" name="category_main" onchange="main_category_select(this.value);">
					<option value="1">HELMET</option>
					<option value="2">APPAREL</option>
					<option value="3">GOODS</option>
					<option value="4">SPECIAL COLLABO</option>
					<option value="5">CUSTOM CAR PARTS</option>
					<option value="6">MOTORCYCLE PARTS</option>
					<option value="7">RATFINK FEVER</option>
					<option value="8">EVENT TICKET</option>
				</select>
			</div>
			<div class="col">서브 카테고리</div>
			<div class="col">
				<select id="category_sub" name="category_sub">
				</select>
			</div>
			<div class="col">세부 카테고리</div>
			<div class="col">
				<select id="category_mini" name="category_mini">
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col-2">상품명</div>
			<div class="col"><input type="text" id="product_name" name="product_name" /></div>
		</div>
		<div class="row">
			<div class="col-2">소비자가격</div>
			<div class="col"><input type="number" id="product_price" name="product_price" /></div>
			<div class="col-2"><font color='red'>세일가격</font></div>
			<div class="col"><input type="number" id="product_sale_price" name="product_sale_price" /></div>
		</div>
		<div class="row">
			<div class="col-2">재고수량</div>
			<div class="col"><input type="number" id="product_stock" name="product_stock" /></div>
		</div>
		<div class="row" id="product_sizeForm0">
			<div class="col-2">사이즈</div>
			<div class="col"><input type="text" name="product_size" id="product_size0"/></div>
			<div class="col-1"><a href="javascript:sizePlus()"><font color="blue"><i class="fa-solid fa-plus"></i></font></a></div>
		</div>
		<div class="row" id="product_colorForm0">
			<div class="col-2">컬러</div>
			<div class="col"><input type="text" name="product_color" id="product_color0"/></div>
			<div class="col-1"><a href="javascript:colorPlus()"><font color="blue"><i class="fa-solid fa-plus"></i></font></a></div>
		</div>
		<div class="row">
			<div class="col-2">상품 상세정보</div>
			<div class="col"><textarea name="content" id="CKEDITOR" required></textarea></div>
			<script>
	            CKEDITOR.replace("content",{
	        	    height:500,
	        	    filebrowserUploadUrl:"${ctp}/imageUpload",
	        	    uploadUrl : "${ctp}/imageUpload"
	            });
        	</script>
		</div>
		<div class="row">
			<div class="col-2">상품 대표이미지</div>
	    	<div class="col"><input type="file" name="product_images" id="product_images" onchange="readURL(this);" class="form-control-file border" style="font-size:1em;"/></div>
   		</div>
   		<div class="row mb-5"><div class="col text-center"><img width="200vw" height="250vh" id="image_preview"/></div></div>
	</div>
</body>
</html>