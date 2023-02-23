<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_member_address_edit.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/postcode.js"></script>
	<script>
		'use strict';
		// 배송지 수정버튼
		function address_edit() {
			let member_address_as = $("#member_address_as").val();
			let member_address_name = $("#member_address_name").val();
			let member_address_postcode = $("#sample6_postcode").val();
			let member_address_roadAddress = $("#sample6_address").val();
			let member_address_sw = 'N';
			
			if($("input:checkbox[id=normal_address_check]").is(":checked") == true) {
				member_address_sw = 'Y';
			}
			
			if(member_address_as.trim() == "") {
				alert("배송지명을 입력하세요!");
				$("#member_address_as").focus();
				return false;
			}
			else if(member_address_name.trim() == "") {
				alert("성명을 입력하세요!");
				$("#member_address_name").focus();
				return false;
			}
			else if(member_address_postcode.trim() == "") {
				alert("주소를 입력하세요!");
				return false;
			}
			else if(member_address_roadAddress.trim() == "") {
				alert("주소를 입력하세요!");
				return false;
			}
			$("#member_address_sw").val(member_address_sw);
			address_edit_form.submit();
		}
	</script>
	<style>
		.address_input_view {
			font-size: 1rem;
		}
		.address_input_view input[type="checkbox"] {
			position: relative;
			top: 1.5px;
		    width: 18px;
		    height: 18px;
		    border: 0;
		    background: url(//img.echosting.cafe24.com/skin/mobile/common/bg_checkbox.png) no-repeat 0 0;
		    background-size: 18px 18px;
		    -webkit-appearance: none;
		}
		.address_input_view input[type="checkbox"]:checked {
		    background-image: url(//img.echosting.cafe24.com/skin/mobile/common/bg_checkbox_checked.png);
		    -webkit-appearance: none;
		}
		.address_input_view a:hover {
			text-decoration: none;
			color: #999;
			transition: 0.3s;
		}
		.address_view .title_move img {
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
		.address-input-css {
			width: 100%;
			border: 1px solid #ececec;
			padding-left: 10px;
			font-size: 1rem;
		}
		.address-input-css:focus {
			outline: none;
		}
		label {
			position: relative;
			top: -1.5px;
		}
		.address_search_btn {
			border: 1px solid #ececec;
			padding: 0px 5px;
			font-szie: 0.8rem;
			background: #f0f0f0;
		}
		.address_input_black_btn_css {
			display: inline-block;
			width: 100%;
			border: 1px solid #000;
			background: #000;
			color: #fff;
			font-weight: 700;
			text-align: center;
			padding: 5px;
			font-size: 0.9rem;
		}
		.address_input_white_btn_css {
			display: inline-block;
			width: 100%;
			border: 1px solid #ececec;
			background: #fff;
			color: #000;
			font-weight: 700;
			text-align: center;
			padding: 5px;
			font-size: 0.9rem;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div style="width: 100%; margin: 0 auto;">
		<div class="address_input_view" style="width: 75%; margin: 0 auto;">
			<form name="address_edit_form" method="post">
				<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
				<div class="row mb-3"><div class="col text-center" style="font-size: 2rem;">주소록 관리</div></div>
				<div class="row" style="padding: 10px; background: #f1f1f1; margin: 0 auto;"><div class="col text-left"><b>배송지 등록</b></div></div>
				<div class="row" style="border-bottom: 1px solid #ececec; padding: 10px; width: 100%; margin: 0 auto;">
					<div class="col-2">배송지명<font color='blue'>*</font></div>
					<div class="col"><input type="text" id="member_address_as" name="member_address_as" value="${vo.member_address_as}" class="address-input-css" required/></div>
				</div>
				<div class="row" style="border-bottom: 1px solid #ececec; padding: 10px; width: 100%; margin: 0 auto;">
					<div class="col-2">성명<font color='blue'>*</font></div>
					<div class="col"><input type="text" id="member_address_name" name="member_address_name" value="${vo.member_address_name}" class="address-input-css"/></div>
				</div>
				<div class="row" style="padding: 10px 10px 3px 10px; width: 100%; margin: 0 auto;">
					<div class="col-2">주소<font color='blue'>*</font></div>
					<div class="col-2"><input type="text" id="sample6_postcode" name="member_address_postcode" class="address-input-css" placeholder="우편번호" value="${vo.member_address_postcode}" readonly/></div>
					<div class="col-2"><a href="javascript:sample6_execDaumPostcode()" class="address_search_btn">주소검색</a></div>
				</div>
				<div class="row" style="padding: 3px 10px; width: 100%; margin: 0 auto;">
					<div class="col-2"></div>
					<div class="col"><input type="text" id="sample6_address" name="member_address_roadAddress" class="address-input-css" placeholder="주소" value="${vo.member_address_roadAddress}" readonly/></div>
				</div>
				<div class="row" style="padding: 3px 10px; width: 100%; margin: 0 auto;">
					<div class="col-2"></div>
					<div class="col"><input type="text" id="sample6_detailAddress" name="member_address_detailAddress" class="address-input-css" placeholder="상세주소" value="${vo.member_address_detailAddress}"/></div>
				</div>
				<div class="row" style="border-bottom: 1px solid #ececec; padding: 3px 10px; width: 100%; margin: 0 auto;">
					<div class="col-2"></div>
					<div class="col"><input type="text" id="sample6_extraAddress" name="member_address_extraAddress" class="address-input-css" placeholder="참고항목" value="${vo.member_address_extraAddress}"/></div>
				</div>
				<div class="row mb-2" style="padding: 10px 10px 0px 10px; border-bottom: 1px solid #ececec;">
					<div class="col text-right"><input type="checkbox" id="normal_address_check" name="normal_address_check" value="Y" /><label for="normal_address_check">&nbsp;기본 배송지로 저장</label></div>
				</div>
				<div class="row" style="padding: 10px;">
					<div class="col p-1"><a href="javascript:address_edit();" class="address_input_black_btn_css">수정</a></div>
					<div class="col p-1"><a href="javascript:history.back();" class="address_input_white_btn_css">취소</a></div>
				</div>
				<input type="hidden" id="member_address_sw" name="member_address_sw" value="" />
			</form>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>