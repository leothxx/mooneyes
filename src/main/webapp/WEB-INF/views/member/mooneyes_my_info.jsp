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
  		$(function(){
  			modal.style.display = "none";
  			
  			if($(window).scrollTop() + $(window).height() == $(document).height()) {
	  			modal.style.display = "none";
  		    }
  		});
  		
  		function modal_close() {
  			modal.style.display = "none";
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
			border: 1px solid #ececec;
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
				<div class="col"><input type="text" id="member_mid" name="member_mid" value="${vo.member_mid}" required class="update_field" /></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">현재 비밀번호 </div>
				<div class="col"><input type="password" id="member_pwd" name="member_pwd" class="update_field" /><br/><span style="color: #aaa; font-weight: 300; font-size: 0.8rem;">- (1개 이상 문자, 특수문자, 숫자 포함 최소 8자 이상)</span></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">새 비밀번호 </div>
				<div class="col"><input type="password" id="member_new_pwd" name="member_new_pwd" class="update_field" /><br/><span style="color: #aaa; font-weight: 300; font-size: 0.8rem;">- (1개 이상 문자, 특수문자, 숫자 포함 최소 8자 이상)</span></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">새 비밀번호 확인 </div>
				<div class="col"><input type="password" id="member_new_pwd2" name="member_new_pwd2" class="update_field" /></div>
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
						<option value="02" ${member_tel1 == '02' ? 'checked' : ''}>02</option>
						<option value="031" ${member_tel1 == '031' ? 'checked' : ''}>031</option>
						<option value="032" ${member_tel1 == '032' ? 'checked' : ''}>032</option>
						<option value="033" ${member_tel1 == '033' ? 'checked' : ''}>033</option>
						<option value="041" ${member_tel1 == '041' ? 'checked' : ''}>041</option>
						<option value="042" ${member_tel1 == '042' ? 'checked' : ''}>042</option>
						<option value="043" ${member_tel1 == '043' ? 'checked' : ''}>043</option>
						<option value="044" ${member_tel1 == '044' ? 'checked' : ''}>044</option>
						<option value="051" ${member_tel1 == '051' ? 'checked' : ''}>051</option>
						<option value="052" ${member_tel1 == '052' ? 'checked' : ''}>052</option>
						<option value="053" ${member_tel1 == '053' ? 'checked' : ''}>053</option>
						<option value="054" ${member_tel1 == '054' ? 'checked' : ''}>054</option>
						<option value="055" ${member_tel1 == '055' ? 'checked' : ''}>055</option>
						<option value="061" ${member_tel1 == '061' ? 'checked' : ''}>061</option>
						<option value="062" ${member_tel1 == '062' ? 'checked' : ''}>062</option>
						<option value="063" ${member_tel1 == '063' ? 'checked' : ''}>063</option>
						<option value="064" ${member_tel1 == '064' ? 'checked' : ''}>064</option>
						<option value="070" ${member_tel1 == '070' ? 'checked' : ''}>070</option>
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
						<option value="010" ${member_phone1 == '010' ? 'checked' : ''}>010</option>
						<option value="011" ${member_phone1 == '011' ? 'checked' : ''}>011</option>
						<option value="016" ${member_phone1 == '016' ? 'checked' : ''}>016</option>
						<option value="017" ${member_phone1 == '017' ? 'checked' : ''}>017</option>
						<option value="018" ${member_phone1 == '018' ? 'checked' : ''}>018</option>
						<option value="019" ${member_phone1 == '019' ? 'checked' : ''}>019</option>
					</select>
					<span>-</span>
					<input type="text" id="member_phone2" name="member_phone2" value="${member_phone2}" class="update_field" style="width: 32%;"/>
					<span>-</span>
					<input type="text" id="member_phone3" name="member_phone3" value="${member_phone3}" class="update_field" style="width: 33%;"/>
				</div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">SMS 수신여부 <font color="blue">*</font></div>
				<div class="col"><input type="radio" id="member_sms_yes" name="member_sms_check" ${vo.member_sms_check == 'Y' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신함</span>&nbsp;<input type="radio" id="member_sms_no" name="member_sms_check" ${vo.member_sms_check == 'N' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신안함</span></div>
			</div>
			<div class="row sub_bar">
				<div class="col-2">이메일 <font color="blue">*</font></div>
				<div class="col">
					<input type="text" id="member_email1" name="member_eamil1" value="${member_email1}" class="update_field" style="width: 48%;" />
					<span>&nbsp;@&nbsp;</span>
					<select name="member_email2" id="member_email2" class="update_field" style="width: 48%;">
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
				<div class="col"><input type="radio" id="member_email_yes" name="member_email_check" ${vo.member_email_check == 'Y' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신함</span>&nbsp;<input type="radio" id="member_email_no" name="member_email_check" ${vo.member_email_check == 'N' ? 'checked' : '' }/>&nbsp;<span class="radio_children">수신안함</span></div>
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
						<option value="없음" ${vo.member_car == null ? 'cheked' : ''}>선택</option>
						<option value="없음" ${vo.member_car == '없음' ? 'cheked' : ''}>없음</option>
						<option value="1000cc 이하" ${vo.member_car == '1000cc 이하' ? 'cheked' : ''}>1000cc 이하</option>
						<option value="1000cc ~ 1500cc" ${vo.member_car == '1000cc ~ 1500cc' ? 'cheked' : ''}>1000cc ~ 1500cc</option>
						<option value="1500cc ~ 2000cc" ${vo.member_car == '1500cc ~ 2000cc' ? 'cheked' : ''}>1500cc ~ 2000cc</option>
						<option value="2000cc ~ 3000cc" ${vo.member_car == '2000cc ~ 3000cc' ? 'cheked' : ''}>2000cc ~ 3000cc</option>
						<option value="3000cc ~ 4000cc" ${vo.member_car == '3000cc ~ 4000cc' ? 'cheked' : ''}>3000cc ~ 4000cc</option>
						<option value="4000cc 이상" ${vo.member_car == '4000cc 이상' ? 'cheked' : ''}>4000cc 이상</option>
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
				<div class="col"><input type="button" id="btn-modal" name="btn-modal" value="환불계좌변경" /></div>
			</div>
			<div class="row mt-2">
				<div class="col" style="margin: 0 auto;">
					<input type="button" value="회원정보수정" onclick="" class="black_btn" />
					<input type="button" value="회원탈퇴" onclick="" class="black_btn" />
					<input type="button" value="취소" onclick="location.href='${ctp}/';" class="white_btn" />
				</div>
			</div>
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
	                		<div class="col"><input type="button" value="등록" onclick="" class="black_modal_btn" /></div>
	                		<div class="col"><input type="button" value="취소" onclick="modal_close()" class="white_modal_btn" /></div>
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