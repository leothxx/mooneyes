<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_service_view.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		
		$(function(){
			$("#mooneyes_service_view_answer_input").hide();
		});
		
		function service_view_delete() {
			let service_idx = "${vo.service_idx}";
			let service_pwd = "${vo.service_pwd}";
			let ans = confirm("정말 삭제하시겠습니까?");
			if(ans == false) return false;
			let ans2 = prompt("현재 문의글의 비밀번호를 입력하세요!");
			if(service_pwd != ans2) {
				alert("비밀번호가 올바르지 않습니다!");
				return false;
			}
			location.href="${ctp}/service/service_delete?service_idx=${vo.service_idx}";
		}
		
		// 답변 작성폼 클릭
		function answer_input_click(idx) {
			$("#mooneyes_service_view_answer_input").show();
		}
		
		// 답변 작성 취소 클릭
		function answer_input_close() {
			$("#mooneyes_service_view_answer_input").hide();
		}
		
		// 답변 작성
		function answer_input() {
			let service_answer_name = $("#service_answer_name").val();
			let service_answer_title = $("#service_answer_title").val();
			let service_answer_content = $("#service_answer_content").val();
			
			if(service_answer_name.trim() == "") {
				alert("답변 작성자명을 입력하세요!");
				return false;
			}
			else if(service_answer_title.trim() == "") {
				alert("답변 제목을 입력하세요!");
				$("#service_answer_title").focus();
				return false;
			}
			else if(service_answer_content.trim() == "") {
				alert("답변 내용을 입력하세요!");
				$("#service_answer_content").focus();
				return false;
			}
			
			service_answer_form.submit();
		}
	</script>
	<style>
		.mooneyes_service_view_css .title_move img {
			position: relative;
			-webkit-animation: myfirst 0.7s linear 1s infinite alternate;
			animation: myfirst 0.7s linear 1s infinite alternate;
		}
		.mooneyes_service_view_css input {
			font-size: 0.9rem;
			padding-left: 5px;
		}
		.mooneyes_service_view_css input:focus, textarea:focus {
			outline: none;
		}
		@-webkit-keyframes myfirst {
			0% {opacity: 1.0; top: 15px;}
			100% {opacity: 1.0; top: 0px;}
		}
		@keyframes myfirst {
			0% {opacity: 1.0; top: 15px;}
			100% {opacity: 1.0; top: 0px;}
		}
		.mooneyes_service_view_css {
			font-size: 1.1rem;
			text-align: center;
		}
		.mooneyes_service_vice_title_css {
			background: rgba(236,236,236,0.5);
			font-weight: 800;
		}
		.mooneyes_service_answer_title_css {
			background: rgba(210,218,137,0.5);
			font-weight: 800;
		}
		.row div {
			padding: 10px;
		}
		.mooneyes_service_view_black_btn_css {
			border: 1px solid #000;
			color: #000;
			font-weight: 600;
			letter-spacing: -1px;
			padding: 2px 10px;
			font-size: 1rem;
		}
		.mooneyes_service_view_yellow_btn_css {
			border: 1px solid #CCCC00;
			color: #CCCC00;
			font-weight: 600;
			letter-spacing: -1px;
			padding: 2px 10px;
			font-size: 1rem;
		}
		.mooneyes_service_view_red_btn_css {
			border: 1px solid red;
			color: red;
			font-weight: 600;
			letter-spacing: -1px;
			padding: 2px 10px;
			font-size: 1rem;
		}
		.mooneyes_service_view_black_btn_css:hover, .mooneyes_service_view_yellow_btn_css:hover, .mooneyes_service_view_red_btn_css:hover {
			border: 1px solid #ccc;
			color: #ccc;
			transition: 0.3s;
			text-decoration: none;
		} 
		.service_answer_input_css {
			width: 100%;
			border: 1px solid #ececec;
		}
		.black_btn_css_style {
			display: inline-block;
			width: 100%;
			border: 1px solid #000;
			padding: 3px 10px;
			background: #000;
			color: #fff;
			font-weight: 800;
		}
		.white_btn_css_style {
			display: inline-block;
			width: 100%;
			border: 1px solid #ececec;
			padding: 3px 10px;
			background: rgba(236,236,236,0.5);
			color: #000;
			font-weight: 800;
		}
		.black_btn_css_style:hover, .white_btn_css_style:hover {
			text-decoration: none;
			color: #bbb;
			transition: 0.3s;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div class="mooneyes_service_view_css" style="width: 100%; margin: 0 auto;">
		<p><br/></p>
		<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
		<div class="row"><div class="col text-center" style="font-weight: 800; font-size: 1.6rem;">문의 내역</div></div>
		<div class="row" style="width: 65%; margin: 0 auto;">
			<div class="col text-left" style="padding: 10px 0px;"><a href="javascript:answer_input_click(${vo.service_idx})" class="mooneyes_service_view_black_btn_css">답변작성</a></div>
			<div class="col text-right" style="padding: 10px 0px;">
				<a href="${ctp}/service/service_update?service_idx=${vo.service_idx}" class="mooneyes_service_view_yellow_btn_css">수정</a>
				<a href="javascript:service_view_delete();" class="mooneyes_service_view_red_btn_css">삭제</a>
			</div>
		</div>
		<div style="width: 65%; margin: 0 auto; border: 1px solid #ececec;">
			<div class="row" style="border-bottom: 1px solid #ececec;">
				<div class="col-2 mooneyes_service_vice_title_css" style="border-right: 1px solid #ececec;">문의번호</div>
				<div class="col-2">${vo.service_idx}</div>
				<div class="col"></div>
				<div class="col-1 mooneyes_service_vice_title_css" style="border-right: 1px solid #ececec;">작성일</div>
				<div class="col-2" style="border-right: 1px solid #ececec;">${fn:substring(vo.service_date,0,16)}</div>
				<div class="col-1 mooneyes_service_vice_title_css" style="border-right: 1px solid #ececec;">작성자IP</div>
				<div class="col-2">${vo.service_ip}</div>
			</div>
			<div class="row" style="border-bottom: 1px solid #ececec;">
				<div class="col-2 mooneyes_service_vice_title_css">카테고리</div>
				<div class="col-2" style="border-right: 1px solid #ececec;">${vo.service_category}</div>
				<div class="col-1 mooneyes_service_vice_title_css" style="border-right: 1px solid #ececec;">제목</div>
				<div class="col" style="border-right: 1px solid #ececec;">${vo.service_title}</div>
				<div class="col-1 mooneyes_service_vice_title_css" style="border-right: 1px solid #ececec;">작성자</div>
				<div class="col-2">${vo.member_name}</div>
			</div>
			<div class="row" style="height: 15vh; text-align: left;">
				<div class="col-2 mooneyes_service_vice_title_css text-center" style="border-right: 1px solid #ececec; display: table;"><div style="vertical-align: middle; display: table-cell;">내용</div></div>
				<div class="col" style="padding: 10px;">${vo.service_content}</div>
			</div>
		</div>
		<!-- 답변 내역 -->
		<c:forEach var="answer_vo" items="${vos}" varStatus="st">
			<div class="mooneyes_service_answer_view" id="mooneyes_service_answer_view_${st.index}">
				<div style="width: 65%; margin: 0 auto; padding: 10px;">
					<div class="row">
						<div class="col-1 p-0"><img src="${ctp}/images/answer_arrow.png" style="width: 30px;"/></div>
						<div class="col">
							<div class="row" style="border: 1px solid #ececec; border-bottom: 0px; padding: 0px;">
								<div class="col-1 mooneyes_service_answer_title_css" style="border: 1px solid #D2DA89;">답변제목</div>
								<div class="col">${answer_vo.service_answer_title}</div>
								<div class="col-1 mooneyes_service_answer_title_css" style="border-left: 1px solid #D2DA89; border-right: 1px solid #ececec;">작성자</div>
								<div class="col-2">${answer_vo.service_answer_name}</div>
								<div class="col-1 mooneyes_service_answer_title_css" style="border-left: 1px solid #D2DA89; border-right: 1px solid #ececec;">작성일</div>
								<div class="col-2">${fn:substring(answer_vo.service_answer_date,0,16)}</div>
							</div>
							<div class="row" style="border: 1px solid #ececec; padding: 0px;">
								<div class="col-1 mooneyes_service_answer_title_css" style="border: 1px solid #D2DA89; border-top: 0px;">답변내용</div>
								<div class="col" style="height: 15vh; text-align: left; padding-left: 10px;">${answer_vo.service_answer_content}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 답변 내역 끝 -->
		<!-- 답변 작성 -->
		<div id="mooneyes_service_view_answer_input">
			<form name="service_answer_form" method="post" action="${ctp}/service/service_answer_input">
				<div class="row mt-5"><div class="col tex-center" style="font-weight: 800; font-size: 1.3rem;">답변 작성</div></div>
				<div class="mt-1" style="width: 65%; margin: 0 auto; padding: 10px; border: 1px solid #ececec;">
					<div class="row mb-2">
						<div class="col-1 p-0">작성자</div>
						<div class="col" style="padding: 0px 10px;"><input type="text" id="service_answer_name" name="service_answer_name" value="${sName}" class="service_answer_input_css" readonly/></div>
					</div>
					<div class="row mb-2">
						<div class="col-1 p-0">제목</div>
						<div class="col" style="padding: 0px 10px;"><input type="text" id="service_answer_title" name="service_answer_title" class="service_answer_input_css"/></div>
					</div>
					<div class="row">
						<div class="col-1 p-0">내용</div>
						<div class="col" style="padding: 0px 10px;"><textarea id="service_answer_content" name="service_answer_content" class="service_answer_input_css" style="height: 15vh; font-size:0.9rem; padding-left: 5px;"></textarea></div>
					</div>
					<div class="row">
						<div class="col"><a href="javascript:answer_input();" class="black_btn_css_style">작성</a></div>
						<div class="col"><a href="javascript:answer_input_close();" class="white_btn_css_style">취소</a></div>
					</div>
				</div>
				<input type="hidden" id="member_idx" name="member_idx" value="${sIdx}" />
				<input type="hidden" id="service_idx" name="service_idx" value="${vo.service_idx}" />
			</form> 
		</div>
		<!-- 답변 끝 -->
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>