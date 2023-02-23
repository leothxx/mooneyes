<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_my_info.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/postcode.js"></script>
  	<script>
  		'use strict';
  		let regbeforePwdCheck = false;
  		let regPwdCheck = false;
	    let regPwd2Check = false;
	    let regNameCheck = false;
	    let regPhoneCheck= false;
	    let regTelCheck= false;
	    
	    let member_tel= "";
	    let member_phone= "";
	    let pwd_change_sw = "no";
	    
	    const regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	    const regName = /^[가-힣a-zA-Z]+$/;
	    const regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
	    const regPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/
	    
  		$(function(){
  			modal.style.display = "none";
  			
  			if($(window).scrollTop() + $(window).height() == $(document).height()) {
	  			modal.style.display = "none";
  		    }
  			
  			let pwdCheckSw = 0;
  	      	let beforePwdCheckSw = 0;
  	      	
  			// 이전 비밀번호 유효성 체크
  	   		$("#member_pwd").blur(function(event) {
  	   			if(pwdCheckSw != 0){
		     		$("#member_new_pwd").blur();
	     		}
  	  			if($("#member_pwd").val() == "") {
  					$("#beforePwdComent").html("<font color='red' class='signInfo'> 이전 비밀번호를 입력하세요!</font>");
  					regbeforePwdCheck = false;
  	  				return false;
				}
  	  			else {
  	  				let user_beforePwd = $("#member_pwd").val();
  	  				let user_id = "${vo.member_mid}";
  	  				let query = {
  							member_before_pwd : user_beforePwd,
  							member_mid : user_id
  	  				};
  	  				
  	  				$.ajax({
  	  					url : "${ctp}/member/before_pwd_check",
  	  					type : "post",
  	  					data : query,
  	  					success : function(res) {
  	  						if(res == '1') {
  	  							$("#beforePwdComent").html("<font color='blue' class='signInfo'> 이전 비밀번호와 일치합니다.</font>");
  	  							regbeforePwdCheck = true;
  	  						}
  	  						else {
  	  							$("#beforePwdComent").html("<font color='red' class='signInfo'> 이전 비밀번호가 올바르지 않습니다! </font>");
  	  							regbeforePwdCheck = false;
  	  						}
  	  					},
  	  					error : function() {
  	  						alert("전송 오류 발생!");
  	  					}
  	  				});
  	  			}
  	  		});
  			
  	   		// 비밀번호 유효성 체크
  	     	$("#member_new_pwd").blur(function(event) {
  	     		if(pwdCheckSw != 0){
  		     		$("#member_new_pwd2").blur();
  	     		}
  	    		if($("#member_new_pwd").val() == "") {
  	    			$("#pwdComent").html("<font color='red' class='signInfo'> 비밀번호를 입력하세요!</font>");
  	    			regPwdCheck = false;
  	    			return false;
  	  			}
  	    		else {
  	    			let member_new_pwd = $("#member_new_pwd").val();
  	    			if(!regPwd.test(member_new_pwd)) {
  		    			$("#pwdComent").html("<font color='red' class='signInfo'> 비밀번호 양식에 올바르지 않습니다! </font> <font color='#000' class='signInfo'><br/>비밀번호는 1개이상의 문자와 특수문자, 숫자가 포함되어야 하며. 최소 8자리 이상이여야 합니다.</font>");
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
  	     	$("#member_new_pwd2").blur(function(event) {
  	    		if($("#member_new_pwd2").val() == "") {
  	    			$("#pwdCheckComent").html("<font color='red' class='signInfo'> 비밀번호를 입력하세요!</font>");
  	    			regPwd2Check = false;
  	    			return false;
  	  			}
  	    		else {
  	    			let member_new_pwd = $("#member_new_pwd").val();
  	    			let member_new_pwd2 = $("#member_new_pwd2").val();
  	    			if(member_new_pwd != member_new_pwd2) {
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
  	   		
  		});
  		
  		function modal_close() {
  			modal.style.display = "none";
  		}
  		
  		// 회원 수정하기 버튼
  		function member_update() {
  			let postcode = member_update_form.postcode.value;
  	    	let detailAddress = member_update_form.detailAddress.value;
  	    	
  	    	let member_before_pwd = member_update_form.member_pwd.value;
  	    	let member_new_pwd = member_update_form.member_new_pwd.value;
  	    	let member_new_pwd2 = member_update_form.member_new_pwd2.value;
  	    	
  	    	let member_name = member_update_form.member_name.value;
  	    	
  	    	let member_tel1 = member_update_form.member_tel1.value;
  	    	let member_tel2 = member_update_form.member_tel2.value;
  	    	let member_tel3 = member_update_form.member_tel3.value;
  	    	
  	    	let member_phone1 = member_update_form.member_phone1.value;
  	    	let member_phone2 = member_update_form.member_phone2.value;
  	    	let member_phone3 = member_update_form.member_phone3.value;
  	    	
  	    	if(postcode.trim() == "" || detailAddress.trim() == "") {
  	    		alert("주소를 입력하세요.");
  	    		return false;
  	    	}
  	    	
  	    	if(member_new_pwd != "") {
  	    		if(regbeforePwdCheck == true && regPwdCheck == true && regPwd2Check == true) {
  	    			pwd_change_sw = "ok";
  	    		}
  	    		else if(regbeforePwdCheck == false) {
  	    			alert("이전 비밀번호가 올바르지 않습니다.");
  	    			return false;
  	    		}
  	    		else if(regPwdCheck == false) {
  	    			alert("새 비밀번호가 비밀번호 형식에 올바르지 않습니다.");
  	    			return false;
  	    		}
  	    		else if(regPwd2Check == false) {
  	    			alert("비밀번호 확인란의 비밀번호가 올바르지 않습니다.");
  	    			return false;
  	    		}
  	    	}
  	    	
  	    	if(member_name != "") {
  	    		if(!regName.test(member_name)) {
  	    			alert("수정하시려는 이름이 형식에 맞지 않습니다. \n 성명은 한글 및 영문자만 입력 가능합니다.");
  	    			member_update_form.member_name.focus();
	    			return false;
    			}
  	    	}
  	    	else {
  	    		alert("수정할 이름을 입력하세요!");
  	    		return false;
  	    	}
  	    	
  	    	if(member_tel2 != "" || member_tel3 != "") {
  	    		member_tel = member_tel1 + "-" + member_tel2 + "-" + member_tel3;
  	    		if(!regTel.test(member_tel)) {
  	    			alert("수정하시려는 일반전화번호가 형식에 맞지 않습니다. \n 전화번호는 00(000)-000(0000)-0000 숫자만 가능합니다.");
  	    			member_update_form.member_tel2.focus();
	    			return false;
    			}
  	    	}
  	    	else member_tel = member_tel1 + "-" + "000" + "-" + "0000";
  	    	
  	    	if(member_phone2 != "" || member_phone3 != "") {
  	    		member_phone = member_phone1 + "-" + member_phone2 + "-" + member_phone3;
  	    		if(!regPhone.test(member_phone)) {
  	    			alert("수정하시려는 휴대전화번호가 형식에 맞지 않습니다. \n 전화번호는 000-000(0000)-0000 숫자만 가능합니다.");
  	    			member_update_form.member_phone2.focus();
	    			return false;
    			}
  	    	}
  	    	else {
  	    		alert("수정할 휴대전화번호를 입력하세요!");
  	    		return false;
  	    	}
  	    	
  	    	postcode = member_update_form.postcode.value + " ";
    		let roadAddress = member_update_form.roadAddress.value + " ";
    		detailAddress = member_update_form.detailAddress.value + " ";
    		let extraAddress = member_update_form.extraAddress.value + " ";
    		
    		member_update_form.member_address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
    		member_update_form.member_tel.value = member_tel;
    		member_update_form.member_phone.value = member_phone;
    		member_update_form.pwd_change_sw.value = pwd_change_sw;
    		
    		member_update_form.submit();
  		}
  		
  		// 환불계좌 등록 버튼
  		function refund_update() {
  			let member_refund_bank = document.getElementById("member_refund_bank").value;
  			let member_refund_number = document.getElementById("member_refund_number").value;
  			let member_refund_name = document.getElementById("member_refund_name").value;
  			
  			let query = {
  					member_mid : "${vo.member_mid}",
  					member_refund_bank : member_refund_bank,
  					member_refund_number : member_refund_number,
  					member_refund_name : member_refund_name
  			}
  			
  			if(member_refund_bank != null && member_refund_number != null && member_refund_name != null) {
	  			$.ajax({
	  				type : "post",
	  				url : "${ctp}/member/refund_update",
	  				data : query,
	  				success : function(res) {
	  					if(res == 1){
	  						modal_close();
		  					$('#bank_account').load(location.href+' #bank_account');
	  					}
	  					else alert("환불계좌 업데이트중 오류가 발생하였습니다.\n다시 입력해주세요!");
	  				},
	  				error : function() {
	  					alert("전송 오류 발생!");
	  				}
	  			});
  			}
  			else {
  				alert("환불 계좌의 모든 정보를 입력해주세요!");
  			}
  		}
	</script>
	<style>
		.my_info {
		    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕',Dotum,'돋움','AppleGothic','Apple SD Gothic Neo',sans-serif;
		}
		.main_bar {
			background-color: #ececec;
			padding: 10px 0px 10px 20px;
			color: #666;
			font-weight: 600;
			font-size: 0.9rem;
			border: 1px solid #ececec;
		}
		.sub_bar {
			border-bottom: 1px solid #ececec;
			font-size: 0.9rem;
			font-weight: 600;
			padding: 10px 0px;
		}
		.sub_bar div a:hover {
			text-decoration: none;
			color: #000;
		}
		.container .title_move img {
			position: relative;
			-webkit-animation: myfirst 1.5s linear 1s infinite alternate;
			animation: myfirst 1.5s linear 1s infinite alternate;
		}
		@-webkit-keyframes myfirst {
			0% {opacity: 1.0; top: 15px;}
			100% {opacity: 1.0; top: 0px;}
		}
		@keyframes myfirst {
			0% {opacity: 1.0; top: 15px;}
			100% {opacity: 1.0; top: 0px;}
		}
		.update_field {
			width: 100%;
			font-weight: 300;
			border: 1px solid #ececec;
			padding-left: 10px;
		}
		.update_refund {
			font-size: 0.9rem;
			width: 100%;
			font-weight: 300;
			border: 1px solid black;
			padding-left: 10px;
		}
		.update_field:focus, .update_refund:focus {
			outline: none;
		}
		.post_option {
			padding: 2px 0px 2px 15px;
		}
		select {
			font-weight: 300;
		}
		.radio_children {
			font-weight: 600;
			font-size: 0.9rem;
		}
		.black_btn {
			background-color: #000;
			color: #fff;
			text-align: center;
			font-weight: 300;
			font-size: 0.9rem;
			width: 33%;
			height: 5vh;
		}
		.black_modal_btn {
			background-color: #000;
			color: #fff;
			text-align: center;
			font-weight: 300;
			font-size: 0.9rem;
			width: 100%;
			height: 3vh;
		}
		.black_btn:hover, .black_modal_btn:hover, .white_btn:hover, .white_modal_btn:hover {
			text-decoration: none;
			color: #aaa;
		}
		.white_btn {
			background-color: #fff;
			color: #000;
			text-align: center;
			font-weight: 300;
			font-size: 0.9rem;
			width: 33%;
			height: 5vh;
			border: 1px solid #ececec;
		}
		.white_modal_btn {
			background-color: #fff;
			color: #000;
			text-align: center;
			font-weight: 300;
			font-size: 0.9rem;
			width: 100%;
			height: 3vh;
			border: 1px solid #ececec;
		}
		.btn-modal {
			border-radius: 10px;
			border: 1px solid #ececec;
			margin-top: 5px;
			margin-bottom: 5px;
			padding: 5px;
			font-size: 0.8rem;
			background-color: #ececec;
		}
	</style>
	<style>
		/* modal style */
		#modal.modal-overlay {
            position: fixed;
            z-index: 9999;
            left: 40%;
            top: 30%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            /*background: rgba(255, 255, 255, 0.25);*/
            /*box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);*/
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            /*background: rgba( 255, 255, 0, 0.70 );*/
            background-image: url("${ctp}/images/logo3_modal.jpg");
            background-repeat: no-repeat;
            box-shadow: 0 8px 32px 0 rgba( 0, 0, 0, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: black;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: black;
        }
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: black;
        }
        #modal .modal-overlay {
        	display: none;
        }
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div class="container my_info">
		<form name="member_update_form" method="post">
			<p><br/></p>
			<div class="mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 5vw;" class="logo_img"/></div>
			<div class="row mb-3"><span style="margin: 0 auto;">회원 정보 수정</span></div>
			<div class="row main_bar">회원인증</div>
			<div class="row sub_bar mb-2"><div class="col-2">인증여부</div><div class="col"><c:if test="${vo.member_certification == 'N'}"><a href="${ctp}/" style="color: red; font-weight: 800;">미인증</a></c:if><c:if test="${vo.member_certification == 'Y'}"><font color="blue" style="font-weight: 800;">인증</font></c:if></div></div>
			<c:if test="${vo.member_certification == 'N'}">
				<div class="row sub_bar mb-2">
					<div class="col-2">회원인증</div>
					<div class="col"><a href="${ctp}/member/email_certification" style="font-weight: 600;">이메일 인증하기&nbsp;<i class="fa fa-envelope-o" aria-hidden="true"></i></a><br/><span style="color: #aaa; font-size: 0.7rem;">- 기본정보 > 이메일 항목에 입력하신 정보로 회원가입 후에 입력하신 이메일 주소로 인증코드 메일이 발송되었으니, 확인해주시기 바랍니다.</span></div>
				</div>
			</c:if>
			<div class="row main_bar"><div class="col-11 text-left pl-0">기본정보</div><div class="col text-right"><font color="blue">*</font>&nbsp;<font style="font-size: 0.8rem; font-weight: 300;">필수</font></div></div>
			<div class="row sub_bar">
				<div class="col-2">아이디 <font color="blue">*</font></div>
				<div class="col"><input type="text" id="member_mid" name="member_mid" value="${vo.member_mid}" required readonly class="update_field" /></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">현재 비밀번호 </div>
				<div class="col"><input type="password" id="member_pwd" name="member_pwd" class="update_field" /><br/><span style="color: #aaa; font-weight: 300; font-size: 0.8rem;">- (1개 이상 문자, 특수문자, 숫자 포함 최소 8자 이상)</span><div id="beforePwdComent"></div></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">새 비밀번호 </div>
				<div class="col"><input type="password" id="member_new_pwd" name="member_new_pwd" class="update_field" /><br/><span style="color: #aaa; font-weight: 300; font-size: 0.8rem;">- (1개 이상 문자, 특수문자, 숫자 포함 최소 8자 이상)</span><div id="pwdComent"></div></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">새 비밀번호 확인 </div>
				<div class="col"><input type="password" id="member_new_pwd2" name="member_new_pwd2" class="update_field" /><div id="pwdCheckComent"></div></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">이름 <font color="blue">*</font></div>
				<div class="col"><input type="text" id="member_name" name="member_name" value="${vo.member_name}" required class="update_field" /></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">주소 <font color="blue">*</font></div>
				<div class="col">
					<div class="row"><div class="col-2"><input type="text" name="postcode" id="sample6_postcode" value="${member_address1}" placeholder="우편번호" required readonly class="update_field" /></div><div class="col-2"><a href="javascript:sample6_execDaumPostcode()" style="margin: 0px;"><img src="${ctp}/images/search_top_btn.png" style="height: 2vh;"/></a></div></div>
					<div class="row post_option"><input type="text" name="roadAddress" id="sample6_address" size="50" value="${member_address2}" placeholder="주소" class="update_field" readonly /></div>
					<div class="row post_option"><input type="text" name="detailAddress" id="sample6_detailAddress" value="${member_address3}" placeholder="상세주소" class="update_field" /></div>
					<div class="row post_option"><input type="text" name="extraAddress" id="sample6_extraAddress" value="${member_address4}" placeholder="참고항목" class="update_field" /></div>
				</div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">일반전화</div>
				<div class="col">
					<select id="member_tel1" name="member_tel1" class="update_field" style="width: 30%;">
						<option value="02" ${member_tel1 == '02' ? 'selected' : ''}>02</option>
						<option value="031" ${member_tel1 == '031' ? 'selected' : ''}>031</option>
						<option value="032" ${member_tel1 == '032' ? 'selected' : ''}>032</option>
						<option value="033" ${member_tel1 == '033' ? 'selected' : ''}>033</option>
						<option value="041" ${member_tel1 == '041' ? 'selected' : ''}>041</option>
						<option value="042" ${member_tel1 == '042' ? 'selected' : ''}>042</option>
						<option value="043" ${member_tel1 == '043' ? 'selected' : ''}>043</option>
						<option value="044" ${member_tel1 == '044' ? 'selected' : ''}>044</option>
						<option value="051" ${member_tel1 == '051' ? 'selected' : ''}>051</option>
						<option value="052" ${member_tel1 == '052' ? 'selected' : ''}>052</option>
						<option value="053" ${member_tel1 == '053' ? 'selected' : ''}>053</option>
						<option value="054" ${member_tel1 == '054' ? 'selected' : ''}>054</option>
						<option value="055" ${member_tel1 == '055' ? 'selected' : ''}>055</option>
						<option value="061" ${member_tel1 == '061' ? 'selected' : ''}>061</option>
						<option value="062" ${member_tel1 == '062' ? 'selected' : ''}>062</option>
						<option value="063" ${member_tel1 == '063' ? 'selected' : ''}>063</option>
						<option value="064" ${member_tel1 == '064' ? 'selected' : ''}>064</option>
						<option value="070" ${member_tel1 == '070' ? 'selected' : ''}>070</option>
					</select>
					<span>-</span>
					<input type="text" id="member_tel2" name="member_tel2" value="${member_tel2}" class="update_field" style="width: 32%;"/>
					<span>-</span>
					<input type="text" id="member_tel3" name="member_tel3" value="${member_tel3}" class="update_field" style="width: 33%;"/>
				</div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">휴대전화 <font color="blue">*</font></div>
				<div class="col">
					<select id="member_phone1" name="member_phone1" class="update_field" style="width: 30%;">
						<option value="010" ${member_phone1 == '010' ? 'selected' : ''}>010</option>
						<option value="011" ${member_phone1 == '011' ? 'selected' : ''}>011</option>
						<option value="016" ${member_phone1 == '016' ? 'selected' : ''}>016</option>
						<option value="017" ${member_phone1 == '017' ? 'selected' : ''}>017</option>
						<option value="018" ${member_phone1 == '018' ? 'selected' : ''}>018</option>
						<option value="019" ${member_phone1 == '019' ? 'selected' : ''}>019</option>
					</select>
					<span>-</span>
					<input type="text" id="member_phone2" name="member_phone2" value="${member_phone2}" class="update_field" style="width: 32%;"/>
					<span>-</span>
					<input type="text" id="member_phone3" name="member_phone3" value="${member_phone3}" class="update_field" style="width: 33%;"/>
				</div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">SMS 수신여부 <font color="blue">*</font></div>
				<div class="col"><input type="radio" id="member_sms_yes" name="member_sms_check" value="Y" ${vo.member_sms_check == 'Y' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신함</span>&nbsp;<input type="radio" id="member_sms_no" name="member_sms_check" value="N" ${vo.member_sms_check == 'N' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신안함</span></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">이메일 <font color="blue">*</font></div>
				<div class="col">
					<input type="text" id="member_email1" name="member_eamil1" value="${member_email1}" class="update_field" style="width: 48%;" readonly />
					<span>&nbsp;@&nbsp;</span>
					<select name="member_email2" id="member_email2" class="update_field" style="width: 48%;" disabled>
					    <option value="naver.com" ${member_email2 == 'naver.com' ? 'selected' : ''}>naver.com</option>
					    <option value="hanmail.net" ${member_email2 == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
					    <option value="hotmail.com" ${member_email2 == 'hotmail.com' ? 'selected' : ''}>hotmail.com</option>
					    <option value="gmail.com" ${member_email2 == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
					    <option value="nate.com" ${member_email2 == 'nate.com' ? 'selected' : ''}>nate.com</option>
					    <option value="yahoo.com" ${member_email2 == 'yahoo.com' ? 'selected' : ''}>yahoo.com</option>
					    <option value="korea.com" ${member_email2 == 'korea.com' ? 'selected' : ''}>korea.com</option>
				  </select>
				</div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">이메일 수신여부 <font color="blue">*</font></div>
				<div class="col"><input type="radio" id="member_email_yes" name="member_email_check" value="Y" ${vo.member_email_check == 'Y' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신함</span>&nbsp;<input type="radio" id="member_email_no" name="member_email_check" value="N" ${vo.member_email_check == 'N' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신안함</span></div>
			</div>
			<div class="row main_bar mt-2">추가정보</div>
			<div class="row sub_bar">
				<div class="col-2">생년월일</div>
				<div class="col"><input type="date" name="member_birthday" id="member_birthday" value="${vo.member_birthday}" class="update_field" value="<%=java.time.LocalDate.now() %>" style="width: 20%;"/></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">자동차</div>
				<div class="col">
					<select id="member_car" name="member_car" class="update_field">
						<option value="없음" ${vo.member_car == null ? 'selected' : ''}>선택</option>
						<option value="없음" ${vo.member_car == '없음' ? 'selected' : ''}>없음</option>
						<option value="1000cc 이하" ${vo.member_car == '1000cc 이하' ? 'selected' : ''}>1000cc 이하</option>
						<option value="1000cc ~ 1500cc" ${vo.member_car == '1000cc ~ 1500cc' ? 'selected' : ''}>1000cc ~ 1500cc</option>
						<option value="1500cc ~ 2000cc" ${vo.member_car == '1500cc ~ 2000cc' ? 'selected' : ''}>1500cc ~ 2000cc</option>
						<option value="2000cc ~ 3000cc" ${vo.member_car == '2000cc ~ 3000cc' ? 'selected' : ''}>2000cc ~ 3000cc</option>
						<option value="3000cc ~ 4000cc" ${vo.member_car == '3000cc ~ 4000cc' ? 'selected' : ''}>3000cc ~ 4000cc</option>
						<option value="4000cc 이상" ${vo.member_car == '4000cc 이상' ? 'selected' : ''}>4000cc 이상</option>
					</select>
				</div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">모터사이클</div>
				<div class="col"><input type="text" id="member_motorcycle" name="member_motorcycle" value="${vo.member_motorcycle}" class="update_field" /></div>
			</div>
			<div class="row main_bar mt-2">환불계좌</div>
			<div class="row sub_bar">
				<div class="col-2">계좌정보</div>
				<div class="col">
					<span id="bank_account"><c:if test="${vo.member_refund_bank != null}"><span>[${vo.member_refund_bank}] ${vo.member_refund_number} 예금주: ${vo.member_refund_name}</span></c:if></span><br/>
					<input type="button" id="btn-modal" name="btn-modal" value="환불계좌변경" class="btn-modal" />
				</div>
			</div>
			<div class="row mt-2">
				<div class="col" style="margin: 0 auto;">
					<input type="button" value="회원정보수정" onclick="member_update();" class="black_btn" />
					<input type="button" value="회원탈퇴" onclick="" class="black_btn" />
					<input type="button" value="취소" onclick="location.href='${ctp}/';" class="white_btn" />
				</div>
			</div>
			<input type="hidden" id="member_tel" name="member_tel" value="" />
			<input type="hidden" id="member_phone" name="member_phone" value="" />
			<input type="hidden" id="member_address" name="member_address" value="" />
			<input type="hidden" id="pwd_change_sw" name="pwd_change_sw" value="" />
			<input type="hidden" id="member_idx" name="member_idx" value="${vo.member_idx}" />
		</form>
		<form name="modal-form" method="post">
			<div id="modal" class="modal-overlay">
        		<div class="modal-window">
            		<div class="title">
                		<h2>환불계좌변경</h2>
            		</div>
          			<div class="close-area">X</div>
		            <div class="content">
		                <div class="row mb-2">
		                	<div class="col-3"><font style="font-size: 0.9rem;">은행명</font></div>
		                	<div class="col"><input type="text" id="member_refund_bank" name="member_refund_bank" value="${vo.member_refund_bank}" class="update_refund"/></div>
	                	</div>
		                <div class="row mb-2">
		                	<div class="col-3"><font style="font-size: 0.9rem;">계좌번호</font></div>
		                	<div class="col"><input type="text" id="member_refund_number" name="member_refund_number" value="${vo.member_refund_number}" class="update_refund"/></div>
	                	</div>
		                <div class="row">
		                	<div class="col-3"><font style="font-size: 0.9rem;">예금주</font></div>
		                	<div class="col"><input type="text" id="member_refund_name" name="member_refund_name" value="${vo.member_refund_name}" class="update_refund"/></div>
	                	</div>
	                	<div class="row" style="margin-top: 270px;">
	                		<div class="col"><input type="button" value="등록" onclick="refund_update();" class="black_modal_btn" /></div>
	                		<div class="col"><input type="button" value="취소" onclick="modal_close();" class="white_modal_btn" /></div>
	                	</div>
		            </div>
        		</div>
  			</div>
		</form>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<script>
		'use strict';
		
		const modal = document.getElementById("modal");
		
		function modalOn() {
		    modal.style.display = "flex"
		}
		
		function isModalOn() {
		    return modal.style.display === "flex"
		}
		
		function modalOff() {
		    modal.style.display = "none"
		}
		
		const btnModal = document.getElementById("btn-modal")
		btnModal.addEventListener("click", e => {
		    modalOn()
		})
		
		const closeBtn = modal.querySelector(".close-area")
		closeBtn.addEventListener("click", e => {
		    modalOff()
		})
		
		modal.addEventListener("click", e => {
		    const evTarget = e.target
		    if(evTarget.classList.contains("modal-overlay")) {
		        modalOff()
		    }
		})
		window.addEventListener("keyup", e => {
		    if(isModalOn() && e.key === "Escape") {
		        modalOff()
		    }
		})
	</script>
</body>
</html>