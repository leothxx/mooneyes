<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_login.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		'use strict';
	  	window.Kakao.init("5084d80927739da624192690c9feb42c");
	  	
	  	// 엔터시 일반 로그인
	  	$(function(){
	  	  $("#sub_container").keypress(function (e) {
	          if (e.keyCode === 13) {
	        	  loginCheck();
	          }
	      });
	  	});
	  	
	  	// 일반 로그인
		function loginCheck() {
			loginForm.submit();			
		}
	  
	    // 카카오 로그인
	  	function kakaoLogin() {
	    	let member_signIp = "<%= request.getRemoteAddr() %>";
	  		window.Kakao.Auth.login({
	  			scope: 'profile_nickname, account_email',
	  			success:function(autoObj) {
	  				console.log(Kakao.Auth.getAccessToken(),"로그인 OK");
	  				console.log(autoObj);
	  				window.Kakao.API.request({
	  					url : '/v2/user/me',
	  					success:function(res) {
	  						const kakao_account = res.kakao_account;
	  						console.log(kakao_account);
	  						//alert(kakao_account.email + " / " + kakao_account.profile.nickname);
	  						location.href="${ctp}/member/kakao_login?member_name="+kakao_account.profile.nickname+"&member_email="+kakao_account.email+"&member_signIp";
	  					}
	  				});
	  			}
	  		});
	  	}
	  	
	  	// 카카오 로그아웃
	  	function kakaoLogout(kakaoKey) {
	  		// 다음에 로그인시에 동의항목 체크하고 로그인할 수 있도록 로그아웃시키기
	  		/*
				Kakao.API.request({
		      url: '/v1/user/unlink',
		    })
		    */
	  		Kakao.Auth.logout(function() {
	  			console.log(Kakao.Auth.getAccessToken(), "토큰 정보가 없습니다.(로그아웃되셨습니다.)");
	  		});
	  	}
	</script>
	<style>
		.loginForm {
			width: 20%;
		}
		input[type=text] {
			width: 100%;
			height: 4vh;
			border: 1px solid #ddd;
			font-size: 1rem;
		}
		input[type=password] {
			width: 100%;
			height: 4vh;
			border: 1px solid #ddd;
			font-size: 1rem;
		}
		input[type="checkbox"] {
		    width: 12px;
		    height: 12px;
		    border: 0;
		}
		.loginBtn {
			width: 100%;
			background-color: #000;
			color : #fff;
			font-size: 0.9rem;
			text-align: center;
		}
		.mid_save {
			margin: 4px 0px 0px 0px;
			vertical-align: middle;
		}
		.ssl img {
			margin: -4px 0px 0px 0px;
			vertical-align: middle;
		}
		.searchLine {
			font-size: 0.7rem;
			color: #888;
			font-weight: 800;
			text-align: center;
			padding: 10px;
		}
		.searchLine div a:hover {
			text-decoration: none;
			color: #888;
		}
		.snsLogin .btnKakao {
		    display: block;
		    border: 0;
		    border-radius: 2px;
		    font-size: 0.9rem;
		    color: #3c1e1e;
		    text-align: center;
		    height: 34px;
		    line-height: 33px;
		    padding: 0 0 0 45px;
		    background: #ffeb00 url(//img.echosting.cafe24.com/skin/mobile/member/ico_btn_kakao.png) no-repeat 11px 1px;
		    background-size: auto 33px;
		    -moz-box-sizing: border-box;
		    box-sizing: border-box;
		}
		.snsLogin .btnKakao:hover {
			text-decoration: none;
		    color: #3c1e1e;
		}
		#sub_container .title_move img {
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
		#member_mid:focus, #member_pwd:focus {
			outline: none;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div class="container loginForm">
		<p><br/><br/><br/><br/><br/><br/></p>
		<div id="sub_container" class="p-5">
			<form name="loginForm" method="post">
				<div class="mb-3 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 7vw;" class="logo_img"/></div>
				<div class="row mb-2"><input type="text" id="member_mid" name="member_mid" value="${mid}" placeholder="아이디" autofocus required style="padding-left: 10px;"/></div>
				<div class="row mb-2"><input type="password" id="member_pwd" name="member_pwd" placeholder="패스워드" required style="padding-left: 10px;"/></div>
				<div class="row mb-2" style="height: 3vh; padding: 5px;">
					<input type="checkbox" id="mid_save" name="mid_save" ${mid != null ? 'checked' : ''} class="mid_save" />&nbsp;
					<label for="mid_save" style="font-size: 0.9rem; font-weight: 600;">아이디 저장<div class="ssl" style="display: inline-block;">&nbsp;<img src="//img.echosting.cafe24.com/skin/mobile_ko_KR/member/ico_ssl.png" alt="보안접속" height="15vh"></div></label>
				</div>
				<div class="row"><input type="button" value="로그인" onclick="loginCheck()" class="loginBtn"/></div>
				<div class="row searchLine">
					<div class="col" style="border-right: 1px solid black; padding: 0px;"><a href="${ctp}/member/member_idSearch">아이디찾기</a></div>
					<div class="col" style="border-right: 1px solid black; padding: 0px;"><a href="${ctp}/member/member_pwdSearch">비밀번호찾기</a></div>
					<div class="col" style="padding: 0px;"><a href="${ctp}/member/join">회원가입</a></div>
				</div>
				<div class="snsLogin" style="margin-bottom: 200px;">
					<a href="javascript:kakaoLogin()" class="btnKakao" ><span style="font-size:0.9rem;">카카오계정 로그인</span></a>
				</div>
				<input type="hidden" id="member_visitIp" name="member_visitIp" value="${pageContext.request.remoteAddr}" />
			</form>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>