<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_member_address.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		// 기본 배송지로 설정 버튼.
		function normal_address_update(index) {
			let member_address_idx = $("#member_address_idx_"+index).val();
			$.ajax({
				type : "post",
				url : "${ctp}/member/member_address_normal_update",
				data : {member_address_idx : member_address_idx},
				success : function(res) {
					if(res != 1) {
						alert("기본 배송지 변경 중 에러가 발생하였습니다.\n다시 시도해 주세요.");
						return false;
					}
					alert("기본 배송지가 변경되었습니다!");
					location.reload();
				},
				error : function() {
					alert("전송오류!");
				}
			});
		}
		
		// 배송지 수정 버튼.
		function address_edit(index) {
			let member_address_idx = $("#member_address_idx_"+index).val();
			location.href="${ctp}/member/member_address_edit?member_address_idx="+member_address_idx;
		}
	</script>
	<style>
		.address_view {
			font-size: 1rem;
		}
		.address_view a:hover {
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
		.address_input_btn_css {
			padding: 5px 15px;
			border: 1px solid #000;
			background: #000;
			color: #fff;
			font-size: 0.9rem;
			font-weight: 800;
		}
		.normal_address_btn_css {
			padding: 5px 15px;
			border: 1px solid #f0f0f0;
			background: #f0f0f0;
			font-size: 0.8rem;
		}
		.option_address_btn_css {
			padding: 5px 15px;
			border: 1px solid #ececec;
			background: #fff;
			font-size: 0.9rem;
		}
		.address_detail_view {
			padding: 10px;
			border: 1px solid #ececec;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div style="width: 100%; margin: 0 auto;">
		<div class="address_view" style="width: 75%; margin: 0 auto;">
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<div class="row mb-3"><div class="col text-center" style="font-size: 2rem;">주소록 관리</div></div>
			<div class="row" style="padding: 10px; background: #f1f1f1; margin: 0 auto;">
				<div class="col text-left"><b>배송지 목록</b></div>
				<div class="col text-right"><a href="${ctp}/member/address_input" class="address_input_btn_css">신규 배송지 등록</a></div>
			</div>
			<c:if test="${vos == null}"><div class="row"><div class="col text-center" style="font-size: 0.8rem; color: #666;">등록된 주소가 없습니다.</div></div></c:if>
			<c:if test="${vos != null}">
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<div class="address_detail_view">
						<div class="row mb-3"><div class="col text-left" style="font-weight: 700;"><font color='blue' id="member_address_as_${st.index}">${vo.member_address_as}</font>(<font color='blue' id="member_address_name_${st.index}">${vo.member_address_name}</font>)<c:if test="${vo.member_address_sw == 'Y'}">&nbsp;&nbsp;[기본배송지]</c:if></div></div>
						<div class="row mb-3"><div class="col text-left">[${vo.member_address_postcode}] ${vo.member_address_roadAddress} ${vo.member_address_detailAddress} ${vo.member_address_extraAddress}</div></div>
						<div class="row">
							<div class="col text-left"><a href="javascript:normal_address_update(${st.index});" class="normal_address_btn_css">기본배송지로 설정</a></div>
							<div class="col text-right"><a href="javascript:address_edit(${st.index});" class="option_address_btn_css">수정</a>&nbsp;<a href="" class="option_address_btn_css">삭제</a></div>
						</div>
					</div>
					<input type="hidden" id="member_address_idx_${st.index}" name="member_address_idx_${st.index}" value="${vo.member_address_idx}" />
				</c:forEach>
			</c:if>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>