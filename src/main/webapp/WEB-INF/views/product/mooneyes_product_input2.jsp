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
		let subCategory;
		let miniCategory;
		let sizeCnt = 0;
	  	let colorCnt = 0;
		
	  	$(function(){
	  		$("#image_preview").hide();
	  		$("#category_main").value = '1';
	  		main_category_select('1');
	  	});
	  	
		// 메인 카테고리 선택시
		function main_category_select(main) {
	  		mainCategory = main;
	  		
	  		let query = {
	  				mainCategory : mainCategory
	  		}
	  		$("#category_sub").html("");
	  		$.ajax({
	  			type : "post",
	  			url : "${ctp}/admin/product_sub_category",
	  			data : query,
	  			async : false,
	  			success : function(sub_category) {
	  				let category_sub;
	  				for(let data of sub_category){
	  					category_sub += "<option value='"+data.category_sub+"'>"+data.category_sub_name+"</option>";
	  				}
	  				$("#category_sub").html(category_sub);
	  				sub_category_select(main+"0");
	  			},
	  			error : function() {
	  				alert("전송 오류!");
	  			}
	  		});
	  	}
		
		// 서브 카테고리 선택시
		function sub_category_select(sub) {
	  		subCategory = sub;
	  		
	  		let query = {
	  				subCategory : subCategory
	  		}
	  		$("#category_mini").html("");
	  		$.ajax({
	  			type : "post",
	  			url : "${ctp}/admin/product_mini_category",
	  			data : query,
	  			async : false,
	  			success : function(mini_category) {
	  				let category_mini;
	  				for(let data of mini_category){
	  					category_mini += "<option value='"+data.category_mini+"'>"+data.category_mini_name+"</option>";
	  				}
	  				$("#category_mini").html(category_mini);
	  			},
	  			error : function() {
	  				alert("전송 오류!");
	  			}
	  		});
	  	}
		
		function sizePlus() {
	  		sizeCnt++;
	  		let sizePlus = "<div class='row list mb-2' id='product_sizeForm"+sizeCnt+"'><div class='col-2'>사이즈"+sizeCnt+"</div><div class='col-9'><input type='text' name='product_size' id='product_size"+sizeCnt+"'/></div><div class='col'><a href='javascript:sizePlus()'><font color='blue'><i class='fa-solid fa-plus'></i></font></a>&nbsp;&nbsp;<a href='javascript:sizeMinus("+sizeCnt+")'><font color='red'><i class='fa-solid fa-minus'></i></font></a></div>";
	  		$("#sizeDemo").append(sizePlus);
	  	}
	  	function sizeMinus(sizeCnt) {
	  		$("#product_sizeForm"+sizeCnt).remove();
	  	}
	  	function colorPlus() {
	  		colorCnt++;
	  		let sizePlus = "<div class='row list mb-2' id='product_colorForm"+colorCnt+"'><div class='col-2'>컬러"+colorCnt+"</div><div class='col-9'><input type='text' name='product_color' id='product_color"+colorCnt+"' /></div><div class='col'><a href='javascript:colorPlus()'><font color='blue'><i class='fa-solid fa-plus'></i></font></a>&nbsp;&nbsp;<a href='javascript:colorMinus("+colorCnt+")'><font color='red'><i class='fa-solid fa-minus'></i></font></a></div>";
	  		$("#colorDemo").append(sizePlus);
	  	}
	  	function colorMinus(colorCnt) {
	  		$("#product_colorForm"+colorCnt).remove();
	  	}
	  	
	 	// 상품 등록 버튼
	  	function productInput() {
	  		let category_main = $("#category_main").val(); /* 메인 카테고리 */
	  		let category_sub = $("#category_sub").val(); /* 서브 카테고리 */
	  		let category_mini = $("#category_mini").val(); /* 세부 카테고리 */
	  		
	  		let product_name = $("#product_name").val(); /* 상품명 */
	  		let product_price = $("#product_price").val(); /* 소비자 가격 */
	  		let product_sale_price = $("#product_sale_price").val(); /* 세일 가격 */
	  		
	  		let product_stock = $("#product_stock").val(); /* 상품 재고 */
	  		
	  		let product_size = $("text[name=product_size]").val(); /* 상품 사이즈(배열) */
	  		let product_color = $("text[name=product_color]").val(); /* 상품 컬러(배열) */
	  		
	  		let product_desc = $("#product_desc").val(); /* 상품 상세정보 */
	  		
	  		let product_images = $("#product_images").val(); /* 파일명 */
	  		let maxSize = 1024 * 1024 * 20; /* 파일 최대 사이즈 20MB */
	  		let fileSize = 0; /* 파일 사이즈 처리 */
	  		
	  		if(category_main.trim() == "") {
	  			alert("업로드할 메인 카테고리를 선택해주세요.");
	  			return false;
	  		}
	  		else if(product_name.trim() == "") {
	  			alert("업로드할 상품명을 입력해주세요.");
	  			return false;
	  		}
	  		else if(product_price.trim() == "") {
	  			alert("업로드할 제품의 소비자 가격을 입력해주세요.");
	  			return false;
	  		}
	  		else if(product_stock.trim() == "") {
	  			alert("업로드할 제품의 재고 수량을 입력해주세요.");
	  			return false;
	  		}
	  		else if(product_size == "") {
	  			alert("업로드할 제품의 사이즈를 입력해주세요.");
	  			return false;
	  		}
	  		else if(product_color == "") {
	  			alert("업로드할 제품의 컬러를 입력해주세요.");
	  			return false;
	  		}
	  		else if(product_desc == "") {
	  			alert("업로드할 제품의 상세정보를 입력해주세요.");
	  			return false;
	  		}
	  		
	  		// 파일 사이즈 처리
	  		for(let i=1; i<2; i++) {
	  			let imsiName = 'product_images';
	  			let fName = document.getElementById(imsiName).value;
	  			if(fName != "") {
	  				fileSize += document.getElementById(imsiName).files[0].size;
	  				let ext = fName.substring(fName.lastIndexOf(".")+1); //확장명 가져오기
	  				let uExt = ext.toUpperCase();
	  				if(uExt != "JPG" && uExt != "PNG" && uExt != "GIF" && uExt != "JPEG" && uExt != "BMP" && uExt != "PSD" && uExt != "PDD" && uExt != "HEIC" && uExt != "WEBP") { //업로드 가능한 확장자
	  					alert("업로드 가능한 파일은 'JPG/PNG/GIF/JPEG/BMP/PSD/PDD/HEIC/WEBP'입니다.");
	  					return false;
	  				}
	  			}
		  		else {
		  			alert("상품 이미지 파일을 선택해 주세요.");
		  			return false;
		  		}
	  		}
	  		if(fileSize > maxSize) {
	  			alert("이미지 파일의 최대 용량은 20MByte 이내 입니다.");
	  			return false;
	  		}
	  		else {
	  			product_input_form.fileSize.value = fileSize;
	  			alert("서브밋으로 보냅ㄴ디아.ㅇ");
	  			$("form").submit();
	  		}
	  	}
	  	
	  	// 이미지 삽입시 미리보기 띄우기
	  	function readURL(input) {
	  		if(input.files && input.files[0]) {
	  			var reader = new FileReader();
	  			reader.onload = function(e) {
	  				$("#image_preview").show();
	  				document.getElementById("image_preview").src = e.target.result;
	  			}
	  			reader.readAsDataURL(input.files[0]);
	  		}
	  		else {
	  			$("#image_preview").hide();
	  			document.getElementById("image_preview").src = "";
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
		.list {
			border: 1px solid #ececec;
			margin: 10px 0px 10px;
			padding: 10px;
		}
		input[type="text"], input[type="number"], select {
			border: 1px solid #ececec;
			width: 100%;
			padding-left: 5px;
		}
		.black_btn {
			background-color: #000;
			color: #fff;
			text-align: center;
			font-weight: 300;
			font-size: 0.9rem;
			width: 100%;
			height: 4vh;
		}
		.white_btn {
			background-color: #fff;
			border: 1px solid #ececec;
			color: #000;
			text-align: center;
			font-weight: 300;
			font-size: 0.9rem;
			width: 100%;
			height: 4vh;
		}
		.black_btn:hover, .white_btn:hover {
			text-decoration: none;
			color: #aaa;
		}
	</style>
</head>
<body>
	<p><br/><br/><br/></p>
	<div class="container">
		<form name="product_input_form" method="post" action="${ctp}/admin/product_input" enctype="multipart/form-data">
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<div class="mb-4 form-title">상품 등록</div>
			<div class="row list">
				<div class="col-2">메인 카테고리</div>
				<div class="col">
					<select id="category_main" name="category_main" onchange="main_category_select(this.value);">
						<c:forEach var="vo" items="${main_vos}" varStatus="st">
							<option value="${vo.category_main}">${vo.category_main_name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-2 text-center">서브 카테고리</div>
				<div class="col">
					<select id="category_sub" name="category_sub" onchange="sub_category_select(this.value);">
					</select>
				</div>
				<div class="col-2 text-center">세부 카테고리</div>
				<div class="col">
					<select id="category_mini" name="category_mini">
					</select>
				</div>
			</div>
			<div class="row list">
				<div class="col-2">상품명</div>
				<div class="col"><input type="text" id="product_name" name="product_name" /></div>
			</div>
			<div class="row list">
				<div class="col-2">소비자가격</div>
				<div class="col"><input type="number" id="product_price" name="product_price" /></div>
				<div class="col-1 text-center"><font color='red'>세일가격</font></div>
				<div class="col"><input type="number" id="product_sale_price" name="product_sale_price" /></div>
			</div>
			<div class="row list">
				<div class="col-2">재고수량</div>
				<div class="col"><input type="number" id="product_stock" name="product_stock" /></div>
			</div>
			<div class="row list" id="product_sizeForm0">
				<div class="col-2">사이즈</div>
				<div class="col"><input type="text" name="product_size" id="product_size0"/></div>
				<div class="col-1"><a href="javascript:sizePlus()"><font color="blue"><i class="fa-solid fa-plus"></i></font></a></div>
			</div>
			<div id="sizeDemo" style="margin: 0px; padding: 0px;"></div>
			<div class="row list" id="product_colorForm0">
				<div class="col-2">컬러</div>
				<div class="col"><input type="text" name="product_color" id="product_color0"/></div>
				<div class="col-1"><a href="javascript:colorPlus()"><font color="blue"><i class="fa-solid fa-plus"></i></font></a></div>
			</div>
			<div id="colorDemo"></div>
			<div class="row list">
				<div class="col-2">상품 상세정보</div>
				<div class="col"><textarea name="content" id="CKEDITOR" required></textarea></div>
				<script>
		            CKEDITOR.replace("content",{
		        	    height:300,
		        	    filebrowserUploadUrl:"${ctp}/imageUpload",
		        	    uploadUrl : "${ctp}/imageUpload"
		            });
	        	</script>
			</div>
			<div class="row list">
				<div class="col-2">상품 대표이미지</div>
		    	<div class="col"><input type="file" name="product_images" id="product_images" onchange="readURL(this);" class="form-control-file border" style="font-size:1em;"/></div>
	   		</div>
	   		<div class="row mb-5"><div class="col text-center"><img width="200vw" height="250vh" id="image_preview"/></div></div>
	   		<div class="row mb-5">
	   			<div class="col"><input type="button" value="상품등록" onclick="productInput();" class="black_btn" /></div>
	   			<div class="col"><input type="reset" value="다시입력" class="white_btn" /></div>
	   			<div class="col"><input type="button" value="취소" onclick="${ctp}/admin/main" class="black_btn" /></div>
	   		</div>
	   		<p><br/><br/><br/><br/><br/><br/></p>
	   		<input type="hidden" id="fileSize" name="fileSize" value="" />
   		</form>
	</div>
</body>
</html>