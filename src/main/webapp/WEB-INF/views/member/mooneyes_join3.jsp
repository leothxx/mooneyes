<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_join3.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<style>
		.mooneyes_join .contents {
		    overflow: hidden;
		    overflow-y: auto;
		    height: 120px;
		    padding: 14px;
		    color: #000;
		    font-size: 0.7rem;
		    line-height: 1.6em;
		    border-top: 1px solid #ccc;
		    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕',Dotum,'돋움','AppleGothic','Apple SD Gothic Neo',sans-serif;
		}
		.progress ul li {
		    position: relative;
		    float: left;
		    padding: 0 0 0 17px;
		    width: 35%;
		    line-height: 37px;
		    background-color: #ebebeb;
		    box-sizing: border-box;
		    list-style-type: none;
		    font-size: 1rem;
		    text-align: center;
		}
		ul {
		    display: block;
		    list-style-type: decimal;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    padding-inline-start: 40px;
		}
		.progress ul li:first-child {
		    padding: 0;
		    width: 30%;
		}
		li {
			list-style: none;
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		strong {
  			font-weight: bold;
		}
		.progress ul li.done {
    		background-color: yellow;
		}
		.loginBtn {
			width: 100%;
			background-color: #000;
			color: #fff;
			text-align: center;
			font-size: 0.8rem;
			height: 3vh;
		}
		.okBtn {
			width: 100%;
			border: 1px solid #ddd;
			background-color: #fff;
			color: #000;
			text-align: center;
			font-size: 0.8rem;
			height: 3vh;
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
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<!-- 회원가입 창 배너 -->
	<div class="container mooneyes_join">
		<p><br/><br/><br/></p>
		<div class="mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 20vw;" class="logo_img"/></div>
		<div class="progress mb-3" style="width: 100%; height:37px;">
		    <ul style="width: 100%; margin: 0px; padding: 0px;">
		    	<li id="agree1" class="done" style="float: left; border-right: 1px solid #ddd;">약관동의</strong></li>
		        <li id="agree2" class="done" style="float: left; border-right: 1px solid #ddd;">정보입력</li>
		        <li id="agree3" class="done" style="float: left;"><strong title="현재 위치">가입완료</strong></li>
		    </ul>
	    </div>
	    <div style="border: 1px solid #ddd; text-align: center; font-size: 0.9rem;" class="p-2">
	    	<p><font style="font-size: 0.9rem; font-weight: 700;">회원가입이 완료되었습니다.</font></p>
	    	<p><font style="font-size: 0.9rem;  font-weight: 700;">${vo.member_name}</font>님은 <c:if test="${vo.member_level == 0}"><font style="font-size: 0.9rem;  font-weight: 700;">준회원</font></c:if> 이십니다.</p>
	    </div>
	    <div style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; font-size: 0.9rem;" class="pt-2 pl-2 mt-2">
	    	<div class="row" style="font-size: 0.9rem; margin-bottom: 10px;">
	    		<div class="col-1" style="font-weight: 600;">아이디</div>
	    		<div class="col" style="font-weight: 600;">${vo.member_mid}</div>
	    	</div>
	    	<div class="row" style="font-size: 0.9rem; margin-bottom: 10px;">
	    		<div class="col-1" style="font-weight: 600;">이&nbsp;&nbsp;&nbsp;름</div>
	    		<div class="col" style="font-weight: 600;">${vo.member_name}</div>
	    	</div>
	    	<div class="row" style="font-size: 0.9rem; margin-bottom: 10px;">
	    		<div class="col-1" style="font-weight: 600;">이메일</div>
	    		<div class="col" style="font-weight: 600;">${vo.member_email}</div>
	    	</div>
	    </div>
	    <div>
	    	<div style="font-size: 0.9rem; font-weight: 800;" class="p-2">이메일 주소로 발송된 인증 메일을 통해 인증하신 후에 상품 구매 및 기타 서비스 이용이 가능합니다.<br/>가입된 아이디로 로그인 후 마이페이지 - 이메일인증 에서 인증을 해주시기 바랍니다.</div>
	    </div>
	    <div class="row">
	    	<div class="col" style="padding: 5px;"><input type="button" value="로그인" onclick="javascript:location.href='${ctp}/member/memberLogin'" class="loginBtn"/></div>
	    	<div class="col" style="padding: 5px;"><input type="button" value="완료" onclick="javascript:location.href='${ctp}/member/memberLogin'" class="okBtn"/></div>
	    </div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>