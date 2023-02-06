<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_email_certification.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		function certification() {
			let code = certification_form.member_certification_code.value;
			if(code == "") {
				alert("인증 코드를 입력해주세요!");
				return false;
			}
			certification_form.code.value = code;
			certification_form.submit();
		}
	</script>
	<style>
		.email_certification {
			font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움','AppleGothic','Apple SD Gothic Neo','sans-serif';
		}
		.input_bar {
			font-size: 0.9rem;
		}
		.certification_field {
			width: 90%;
			font-weight: 300;
			border: 1px solid #ececec;
			padding-left: 10px;
		}
		.certification_field:focus {
			outline: none;
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
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div class="container email_certification">
		<form name="certification_form" method="post">
			<p><br/><br/><br/><br/></p>
			<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
			<div class="mb-5 pb-3" style="text-align: center; border-bottom: 1px solid #ececec;">회원 이메일 인증&nbsp;&nbsp;<i class="fa fa-envelope-o" aria-hidden="true"></i></div>
			<div class="row input_bar">
				<div class="col-2" style="text-align: right; font-weight: 600;">전송된 이메일</div>
				<div class="col"><input type="text" id="member_email" name="member_email" value="${vo.member_email}" readonly class="certification_field"/></div>
			</div>
			<div class="row input_bar mt-1">
				<div class="col text-center">- 기본정보 > 이메일 항목에 입력하신 정보로 회원가입 후에 입력하신 이메일 주소로 <font color='red' style="font-weight: 600;">인증코드</font> 메일이 발송되었으니, 확인해주시기 바랍니다.</div>
			</div>
			<div class="row input_bar mt-3 mb-5">
				<div class="col-2" style="text-align: right; font-weight: 600;">인증 코드</div>
				<div class="col"><input type="text" id="member_certification_code" name="member_certification_code" autofocus required class="certification_field"/></div>
			</div>
			<div class="row input_bar mt-5">
				<div class="col"><input type="button" value="인증하기" onclick="certification();" class="black_btn" /></div>
				<div class="col"><input type="button" value="회원정보수정" onclick="location.href='${ctp}/member/my_info?mid="+${vo.member_mid}+"';" class="white_btn" /></div>
				<div class="col"><input type="button" value="취소" onclick="history.back();" class="black_btn" /></div>
			</div>
			<input type="hidden" id="code" name="code" value="" />
			<input type="hidden" id="member_mid" name="member_mid" value="${vo.member_mid}" />
		</form>
 	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>