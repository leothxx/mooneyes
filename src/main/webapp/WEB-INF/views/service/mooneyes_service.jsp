<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_service.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		function service_content_click(idx) {
			let service_pwd = $("#service_pwd_"+idx).val();
			let member_idx = $("#member_idx_"+idx).val();
			let model_member_idx = "${member_idx}";
			
			let ans = prompt("문의글 비밀번호를 입력하세요!");
			if(ans != service_pwd && member_idx != model_member_idx) {
				alert("비밀번호가 올바르지 않습니다!");
				return false;
			}
			
			location.href="${ctp}/service/service_view?service_idx="+idx;
		}
	</script>
	<style>
		.mooneyes_service {
			font-size: 1rem;
			font-weight: 700;
		}
		.mooneyes_service a:hover {
			text-decoration: none;
			color: #aaa;
			transition: 0.3s;
		}
		div .title_move img {
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
		.service_title {
			border: 1px solid #ececec;
			font-size: 1.2rem;
			background: #ececec;
		}
		.service_title div, .service_content div {
			border-right: 1px solid #ececec;
			padding-top: 5px;
			padding-bottom: 5px;
		}
		.service_content {
			border: 1px solid #ececec;
			border-top: 0px;
		}
		.service_content:hover {
			background: #ddd;
		}
		.service_input_btn_css {
			background: #000;
			color: #fff;
			border: 1px solid #000;
			letter-spacing: -1px;
			padding: 5px;
			font-size: 0.8rem;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div style="width: 100%; margin: 0 auto;">
		<div class="mooneyes_service" style="width: 75%; margin: 0 auto;">
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<div class="row mb-4"><div class="col text-center" style="font-size: 1.5rem;">고객센터 문의</div></div>
			<div class="row mb-2"><div class="col text-right"><a href="${ctp}/service/service_input" class="service_input_btn_css">문의 작성</a></div></div>
			<div class="row p-0 service_title" style="padding: 10px; margin: 0 auto;">
				<div class="col">카테고리</div>
				<div class="col">문의번호</div>
				<div class="col">제목</div>
				<div class="col">작성자</div>
				<div class="col">날짜</div>
				<div class="col">답변여부</div>
			</div>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<a href="javascript:service_content_click(${vo.service_idx});">
					<input type="hidden" id="service_pwd_${vo.service_idx}" name="service_pwd" value="${vo.service_pwd}"/>
					<input type="hidden" id="member_idx_${vo.service_idx}" name="member_idx" value="${vo.member_idx}"/>
					<div class="row p-0 service_content" id="service_content_${st.index}" style="padding: 10px; margin: 0 auto;">
						<div class="col">${vo.service_category}</div>
						<div class="col">${vo.service_idx}</div>
						<div class="col">${vo.service_title}</div>
						<div class="col">${vo.member_name}</div>
						<div class="col">${fn:substring(vo.service_date,0,11)}</div>
						<div class="col">
							<c:if test="${vo.service_answer_sw == 'N'}">X</c:if>
							<c:if test="${vo.service_answer_sw == 'Y'}">O</c:if>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>