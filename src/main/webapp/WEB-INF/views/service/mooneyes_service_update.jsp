<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_service_update.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		function service_update_btn() {
			let service_category = $("#service_category").val();
			let member_name = $("#member_name").val();
			let service_title = $("#service_title").val();
			let service_content = $("#service_content").val();
			let service_pwd = $("#service_pwd").val();
			const regPwd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			
			if(service_category.trim() == "") {
				alert("카테고리를 선택하세요!");
				return false;
			}
			else if(member_name.trim() == "") {
				alert("작성자 성명을 입력하세요!");
				return false;
			}
			else if(service_title.trim() == "") {
				alert("문의 게시물의 제목을 입력하세요!");
				return false;
			}
			else if(service_content.trim() == "") {
				alert("문의 게시물의 내용을 입력하세요!");
				return false;
			}
			else if(!regPwd.test(service_pwd)) {
				alert("비밀번호를 양식에 맞게 입력해주세요!\n양식은 최소 8자, 최소 하나의 문자와 숫자가 포함되어야 합니다.");
				return false;
			}
			service_update_form.submit();
		}
	</script>
	<style>
		.service_input {
			
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
		.service_input_css {
			width: 100%;
			border: 1px solid #ececec;
			font-size: 1rem;
			padding: 5px 10px;
		}
		.service_input_css:focus {
			outline: none;
		}
		.service_input_title {
			font-size: 1.2rem;
			font-weight: 800;
			border-right: 1px solid #ececec;
			text-align: center;
		}
		.service_input_black_btn_css {
			width: 100%;
			text-align: center;
			background: #000;
			border: 1px solid #000;
			padding: 5px;
			color: #fff;
			font-weight: 700;
			font-size: 1rem;
		}
		.service_input_white_btn_css {
			display: inline-block;
			width: 100%;
			text-align: center;
			background: #fff;
			border: 1px solid #ececec;
			padding: 5px;
			color: #000;
			font-weight: 700;
			font-size: 1rem;
		}
		.service_input_black_btn_css:hover , .service_input_white_btn_css:hover {
			text-decoration: none;
			color: #aaa;
			transition: 0.3s;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div class="service_input" style="width: 100%; margin: 0 auto;">
		<div style="width: 65%; margin: 0 auto;">
			<p><br/></p>
			<form name="service_update_form" method="post">
				<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
				<div class="row mb-3"><div class="col text-center"><b>고객센터 문의 작성</b></div></div>
				<div class="row" style="padding: 3px 10px; padding-top: 10px; border: 1px solid #ececec; border-bottom: 0px;">
					<div class="col-2 service_input_title">문의 카테고리</div>
					<div class="col">
						<select id="service_category" name="service_category" class="service_input_css">
							<option value="상품" ${vo.service_category == '상품' ? 'selected' : ''}>상품</option>
							<option value="사이즈" ${vo.service_category == '사이즈' ? 'selected' : ''}>사이즈</option>
							<option value="배송" ${vo.service_category == '배송' ? 'selected' : ''}>배송</option>
							<option value="입금" ${vo.service_category == '입금' ? 'selected' : ''}>입금</option>
							<option value="주문" ${vo.service_category == '주문' ? 'selected' : ''}>주문</option>
							<option value="환불" ${vo.service_category == '환불' ? 'selected' : ''}>환불</option>
							<option value="입고" ${vo.service_category == '입고' ? 'selected' : ''}>입고</option>
							<option value="계정" ${vo.service_category == '계정' ? 'selected' : ''}>계정</option>
						</select>
					</div>
				</div>
				<div class="row" style="padding: 3px 10px; border: 1px solid #ececec; border-bottom: 0px; border-top: 0px;">
					<div class="col-2 service_input_title">작성자</div>
					<div class="col"><input type="text" id="member_name" name="member_name" value="${vo.member_name}" class="service_input_css"/></div>
				</div>
				<div class="row" style="padding: 3px 10px; border: 1px solid #ececec; border-bottom: 0px; border-top: 0px;">
					<div class="col-2 service_input_title">제목</div>
					<div class="col"><input type="text" id="service_title" name="service_title" value="${vo.service_title}" class="service_input_css"/></div>
				</div>
				<div class="row" style="padding: 3px 10px; border: 1px solid #ececec; border-bottom: 0px; border-top: 0px;">
					<div class="col-2 service_input_title">내용</div>
					<div class="col"><textarea id="service_content" name="service_content" class="service_input_css" style="height: 15vh;">${vo.service_content}</textarea></div>
				</div>
				<div class="row mb-4" style="padding: 3px 10px; padding-bottom: 10px; border: 1px solid #ececec; border-top: 0px;">
					<div class="col-2 service_input_title">문의글 비밀번호</div>
					<div class="col"><input type="password" id="service_pwd" name="service_pwd" class="service_input_css" /></div>
				</div>
				<div class="row">
					<div class="col p-1"><input type="button" onclick="service_update_btn();" value="수정" class="service_input_black_btn_css"/></div>
					<div class="col p-1"><a href="javascript:history.back();" class="service_input_white_btn_css">뒤로가기</a></div>
				</div>
				<input type="hidden" name="member_idx" id="member_idx" value="${vo.member_idx}" />
				<input type="hidden" name="service_ip" id="service_ip" value="${pageContext.request.remoteAddr}" />
			</form>
		</div>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>