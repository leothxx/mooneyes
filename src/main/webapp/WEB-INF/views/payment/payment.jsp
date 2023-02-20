`<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>payment.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/postcode.js"></script>
	<style>
		.payment_view {
			font-size: 1rem;
			font-family: 'NotoSansKR',"맑은 고딕",Malgun Gothic,AppleSDGothicNeo,"돋움",Dotum,sans-serif;
		}
		.payment-title {
		    position: relative;
		    color: #fff;
		    font-size: 20px;
		    font-weight: 700;
		    text-align: center;
		    border: 1px solid #D7D7D7;
		    border-right: 0px;
		    border-left: 0px;
		    background: #595959;
		}
		.payment_top_view, .delivery-view, .plus-input-view, .order-view, .point-view, .payment-info-view, .payment-method-view {
			background: #fff;
		}
		.payment input[type="radio"] {
		    margin: 0;
		    width: 22px;
		    height: 22px;
		    border: 0;
		    vertical-align: text-top;
		    cursor: pointer;
		    background: url(//img.echosting.cafe24.com/skin/mobile/common/bg_newRadio.png) no-repeat 0 0;
		    background-size: 22px 22px;
		    -webkit-appearance: none;
		}
		.payment input:not(:disabled):checked[type="radio"] {
		    background-image: url(//img.echosting.cafe24.com/skin/mobile/common/bg_newRadio_checked.png);
		    -webkit-appearance: none;
		}
		.payment input[type="checkbox"] {
		    margin: 0;
		    width: 20px;
		    height: 20px;
		    border: 0;
	     	vertical-align: text-top;
		    cursor: pointer;
		    background: url(//img.echosting.cafe24.com/skin/mobile/common/bg_newCheckbox.png) no-repeat 0 0;
		    background-size: 20px 20px;
		    -webkit-appearance: none;
		    margin-bottom: 1px;
		}
		input:not(:disabled):checked[type="checkbox"] {
		    background-image: url(//img.echosting.cafe24.com/skin/mobile/common/bg_newCheckbox_checked.png);
		    -webkit-appearance: none;
		}
		.payment_view label {
			vertical-align: -1px;
		}
		.payment-form {
			width: 100%;
			border: 1px solid #ececec;
			padding: 10px 0px 10px 10px;
		}
		.payment-form:focus {
			outline: none;
		}
		.payment-table-name {
			padding: 10px 0px 10px 30px;
		}
		.payment .payment_top_view .count {
		    overflow: hidden;
		    position: absolute;
		    right: 50px;
		    top: 2px;
		    min-width: 10px;
		    padding: 0 2px;
		    height: 14px;
		    border-radius: 14px;
		    font-weight: bold;
		    font-size: 9px;
		    line-height: 13px;
		    color: #fff;
		    text-align: center;
		    background: #ff0000;
		}
		.product_delete_btn_css {
			padding: 2px 5px;
			border: 1px solid #b5b5b5;
			color : #b5b5b5;
			font-size: 1.2rem;
		}
		.product_delete_btn_css:hover {
			text-decoration: none;
			color : #b5b5b5;
		}
		.product_view_name {
			font-size: 0.9rem;
			color: #000;
			font-weight: 700;
		}
		.product_view_option, .product_view_count {
			color: #999;
			font-size: 0.9rem;
			font-weight: 500;
		}
		.product_view_price {
			color: #000;
			font-size: 0.9rem;
			font-weight: 700;
		}
		.payment-point-all-btn {
			color: #000;
			border: 1px solid #b5b5b5;
			background-color: #fff;
			padding: 10px;
		}
		.payment_member_point {
			color: #3971FF;
		}
	</style>
</head>
<body>
	<div class="payment" style="width: 100%; margin: 0 auto;">
		<div class="payment_view" style="width: 50%; margin: 0 auto; background-color: #ededed; border: 1px solid #ccc;">
			<div class="row payment_top_view" style="padding: 15px 10px; width:100%; margin: 0 auto;">
				<div class="col-2"><a href=""><img src="${ctp}/images/left_arrow_icon.png" width="25px"/></a></div>
				<div class="col text-center" style="font-size: 1.2rem;"><b>문아이즈 KOREA</b></div>
				<div class="col-2 text-right"><a href=""><img src="${ctp}/images/bag-icon.png" width="25px"/><span class="count EC-Layout_Basket-count-display"><span class="EC-Layout-Basket-count">3</span></span></a>&nbsp;&nbsp;<a href=""><img src="${ctp}/images/account-icon.png" width="25px"/></a></div>
			</div>
			<div class="row" style="width: 100%; margin: 0 auto;">
				<div class="col payment-title" style="padding: 15px;">주문/결제</div>
			</div>
			<div class="mt-3"></div>
			<div class="delivery-view" style="padding: 10px;">
				<div class="row mb-3"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>배송지</b></div></div>
				<div class="row">
					<div class="col text-left" style="padding: 0px 0px 0px 30px;">
						<input type="radio" id="member_delivery" name="delivery" />
						<label for="member_delivery">회원 정보와 동일</label>&nbsp;&nbsp;
						<input type="radio" id="new_delivery" name="delivery" checked/>
						<label for="new_delivery">새로운 배송지</label>
					</div>
				</div>
				<div class="row mt-3 mb-4">
					<div class="col-2 payment-table-name">받는사람&nbsp;<font color='blue'>*</font></div>
					<div class="col"><input type="text" id="buyer_name" name="buyer_name" required autofocus class="payment-form"/></div>
				</div>
				<div class="row mb-2">
					<div class="col-2 payment-table-name">주소&nbsp;<font color='blue'>*</font></div>
					<div class="col-3 pr-1"><input type="text" name="postcode" id="sample6_postcode" value="${member_address1}" placeholder="우편번호" required readonly class="payment-form" /></div>
					<div class="col-2 p-0"><a href="javascript:sample6_execDaumPostcode()" style="margin: 0px; vertical-align: -10px;"><img src="${ctp}/images/search_top_btn.png" style="width:20px;"/></a></div>
				</div>
				<div class="row mb-2">
					<div class="col-2 payment-table-name"></div>
					<div class="col"><input type="text" name="roadAddress" id="sample6_address" size="50" value="" placeholder="주소" class="payment-form" readonly /></div>
				</div>
				<div class="row mb-2">
					<div class="col-2 payment-table-name"></div>
					<div class="col"><input type="text" name="detailAddress" id="sample6_detailAddress" value="" placeholder="상세주소" class="payment-form" /></div>
				</div>
				<div class="row mb-4">
					<div class="col-2 payment-table-name"></div>
					<div class="col"><input type="text" name="extraAddress" id="sample6_extraAddress" value="" placeholder="참고항목" class="payment-form" /></div>
				</div>
				<div class="row mb-4">
					<div class="col-2 payment-table-name">휴대전화&nbsp;<font color='blue'>*</font></div>
					<div class="col">
						<select id="buyer_tel1" name="buyer_tel1" class="payment-form" style="width: 30%;">
							<option value="010" ${member_phone1 == '010' ? 'selected' : ''}>010</option>
							<option value="011" ${member_phone1 == '011' ? 'selected' : ''}>011</option>
							<option value="016" ${member_phone1 == '016' ? 'selected' : ''}>016</option>
							<option value="017" ${member_phone1 == '017' ? 'selected' : ''}>017</option>
							<option value="018" ${member_phone1 == '018' ? 'selected' : ''}>018</option>
							<option value="019" ${member_phone1 == '019' ? 'selected' : ''}>019</option>
						</select>
						<span>-</span>
						<input type="text" id="buyer_tel2" name="buyer_tel2" class="payment-form" style="width: 32%;"/>
						<span>-</span>
						<input type="text" id="buyer_tel3" name="buyer_tel3" class="payment-form" style="width: 33%;"/>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-2 payment-table-name">이메일&nbsp;<font color='blue'>*</font></div>
					<div class="col">
						<input type="text" id="buyer_email1" name="buyer_email1" value="${member_email1}" class="payment-form" style="width: 48%;" readonly />
						<span>@</span>
						<select name="buyer_email2" id="buyer_email2" class="payment-form" style="width: 48%;">
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
				<div class="row mb-4" style="padding-bottom: 10px; border-bottom: 1px solid #ececec;">
					<div class="col-2"></div>
					<div class="col" style="font-size: 0.8rem; color: #999; font-weight: 600;">이메일로 주문 처리 과정을 보내드립니다.<br/>수신 가능한 이메일 주소를 입력해 주세요.</div>
				</div>
				<div class="row mb-4">
					<div class="col">
						<select name="delivery_msg" id="delivery_msg" class="payment-form" style="padding: 5px 0px 5px 10px;">
							<option value="" selected>-- 메세지 선택 (선택사항) --</option>
							<option value="배송 전에 미리 연락 바랍니다.">배송 전에 미리 연락 바랍니다.</option>
							<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
							<option value="부재시 문 앞에 놓아주세요.">부재시 문 앞에 놓아주세요.</option>
							<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
							<option value="택배함에 보관해 주세요.">택배함에 보관해 주세요.</option>
							<option value="직접 입력">직접 입력</option>
						</select>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col"><input type="checkbox" id="normal_delivery_address_save" name="normal_delivery_address_save"/>&nbsp;<label for="normal_delivery_address_save">기본 배송지로 저장</label></div>
				</div>
			</div>
			<div class="mt-3"></div>
			<div class="plus-input-view" style="padding: 10px;">
				<div class="row mb-4"><div class="col text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>추가입력(선택사항)</b></div></div>
				<div class="row mb-3">
					<div class="col-2 payment-table-name">기타 문의사항</div>
					<div class="col"><textarea id="question" name="question" fw-filter="" fw-label="기타문의사항" fw-msg="" maxlength="255" cols="70" class="payment-form"></textarea><br/><span style="font-size: 0.8rem;">CUSTOMER Q&A<font color='gray'>에 자동 저장됩니다.</font></span></span></div>
				</div>
				<div class="row mb-4">
					<div class="col-2 payment-table-name">비밀번호</div>
					<div class="col"><input type="password" id="question_pwd" name="question_pwd" class="payment-form"/><br/><span style="font-size: 0.8rem; color: #666;">영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자</span></div>
				</div>
			</div>
			<div class="mt-3"></div>
			<div class="order-view" style="padding: 10px;">
				<div class="row mb-3"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>주문상품</b></div></div>
				<div class="row" id="product_view_${st.index}">
					<div class="col-2"><img src="${ctp}/images/" width="30px" /></div>
					<div class="col">
						<span class="product_view_name"><span id="product_view_name_${st.index}">${vo.product_name}</span></span><br/>
						<span class="product_view_option">[옵션:<span id="product_view_option_color_${st.index}">${vo.product_color}</span>/<span id="product_view_option_size_${st.index}">${vo.product_size}</span>]</span><br/>
						<span class="product_view_count">수량: <span id="product_view_count_${st.index}">${vo.product_count}</span>개</span><br/>
						<span class="product_view_price">
							<c:if test="${vo.product_sale_price == 0}">
								<span id="product_view_price_${st.index}"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" /></span>원
							</c:if>
							<c:if test="${vo.product_sale_price != 0}">
								<del><span id="product_view_sale_price_${st.index}" style="color: red;"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" />원</span></del>
								<span id="product_view_price_${st.index}"><fmt:formatNumber value="${vo.product_sale_price}" pattern="#,###" /></span>원
							</c:if>
						</span>
					</div>
					<div class="col-1"><a href="javascript:order_view_product_delete(${st.index})" class="product_delete_btn_css">X</a></div>
				</div>
			</div>
			<div class="row delivery-price-view" style="background: #f6f6f6;padding: 10px; width: 100%; margin: 0 auto;">
				<div class="col text-left" style="font-size: 0.9rem; color:#888;">배송비</div>
				<div class="col text-right">0(무료)원</div>
			</div>
			<div class="mt-2"></div>
			<div class="point-view" style="padding: 10px;">
				<div class="row mb-4"><div class="col-3 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>할인/부가결제</b></div></div>
				<div class="row">
					<div class="col-1 payment-table-name text-left" style="margin-right: 50px;">POINT</div>
					<div class="col-9 p-0"><input type="number" id="buyer_point" name="buyer_point" class="payment-form text-right" /></div>
					<div class="col-1 text-right" style="padding: 0px 15px 0px 0px;"><input type="button" value="전액 사용" onclick="" class="payment-point-all-btn" /></div>
				</div>
				<div class="row mt-3 mb-3">
					<div class="col text-right" style="padding-right: 25px;">
						보유잔액&nbsp;<span class="payment_member_point"><fmt:formatNumber value="${member_vo.member_point}" pattern="#,###"/>원</span>
					</div>
				</div>
				<div class="row text-left mb-4" style="background-color: #f6f6f6; font-size: 0.9rem; width:90%; margin: 0 auto;">
					<div style="width: 100%; padding: 5px 10px;">1회 구매시 POINT 최대 사용 금액은 6000원입니다.</div>
					<div style="width: 100%; padding: 0px 10px;">최소 POINT 5,000원 이상일 때 사용 가능합니다.</div>
					<div style="width: 100%; padding: 5px 10px;">POINT으로만 결제할 경우, 결제금액이 0으로 보여지는것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</div>
				</div>
			</div>
			<div class="row sale-price-view" style="background: #f6f6f6;padding: 10px; width: 100%; margin: 0 auto;">
				<div class="col text-left" style="font-size: 1.1rem; color:#000; font-weight: 800;">적용금액</div>
				<div class="col text-right" style="color: #3971FF; font-weight: 800; font-size: 1.1rem;"><span class="payment_sale_tot">-0원</span></div>
			</div>
			<div class="mt-2"></div>
			<div class="payment-info-view" style="padding: 10px;">
				<div class="row mb-3"><div class="col-3 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>결제정보</b></div></div>
				<div class="row mb-2" style="padding-left: 10px; font-size: 1rem;">
					<div class="col text-left">주문상품</div>
					<div class="col text-right" style="font-weight: 800; font-size: 1.2rem;"><span class="payment_price"></span>원</div>
				</div>
				<div class="row mb-2" style="padding-left: 10px; font-size: 1rem;">
					<div class="col text-left">배송비</div>
					<div class="col text-right" style="font-weight: 800; font-size: 1.2rem;">+<span class="payment_delivery_price"></span>원</div>
				</div>
				<div class="row mb-4" style="padding-left: 10px; font-size: 1rem;">
					<div class="col text-left">할인/부가결제</div>
					<div class="col text-right" style="font-weight: 800; font-size: 1.2rem;"><font color='red'>-<span class="payment_sale_price"></span></font>원</div>
				</div>
			</div>
			<div class="row" style="padding: 10px; background-color: #F4F7FF; font-size: 1.4rem; font-weight: 800; width:100%; margin: 0 auto;">
				<div class="col text-left">최종 결제 금액</div>
				<div class="col text-right" style="color: #3971FF;"><span class="payment_tot_price"></span>원</div>
			</div>
			<div class="mt-2"></div>
			<div class="payment-method-view" style="padding: 10px;">
				<div class="row mb-3"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>결제수단</b></div></div>
				<div class="row mb-4"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1rem;">결제수단 선택</div></div>
				<div class="radio-inner">
					<span class="ec-base-label">
						<input id="addr_paymethod0" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cash" type="radio" checked="checked" autocomplete="off" />
						<label for="addr_paymethod0"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank.gif" pay_name="무통장 입금" pay_code="cash" pay_on_img="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank.gif" pay_off_img="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank_disabled.gif" pay_on_img_width="" pay_on_img_height="" pay_off_img_width="" pay_off_img_height=""></label>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>