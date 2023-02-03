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
		let regMidCheck = false;
	    let regPwdCheck = false;
	    let regPwd2Check = false;
	    let regNameCheck = false;
	    let regEmailCheck= false;
	    let regPhoneCheck= false;
	    let user_phone= "";
	    let user_email= "";
	    
		$(function(){
			const regMid = /^[A-Za-z0-9_]{4,20}$/;
		    const regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		    const regName = /^[가-힣a-zA-Z]+$/;
		    const regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		    const regPhone = /\d{2,3}-\d{3,4}-\d{4}$/g;
		    
		    let pwdCheckSw = 0;
		    
		    // 아이디 유효성 체크
	     	$("#member_mid").blur(function() {
	    		if($("#member_mid").val().trim() == "") {
	    			$("#idComent").html("<font color='red' class='signInfo'> 아이디를 입력하세요!</font>");
	    			regMidCheck = false;
	    			return false;
	  			}
	    		else {
	    			let member_mid = $("#member_mid").val();
	    			if(!regMid.test(member_mid)) {
		    			$("#idComent").html("<font color='red' class='signInfo'> 아이디 양식에 올바르지 않습니다! </font> <font color='#000' class='signInfo'><br/>영문과 숫자, 언더바(_)만 사용 가능합니다. 4~20자리</font>");
		    			regMidCheck = false;
		    			return false;
	    			}
	    			else {
	    				$.ajax({
	    					url : "${ctp}/member/idCheck",
	    					type : "post",
	    					data : {member_mid : member_mid},
	    					success : function(res){
	    						if(res == '1') {
					    			$("#idComent").html("<font color='blue' class='signInfo'> 아이디 형식에 일치합니다.</font>");
					    			regMidCheck = true;
	    						}
	    						else {
					    			$("#idComent").html("<font color='red' class='signInfo'> 중복된 아이디가 있습니다.</font>");
					    			regMidCheck = false;
	    						}
	    					}
	    				});
	    			}
	    		}
	    	});
		    
	     	// 비밀번호 유효성 체크
	     	$("#member_pwd").blur(function(event) {
	     		if(pwdCheckSw != 0){
		     		$("#member_pwdCheck").blur();
	     		}
	    		if($("#member_pwd").val() == "") {
	    			$("#pwdComent").html("<font color='red' class='signInfo'> 비밀번호를 입력하세요!</font>");
	    			regPwdCheck = false;
	    			return false;
	  			}
	    		else {
	    			let member_pwd = $("#member_pwd").val();
	    			if(!regPwd.test(member_pwd)) {
		    			$("#pwdComent").html("<font color='red' class='signInfo'> 비밀번호 양식에 올바르지 않습니다! </font> <font color='#000' class='signInfo'><br/>비밀번호는 1개이상의 문자와 특수문자, 숫자가 포함되어야 하며 최소 8자리 이상이여야 합니다.</font>");
		    			regPwdCheck = false;
		    			return false;
	    			}
	    			else {
		    			$("#pwdComent").html("<font color='blue' class='signInfo'> 비밀번호 형식에 일치합니다.</font>");
		    			pwdCheckSw = 1;
		    			regPwdCheck = true;
	    			}
	    		}
	    	});
	     	
	     	// 비밀번호 확인 유효성 체크
	     	$("#member_pwd2").blur(function(event) {
	    		if($("#member_pwd2").val() == "") {
	    			$("#pwdCheckComent").html("<font color='red' class='signInfo'> 비밀번호를 입력하세요!</font>");
	    			regPwd2Check = false;
	    			return false;
	  			}
	    		else {
	    			let member_pwd = $("#member_pwd").val();
	    			let member_pwd2 = $("#member_pwd2").val();
	    			if(member_pwd2 != member_pwd) {
		    			$("#pwdCheckComent").html("<font color='red' class='signInfo'> 비밀번호가 올바르지 않습니다! </font> <font color='#000' class='signInfo'><br/>위와 동일한 비밀번호를 입력하세요.</font>");
		    			regPwd2Check = false;
		    			return false;
	    			}
	    			else {
		    			$("#pwdCheckComent").html("<font color='blue' class='signInfo'> 비밀번호가 일치합니다.</font>");
		    			regPwd2Check = true;
	    			}
	    		}
	    	});
	     	
	     	// 성명 유효성 체크
	     	$("#member_name").blur(function(event) {
	    		if($("#member_name").val() == "") {
	    			$("#nameComent").html("<font color='red' class='signInfo'> 성명을 입력하세요!</font>");
	    			regNameCheck = false;
	    			return false;
	  			}
	    		else {
	    			let member_name = $("#member_name").val();
	    			if(!regName.test(member_name)) {
		    			$("#nameComent").html("<font color='red' class='signInfo'> 이름 양식에 올바르지 않습니다! </font> <font color='#000' class='signInfo'><br/>성명은 한글 및 영문만 입력 가능합니다.</font>");
		    			regNameCheck = false;
		    			return false;
	    			}
	    			else {
		    			$("#nameComent").html("<font color='blue' class='signInfo'> 이름 형식에 일치합니다.</font>");
		    			regNameCheck = true;
	    			}
	    		}
	    	});
	     	
	     	// 전화번호 유효성 체크
	     	$("#member_phone1, #member_phone2, #member_phone3").blur(function(event) {
	    		if($("#member_phone1").val() == "" || $("#member_phone2").val() == "" || $("#member_phone3").val() == "") {
	    			$("#phoneComent").html("<font color='red' class='signInfo'> 휴대전화번호를 입력하세요!</font>");
	    			regPhoneCheck = false;
	    			return false;
	  			}
	    		else {
	    			user_phone = $("#member_phone1").val() + "-" + $("#member_phone2").val() + "-" + $("#member_phone3").val();
	    			if(!regPhone.test(user_phone)) {
		    			$("#phoneComent").html("<font color='red' class='signInfo'> 전화번호 양식에 올바르지 않습니다! </font><br/> <font color='#000' class='signInfo'> 전화번호 양식은 000-3~4자리-0000 입니다.</font>");
		    			regPhoneCheck = false;
		    			return false;
	    			}
	    			else {
		    			$("#phoneComent").html("<font color='blue' class='signInfo'> 전화번호 형식에 일치합니다.</font>");
		    			regPhoneCheck = true;
	    			}
	    		}
	    	});
		    
	     	// 이메일 유효성 체크
	     	$("#member_email1, #member_email2").blur(function(event) {
	    		if($("#member_email1").val() == "" || $("#member_email2").val() == "") {
	    			$("#emailComent").html("<font color='red' class='signInfo'> 이메일을 입력하세요!</font>");
	    			regEmailCheck = false;
	    			return false;
	  			}
	    		else {
	    			let member_email1 = $("#member_email1").val();
	    			let member_email2 = $("#member_email2").val();
	    			user_email = member_email1 + '@' + member_email2;
	    			if(!regEmail.test(user_email)) {
		    			$("#emailComent").html("<font color='red' class='signInfo'> 이메일 양식에 올바르지 않습니다! </font>");
		    			regEmailCheck = false;
		    			return false;
	    			}
	    			else {
	    				$.ajax({
	    					url : "${ctp}/member/emailCheck",
	    					type : "post",
	    					data : {member_email : user_email},
	    					success : function(res){
	    						if(res == '1') {
					    			$("#emailComent").html("<font color='blue' class='signInfo'> 이메일 형식에 일치합니다.</font>");
					    			regEmailCheck = true;
	    						}
	    						else {
					    			$("#emailComent").html("<font color='red' class='signInfo'> 중복된 이메일이 있습니다.</font>");
					    			regEmailCheck = false;
	    						}
	    					}
	    				});
	    			}
	    		}
	    	});
		});
		
		// 회원가입 버튼
	    function signCheck() {
	    	if(regMidCheck == false && regPwdCheck == true && regPwd2Check == true && regNameCheck == true && regEmailCheck == true && regPhoneCheck == true) {
	    		alert("입력하신 아이디가 가입 양식에 맞지 않습니다.\n다시 확인해주세요.");
	    		return false;
	    	}
	    	else if(regMidCheck == true && regPwdCheck == true && regPwd2Check == false && regNameCheck == true && regEmailCheck == true && regPhoneCheck == true) {
	    		alert("비밀번호 확인란을 다시 한번 확인해주세요.");
	    		return false;
	    	}
	    	else if(regMidCheck == true && regPwdCheck == true && regPwd2Check == true && regNameCheck == false && regEmailCheck == true && regPhoneCheck == true) {
	    		alert("입력하신 성명이 가입 양식에 맞지 않습니다.\n다시 확인해주세요.");
	    		return false;
	    	}
	    	else if(regMidCheck == true && regPwdCheck == true && regPwd2Check == true && regNameCheck == true && regEmailCheck == false && regPhoneCheck == true) {
	    		alert("입력하신 이메일이 가입 양식에 맞지 않습니다.\n다시 확인해주세요.");
	    		return false;
	    	}
	    	else if(regMidCheck == true && regPwdCheck == true && regPwd2Check == true && regNameCheck == true && regEmailCheck == true && regPhoneCheck == false) {
	    		alert("입력하신 전화번호가 가입 양식에 맞지 않습니다.\n다시 확인해주세요.");
	    		return false;
	    	}
	    	else if(regMidCheck == false || regPwdCheck == false || regPwd2Check == false || regNameCheck == false || regEmailCheck == false || regPhoneCheck == false) {
	    		alert("가입을 위한 필수입력사항을 양식에 맞게 입력해주세요.");
	    		return false;
	    	}
	    	else if(regMidCheck == true && regPwdCheck == true && regPwd2Check == true && regNameCheck == true && regEmailCheck == true && regPhoneCheck == true) {
	    		joinForm.member_email.value = user_email;
	    		joinForm.member_phone.value = user_phone;
	    		joinForm.member_sms_check.value = "${member_sms_check}";
	    		joinForm.member_email_check.value = "${member_email_check}";
	    		
	    		joinForm.submit();
	    	}
	    }
	</script>
	<style>
		body {
			padding: 0px;
			margin: 0px;
			font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움','AppleGothic','Apple SD Gothic Neo','sans-serif';
		}
		.signInfo {
	  		font-size: 0.8em;
	  		opacity: 0.8;
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
		.signBtn {
			background-color: black;
			color: white;
			text-align: center;
			width: 100%;
			font-size: 0.9rem;
			height: 5vh;
		}
		.agreeArea {
			border: 1px solid #ccc;
			margin-bottom: 20px;
		}
		form div {
			font-size: 0.9rem;
			font-weight: 500;
		}
		input[type=text] {
			border: 1px solid #ccc;
			border-radius: 10px;
			padding-left: 5px;
		}
		input[type=password] {
			border: 1px solid #ccc;
			border-radius: 10px;
			padding-left: 5px;
		}
		select {
			width: 120px;
			border: 1px solid #ccc;
			border-radius: 10px;
			padding-left: 5px;
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
		<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
		<div class="progress mb-3" style="width: 100%; height:37px;">
		    <ul style="width: 100%; margin: 0px; padding: 0px;">
		    	<li id="agree1" class="done" style="float: left; border-right: 1px solid #ddd;">약관동의</li>
		        <li id="agree2" class="done" style="float: left; border-right: 1px solid #ddd;"><strong title="현재 위치">정보입력</strong></li>
		        <li id="agree3" style="float: left;">가입완료</li>
		    </ul>
	    </div>
	    <form name="joinForm" method="post">
	    	<div class="mb-3 pl-5 pt-1 pb-3" style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
	    		<div class="row">
	    			<input type="radio" id="emailTest" checked readonly/>&nbsp;&nbsp;<label for="emailTest" style="padding-top: 10px;"><span style="font-size: 1rem;">이메일인증</span></label>
    			</div>		
	    		<div class="row">
	    			기본정보 > 이메일 항목에 입력하신 정보로 본인인증을 진행합니다.
    			</div>		
	    		<div class="row">
	    			회원가입 후에 인증 메일이 발송되오니, 확인해 주시기 바랍니다.
    			</div>		
	    	</div>
	    	<div class="mb-3 pl-5 pt-1 pb-3" style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
	    		<div class="row pt-3">
	    			<div class="col-2">아이디&nbsp;<span style="color: blue;">*</span></div>
	    			<div class="col"><input type="text" id="member_mid" name="member_mid" autofocus required /></div>
	    			<div id="idComent"></div>
	    		</div>
	    	</div>
	    	<div class="mb-3 pl-5 pt-1 pb-3" style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
	    		<div class="row pt-3">
	    			<div class="col-2">비밀번호&nbsp;<span style="color: blue;">*</span></div>
	    			<div class="col"><input type="password" id="member_pwd" name="member_pwd" required /></div>
	    			<div id="pwdComent"></div>
	    		</div>
	    	</div>
	    	<div class="mb-3 pl-5 pt-1 pb-3" style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
	    		<div class="row pt-3">
	    			<div class="col-2">비밀번호 확인&nbsp;<span style="color: blue;">*</span></div>
	    			<div class="col"><input type="password" id="member_pwd2" name="member_pwd2" required /></div>
	    			<div id="pwdCheckComent"></div>
	    		</div>
	    	</div>
	    	<div class="mb-3 pl-5 pt-1 pb-3" style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
	    		<div class="row pt-3">
	    			<div class="col-2">성명&nbsp;<span style="color: blue;">*</span></div>
	    			<div class="col"><input type="text" id="member_name" name="member_name" required /></div>
	    			<div id="nameComent"></div>
	    		</div>
	    	</div>
	    	<div class="mb-3 pl-5 pt-1 pb-3" style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
	    		<div class="row pt-3">
	    			<div class="col-2">휴대전화&nbsp;<span style="color: blue;">*</span></div>
	    			<div class="col">
	    				<select name="member_phone1" id="member_phone1">
	    					<option value="010" selected>010</option>
	    					<option value="011">011</option>
	    					<option value="016">016</option>
	    					<option value="017">017</option>
	    					<option value="018">018</option>
	    					<option value="019">019</option>
	    				</select>&nbsp;-&nbsp;
	    				<input type="text" id="member_phone2" name="member_phone2" required />&nbsp;-&nbsp;
	    				<input type="text" id="member_phone3" name="member_phone3" required />
		    			<div id="phoneComent"></div>
    				</div>
	    		</div>
	    	</div>
	    	<div class="mb-3 pl-5 pt-1 pb-3" style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;">
	    		<div class="row pt-3">
	    			<div class="col-2">이메일&nbsp;<span style="color: blue;">*</span></div>
	    			<div class="col">
	    				<input type="text" id="member_email1" name="member_email1" required />&nbsp;@&nbsp;
	    				<select name="member_email2" id="member_email2">
	    					<option value="naver.com" selected>naver.com</option>
	    					<option value="gmail.com">gmail.com</option>
	    					<option value="hanmail.net">hanmail.net</option>
	    					<option value="daum.net">daum.net</option>
	    				</select>
		    			<div id="emailComent"></div>
    				</div>
	    		</div>
	    	</div>
	    	<div class="row"><input type="button" value="가입하기" onclick="signCheck()" class="signBtn"/></div>
	    	<input type="hidden" id="member_email" name="member_email" value="" />
	    	<input type="hidden" id="member_phone" name="member_phone" value="" />
	    	<input type="hidden" id="member_sms_check" name="member_sms_check" value="" />
	    	<input type="hidden" id="member_email_check" name="member_email_check" value="" />
	    	<input type="hidden" id="member_signIp" name="member_signIp" value="${pageContext.request.remoteAddr}" />
	    </form>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>