<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_join.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		let member_sms_check = 'N';
		let member_email_check = 'N';
		
		$(function(){
			
			// 모두 동의 클릭시
			$("#allCheck").change(function(){
				if($("#allCheck").is(":checked")) {
					$("#agree1_check").prop("checked",true);
					$("#agree2_check").prop("checked",true);
					$("#agree3_check").prop("checked",true);
					$("#sms_check").prop("checked",true);
					member_sms_check = 'Y';
					$("#email_check").prop("checked",true);
					member_email_check = 'Y';
				}
				else {
					$("#agree1_check").prop("checked",false);
					$("#agree2_check").prop("checked",false);
					$("#agree3_check").prop("checked",false);
					$("#sms_check").prop("checked",false);
					member_sms_check = 'N';
					$("#email_check").prop("checked",false);
					member_email_check = 'N';
				}
			});
			
			// 쇼핑 정보 수신 동의 클릭시
			$("#agree3_check").change(function(){
				if($("#agree3_check").is(":checked")) {
					$("#sms_check").prop("checked",true);
					member_sms_check = 'Y';
					$("#email_check").prop("checked",true);
					member_email_check = 'Y';
				}
				else {
					$("#sms_check").prop("checked",false);
					member_sms_check = 'N';
					$("#email_check").prop("checked",false);
					member_email_check = 'N';
				}
			});
			
			// SMS 수신 동의 클릭시
			$("#sms_check").change(function(){
				if($("#sms_check").is(":checked")) {
					member_sms_check = 'Y';
				}
				else {
					member_sms_check = 'N';
				}
			});
			
			// Email 수신 동의 클릭시
			$("#email_check").change(function(){
				if($("#email_check").is(":checked")) {
					member_email_check = 'Y';
				}
				else {
					member_email_check = 'N';
				}
			});
			
			
		});
		function agreeCheck() {
			if($("#agree1_check").is(":checked") && $("#agree2_check").is(":checked")) {
				location.href="${ctp}/member/join2?member_sms_check="+member_sms_check+"&member_email_check="+member_email_check;
			}
			else {
				alert("필수 동의 사항을 체크해주세요!");
			}
		}
	</script>
	<style>
		body {
			padding: 0px;
			margin: 0px;
			font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움','AppleGothic','Apple SD Gothic Neo','sans-serif';
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
		.progress ul li.done + li:before {
    		background-position: -25px 0;
		}
		/*
		.progress ul #agree2::before, .progress ul #agree3::before {
		    position: absolute;
		    top: 0;
		    left: 0;
		    display: inline-block;
		    content: "";
		    width: 17px;
		    height: 37px;
		    background: url(//img.echosting.cafe24.com/skin/mobile/common/bg_process.png) no-repeat 0 0;
		    background-size: 67px auto;
		}
		*/
		input[type="checkbox"] {
		    width: 18px;
		    height: 18px;
		    border: 0;
		    background: url(//img.echosting.cafe24.com/skin/mobile/common/bg_checkbox.png) no-repeat 0 0;
		    background-size: 18px 18px;
		    -webkit-appearance: none;
		}
		input[type="checkbox"]:checked {
		    background-image: url(//img.echosting.cafe24.com/skin/mobile/common/bg_checkbox_checked.png);
		    -webkit-appearance: none;
		}
		.mooneyes_join .contents {
		    overflow: hidden;
		    overflow-y: auto;
		    height: 120px;
		    padding: 14px;
		    color: #000;
		    font-size: 0.7rem;
		    line-height: 1.6em;
		    border-top: 1px solid #ccc;
		}
		.xans-member-join .title div {
		    padding: 10px 0 10px 14px;
		    font-size: 1.3rem;
		    line-height: 36px;
		    font-weight: normal;
		}
		.nextBtn {
			background-color: black;
			color: white;
			text-align: center;
			width: 100%;
			font-size: 0.9rem;
			height: 5vh;
		}
		.closeBtn {
			background-color: white;
			border: 1px solid #ccc;
			text-align: center;
			width: 100%;
			font-size: 0.9rem;
			height: 5vh;
		}
		.agreeArea {
			border: 1px solid #ccc;
			margin-bottom: 20px;
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
		<div class="mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;" class="logo_img"/></div>
		<div class="progress mb-3" style="width: 100%; height:37px;">
		    <ul style="width: 100%; margin: 0px; padding: 0px;">
		    	<li id="agree1" class="done" style="float: left; border-right: 1px solid #ddd;"><strong title="현재 위치">약관동의</strong></li>
		        <li id="agree2" style="float: left; border-right: 1px solid #ddd;">정보입력</li>
		        <li id="agree3" style="float: left;">가입완료</li>
		    </ul>
	    </div>
	    <form name="checkForm">
	    	<div style="padding: 10px;">
	    		<span class="ec-base-chk">
	    			<input type="checkbox" id="allCheck"/>
	    		</span>
	    		<label for="allCheck" style="font-size: 1rem;">
	    			<strong>
	    				이용약관 및 개인정보 수집 및 이용,
	    				<br/>
	    				쇼핑 정보 수신(선택)에 모두 동의합니다.
	    			</strong>
	    		</label>
	    	</div>
	    	<div class="agreeArea">
	    		<div class="title">
			    	<div class="row" style="padding-left: 24px;">
			    		<div style="margin-right: 10px;">
			    			<input type="checkbox" id="agree1_check" style="width: 18px;"/>
			    		</div>
			    		<div>
			    			<label for="agree1_check" style="font-size: 1.2rem;">이용약관 동의(필수)</label>
		    			</div>
			    	</div>
	    		</div>
		    	<div class="contents">
		    		<p>
		    		동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세<br/>
		    		무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		남산 위에 저 소나무 철갑을 두른 듯 바람서리 불변함은 우리 기상일세<br/>
		    		무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편 단심일세<br/>
		    		무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세<br/>
		    		무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		</p>
		    	</div>
	    	</div>
	    	<div class="agreeArea">
	    		<div class="title">
			    	<div class="row" style="padding-left: 24px;">
			    		<div style="margin-right: 10px;">
			    			<input type="checkbox" id="agree2_check" style="width: 18px;"/>
			    		</div>
			    		<div>
			    			<label for="agree2_check" style="font-size: 1.2rem;">개인정보처리방침 동의(필수)</label>
		    			</div>
			    	</div>
	    		</div>
		    	<div class="contents">
		    		<p>
		    		2동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세<br/>
		    		2무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		2남산 위에 저 소나무 철갑을 두른 듯 바람서리 불변함은 우리 기상일세<br/>
		    		2무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		2가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편 단심일세<br/>
		    		2무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		2이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세<br/>
		    		2무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세<br/>
		    		</p>
		    	</div>
	    	</div>
	    	<div class="agreeArea">
	    		<div class="title">
			    	<div class="row" style="padding-left: 24px;">
			    		<div style="margin-right: 10px;">
			    			<input type="checkbox" id="agree3_check" style="width: 18px;"/>
			    		</div>
			    		<div>
			    			<label for="agree3_check" style="font-size: 1.2rem;">쇼핑정보 수신 동의(선택)</label>
		    			</div>
			    	</div>
	    		</div>
	    		<div class="title">
			    	<div class="row" style="padding-left: 24px;">
			    		<div style="margin-right: 10px;">
			    			<input type="checkbox" id="sms_check" style="width: 18px;"/>
			    			<label for="sms_check" style="font-size: 1.2rem;">SMS 수신 동의함</label>
			    		</div>
			    		<div style="margin-right: 10px;">
			    			<input type="checkbox" id="email_check" style="width: 18px;"/>
			    			<label for="email_check" style="font-size: 1.2rem;">EMAIL 수신 동의함</label>
			    		</div>
			    	</div>
	    		</div>
		    	<div class="contents">
		    		<p>
		    		할인쿠폰 및 혜택, 이벤트, 신상품 소식등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.<br/>
		    		단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신 동의 여부와 관계없이 발송됩니다.<br/>
		    		선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원 가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.<br/>
		    		</p>
		    	</div>
	    	</div>
	    	<div class="row mt-3">
	    		<div class="col mr-2"><input type="button" value="다음" onclick="agreeCheck()" class="nextBtn" /></div>
	    		<div class="col"><input type="button" value="취소" onclick="history.back();" class="closeBtn" /></div>
	    	</div>
	    </form>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>