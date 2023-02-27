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
  	<link rel="stylesheet" href="${ctp}/resources/css/payment-view.css" />
  	<script>
  		'use strict';
  		$(function(){
  			$("#addr_paymethod1_view").hide();
  			$("#cashreceipt_Y_view").hide();
  			$("#cashreceipt_personal_view").hide();
  			$("#cashreceipt_employed_view").hide();
  			  			
  			$("#member_delivery").click(function(){
  				let member_name = '${member_vo.member_name}';
  				let member_address = '${member_vo.member_address}';
  				let member_address_arr = member_address.split("/");
  				
  				$("#buyer_name").val(member_name);
  				$("#sample6_postcode").val(member_address_arr[0]);
  				$("#sample6_address").val(member_address_arr[1]);
  				$("#sample6_detailAddress").val(member_address_arr[2]);
  				$("#sample6_extraAddress").val(member_address_arr[3]);
  			});
  			$("#new_delivery").click(function(){
  				$("#buyer_name").val("");
  				$("#sample6_postcode").val("");
  				$("#sample6_address").val("");
  				$("#sample6_detailAddress").val("");
  				$("#sample6_extraAddress").val("");
  			});
  			
  			$("#addr_paymethod0").click(function(){
  				$("#addr_paymethod_img1").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_card_disabled.gif");
  				$("#addr_paymethod_img0").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank.gif");
	  			$("#addr_paymethod1_view").hide();
	  			$("#addr_paymethod0_view").show();
  			});
  			$("#addr_paymethod1").click(function(){
  				$("#addr_paymethod_img0").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank_disabled.gif");
  				$("#addr_paymethod_img1").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_card.gif");
	  			$("#addr_paymethod0_view").hide();
	  			$("#addr_paymethod1_view").show();
  			});
  			$("#cashreceipt_Y").click(function(){
  				$("#cashreceipt_Y_view").show();
  				$("#cashreceipt_personal_view").show();
  			});
  			$("#cashreceipt_N").click(function(){
  				$("input:radio[name='cashreceipt1']:radio[value='employed']").prop("checked",false);
  				$("input:radio[name='cashreceipt1']:radio[value='personal']").prop("checked",true);
  	  			$("#cashreceipt_employed_view").hide();
  	  			$("#cashreceipt_personal_view").hide();
  				$("#cashreceipt_Y_view").hide();
  			});
  			$("#cashreceipt_personal").click(function(){
  				$("#cashreceipt_employed_view").hide();
  	  			$("#cashreceipt_personal_view").show();
  			});
  			$("#cashreceipt_employed").click(function(){
  	  			$("#cashreceipt_personal_view").hide();
  				$("#cashreceipt_employed_view").show();
  			});
  		});
  	</script>
</head>
<body>
	<div class="payment" style="width: 100%; margin: 0 auto;">
		<form name="payment_form" method="post">
			<div class="payment_view" style="width: 50%; margin: 0 auto; background-color: #ededed; border: 1px solid #ccc;">
				<div class="row payment_top_view" style="padding: 15px 10px; width:100%; margin: 0 auto;">
					<div class="col-2"><a href="javascript:history.back();"><img src="${ctp}/images/left_arrow_icon.png" width="25px"/></a></div>
					<div class="col text-center" style="font-size: 1.2rem;"><a href="${ctp}/" id="mooneyes_logo_btn"><b>문아이즈 KOREA</b></a></div>
					<div class="col-2 text-right"><a href="${ctp}/member/cart"><img src="${ctp}/images/bag-icon.png" width="25px"/><c:if test="${basket != null}"><span class="count EC-Layout_Basket-count-display"><span class="EC-Layout-Basket-count">${basket}</span></span></c:if></a>&nbsp;&nbsp;<a href="${ctp}/member/my_info?mid=${sMid}"><img src="${ctp}/images/account-icon.png" width="25px"/></a></div>
				</div>
				<div class="row" style="width: 100%; margin: 0 auto;">
					<div class="col payment-title" style="padding: 15px;">주문/결제</div>
				</div>
				<div class="mt-2"></div>
				<div class="delivery-view" style="padding: 10px;">
					<div class="row mb-3"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>배송지</b></div></div>
					<div class="row">
						<div class="col text-left" style="padding: 0px 0px 0px 30px;">
							<input type="radio" id="member_delivery" name="delivery" value="member" />
							<label for="member_delivery">회원 정보와 동일</label>&nbsp;&nbsp;
							<input type="radio" id="new_delivery" name="delivery" value="new" checked/>
							<label for="new_delivery">새로운 배송지</label>
						</div>
					</div>
					<div class="row mt-3 mb-4">
						<div class="col-2 payment-table-name">받는사람&nbsp;<font color='blue'>*</font></div>
						<div class="col"><input type="text" id="buyer_name" name="buyer_name" required autofocus class="payment-form"/></div>
					</div>
					<div class="row mb-2">
						<div class="col-2 payment-table-name">주소&nbsp;<font color='blue'>*</font></div>
						<div class="col-3 pr-1"><input type="text" name="postcode" id="sample6_postcode" value="" placeholder="우편번호" required readonly class="payment-form" /></div>
						<div class="col-2" style="padding-top: 10px;"><a href="javascript:sample6_execDaumPostcode()" style="margin: 0px; vertical-align: -10px;"><img src="${ctp}/images/search_top_btn.png" style="width:20px;"/></a></div>
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
							<input type="text" id="buyer_tel2" value="${member_phone2}" name="buyer_tel2" class="payment-form" style="width: 32%;"/>
							<span>-</span>
							<input type="text" id="buyer_tel3" value="${member_phone3}" name="buyer_tel3" class="payment-form" style="width: 33%;"/>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-2 payment-table-name">이메일&nbsp;<font color='blue'>*</font></div>
						<div class="col">
							<input type="text" id="buyer_email1" name="buyer_email1" value="${member_email1}" class="payment-form" style="width: 48%;" />
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
							</select>
						</div>
					</div>
					<!-- 
					<div class="row mb-2">
						<div class="col"><input type="checkbox" id="normal_delivery_address_save" name="normal_delivery_address_save"/>&nbsp;<label for="normal_delivery_address_save">기본 배송지로 저장</label></div>
					</div>
					-->
				</div>
				<div class="mt-2"></div>
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
				<div class="mt-2"></div>
				<div class="order-view" style="padding: 10px;">
					<div class="row mb-5 mt-2"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>주문상품</b></div></div>
					<c:forEach var="cart_vo" items="${cart_vos}" varStatus="st">
						<input type="hidden" id="cart_product_idx_${st.index}" name="cart_product_idx_${st.index}" value="${cart_vo.product_idx}" />
						<div class="row mb-4" id="product_view_${st.index}">
							<c:set var="image" value="${fn:split(cart_vo.product_fSName,'/')}"></c:set>
							<div class="col-2" style="padding: 0px 10px 0px 25px;"><img src="${ctp}/data/product/${image[0]}" width="80px" /></div>
							<div class="col" style="padding: 0px;">
								<span class="product_view_name"><span id="product_view_name_${st.index}">${cart_vo.product_name}</span></span><br/>
								<span class="product_view_option">[옵션:<span id="product_view_option_color_${st.index}">${cart_vo.product_color}</span>/<span id="product_view_option_size_${st.index}">${cart_vo.product_size}</span>]</span><br/>
								<span class="product_view_count">수량: <span id="product_view_count_${st.index}">${cart_vo.product_count}</span>개</span><br/>
								<span class="product_view_price">
									<c:if test="${cart_vo.product_sale_price == 0}">
										<span id="product_view_price_${st.index}"><fmt:formatNumber value="${cart_vo.product_price}" pattern="#,###" /></span>원
									</c:if>
									<c:if test="${cart_vo.product_sale_price != 0}">
										<del><span id="product_view_sale_price_${st.index}" style="color: red;"><fmt:formatNumber value="${cart_vo.product_price}" pattern="#,###" />원</span></del>
										<span id="product_view_price_${st.index}"><fmt:formatNumber value="${cart_vo.product_sale_price}" pattern="#,###" /></span>원
									</c:if>
								</span>
							</div>
							<%-- <div class="col-1"><a href="javascript:order_view_product_delete(${st.index})" class="product_delete_btn_css">X</a></div> --%>
						</div>
					</c:forEach>
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
						<div class="col-9 p-0"><input type="number" id="buyer_point" name="buyer_point" class="payment-form text-right" style="padding-right: 10px;" /></div>
						<div class="col-1 text-right" style="padding: 0px 15px 0px 0px;"><input type="button" value="전액 사용" onclick="point_all_select()" class="payment-point-all-btn" /></div>
					</div>
					<div class="row mt-3 mb-3">
						<div class="col text-right" style="padding-right: 25px;">
							보유잔액&nbsp;<span class="payment_member_point"><fmt:formatNumber value="${member_vo.member_point}" pattern="#,###"/>원</span>
						</div>
					</div>
					<div class="row text-left mb-4" style="background-color: #f6f6f6; font-size: 0.9rem; width:90%; margin: 0 auto;">
						<div style="width: 100%; padding: 15px 10px 5px;">1회 구매시 POINT 최대 사용 금액은 6000원입니다.</div>
						<div style="width: 100%; padding: 0px 10px;">최소 POINT 1,000원 이상일 때 사용 가능합니다.</div>
						<div style="width: 100%; padding: 5px 10px 15px;">POINT으로만 결제할 경우, 결제금액이 0으로 보여지는것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</div>
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
							<label for="addr_paymethod0"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank.gif" id="addr_paymethod_img0" pay_name="무통장 입금" pay_code="cash"></label>
						</span>
						<span class="ec-base-label">
							<input id="addr_paymethod1" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="card" type="radio" autocomplete="off" />
							<label for="addr_paymethod1"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_card_disabled.gif" id="addr_paymethod_img1" pay_name="카드 결제" pay_code="card"></label>
						</span>
					</div>
					<div id="addr_paymethod0_view" style="padding: 10px;" class="mt-3">
						<div class="row mb-2">
							<div class="col-2 text-center" style="padding-top:10px;">입금은행<font color="blue">*</font></div>
							<div class="col">
								<select id="paymethod_bank_name" name="paymethod_bank_name" class="payment-form">
									<option value="" selected>::: 선택해 주세요 :::</option>
									<option value="국민71240101603058" selected>국민은행 : 712401-01-603058 문아이즈(서하늘)</option>
								</select>
							</div>
						</div>
						<div class="row mb-4">
							<div class="col-2 text-center" style="padding-top:10px;">입금자명<font color="blue">*</font></div>
							<div class="col"><input type="text" id="paymethod_bank_buyer_name" name="paymethod_bank_buyer_name" class="payment-form" required/></div>
						</div>
						<div class="row" style="font-size: 1.1rem; padding: 10px;">
							<div class="col text-left"><b>현금영수증</b></div>
						</div>
						<div class="row mb-1" style="font-size: 1.1rem; padding: 10px;">
							<div class="col text-left">
								<input type="radio" id="cashreceipt_Y" name="cashreceipt" value="Y"/>
								<label for="cashreceipt_Y">현금영수증 신청</label>&nbsp;
								<input type="radio" id="cashreceipt_N" name="cashreceipt" value="N" checked/>
								<label for="cashreceipt_N">신청안함</label>
							</div>
						</div>
						<div id="cashreceipt_Y_view" class="row mb-1" style="padding-left: 10px;">
							<div class="col text-left">
								<input type="radio" id="cashreceipt_personal" name="cashreceipt1" value="personal"  checked/>
								<label for="cashreceipt_personal">개인</label>&nbsp;
								<input type="radio" id="cashreceipt_employed" name="cashreceipt1" value="employed"/>
								<label for="cashreceipt_employed">사업자</label>
							</div>
						</div>
						<div id="cashreceipt_personal_view" class="row mb-1" style="padding: 10px;">
							<div class="col">
								<select name="cashreceipt_personal_number1" id="cashreceipt_personal_number1" class="payment-form" style="width: 30%;">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<span>-</span>
								<input type="tel" name="cashreceipt_personal_number2" id="cashreceipt_personal_number2" class="payment-form" style="width: 30%;" required />
								<span>-</span>
								<input type="tel" name="cashreceipt_personal_number3" id="cashreceipt_personal_number3" class="payment-form" style="width: 30%;" required />
							</div>
						</div>
						<div id="cashreceipt_employed_view" class="row mb-1" style="padding: 10px;">
							<div class="col"><input type="text" id="cashreceipt_employed_number" name="cashreceipt_employed_number" class="payment-form" placeholder="사업자번호" required style="padding-left: 10px;"/></div>
						</div>
					</div>
					<div id="addr_paymethod1_view" style="padding: 10px;" class="mt-3">
						<div class="row mb-1">
							<div class="col text-left" style="color: #888;">
								- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
							</div>
						</div>
					</div>
				</div>
				<div class="mt-2"></div>
				<div class="point-information-view">
					<div class="row" style="padding: 15px;">
						<div class="col text-left" style="font-size: 1.2rem;"><b>적립 혜택</b></div>
						<div class="col text-right" style="color: blue;"><span id="payment_tot_point"></span>원 예정</div>
					</div>
				</div>
				<div class="mt-2"></div>
				<div class="payment-payment-form-view">
					<br/>
					<div class="row" style="padding: 10px 10px 20px 10px; font-size: 1rem;"><div class="col text-center"><b>주문 내용을 확인하였으며 약관에 동의합니다.</b></div></div>
				</div>
				<div class="payment-btn-view">
					<input type="button" value="원 결제하기" id="payment_btn_tot_price" class="payment-btn-css" onclick="credit(${fn:length(cart_vos)})" />
				</div>
				<div class="payment-help-view" style="padding: 15px; background-color: #FAFAFD;">
					<div class="row help-view-text">- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우<br/>장바구니에서 무이자할부 상품만 선택하여 주문해 주시기 바랍니다.</div>
					<div class="row help-view-text">- 최소 결제 가능한 금액은 결제 금액에서 배송비를 제외한 금액입니다.</div>
				</div>
			</div>
			<input type="hidden" id="order_price" name="order_price" value="" />
			<input type="hidden" id="order_tot_price" name="order_tot_price" value="" />
			<input type="hidden" id="delivery_price" name="delivery_price" value="" />
			<input type="hidden" id="order_point" name="order_point" value="" />
			<input type="hidden" id="order_option" name="order_option" value="" />
			<input type="hidden" id="order_count" name="order_count" value="" />
			<input type="hidden" id="product_idx" name="product_idx" value="" />
			<input type="hidden" id="order_tot_point" name="order_tot_point" value="" />
			<input type="hidden" id="member_cart_idx" name="member_cart_idx" value="${param.member_cart_idx}" />
		</form>
	</div>
</body>
<script>
	'use strict';
	let pwd_chk = /^(?=.[a-zA-Z])((?=.\d)|(?=.*\W)).{10,16}$/;
	let cart_vos_size = '${cart_vos_size}';
	let tot_price = 0;
	let delivery_price = 0;
	let sale_point_price = 0;
	for(let i=0; i<cart_vos_size; i++) {
		let product_view_count = $("#product_view_count_"+i).text().replaceAll(",","");
		let product_view_price = $("#product_view_price_"+i).text().replaceAll(",","");
		let product_view_sale_price = $("#product_view_sale_price_"+i).text().replaceAll(",","").replaceAll("원","");
		$("#product_view_price_"+i).text(Number(product_view_price*product_view_count).toLocaleString("ko-KR"));
		$("#product_view_sale_price_"+i).text((Number(product_view_sale_price)*Number(product_view_count)).toLocaleString("ko-KR")+"원");
		tot_price += Number(product_view_price*product_view_count);
	}
	
	if(tot_price > 50000) {
		delivery_price = 0;
		$(".payment_delivery_price").text(delivery_price);
	}
	else {
		delivery_price = 3000;
		$(".payment_delivery_price").text(delivery_price);
	}
	price_method();
	
	// 포인트 입력시
	$("#buyer_point").change(function(){
		let member_point = "${member_vo.member_point}";
		sale_point_price = $("#buyer_point").val();
		
		if(sale_point_price > Number(member_point)) {
			alert("보유하신 포인트보다 많은 포인트를 입력하셨습니다.");
			$("#buyer_point").val(0);
		}
		if(sale_point_price > 6000) {
			alert("1회 구매시 최대 사용가능한 포인트는 6,000POINT 입니다.");
			$("#buyer_point").val(0);
			sale_point_price = 0;
		}
		else if(sale_point_price < 1000) {
			alert("1회 구매시 최소 사용가능한 포인트는 1,000POINT 입니다.");
			$("#buyer_point").val(0);
			sale_point_price = 0;
		}
		$(".payment_sale_price").text(Number(sale_point_price).toLocaleString("ko-KR"));
		price_method();
	});
	
	function price_method() {
		delivery_price = $(".payment_delivery_price").text();
		sale_point_price = $("#buyer_point").val();
		
		// 주문상품 가격
		$(".payment_price").text(tot_price.toLocaleString("ko-KR"));
		// 최종 결제 금액 가격
		$(".payment_tot_price").text((Number(tot_price)+Number(delivery_price)-Number(sale_point_price)).toLocaleString("ko-KR"));
		// 결제하기 버튼 가격
		$("#payment_btn_tot_price").val((Number(tot_price)+Number(delivery_price)-Number(sale_point_price)).toLocaleString("ko-KR")+"원 결제하기");
		//적립 예정금
		$("#payment_tot_point").text((Number(tot_price * 0.01)).toLocaleString("ko-KR"));
	};
	
	// 포인트 전액 사용 클릭시
	function point_all_select() {
		let member_point = "${member_vo.member_point}";
		sale_point_price = $("#buyer_point").val();
		
		if(Number(member_point) > 1000) {
			if(Number(member_point) > 6000) {
				alert("1회 구매시 최대 사용가능한 포인트는 6,000POINT 입니다.");
				$("#buyer_point").val(6000);
				$(".payment_sale_price").text("6000");
			}
			else {
				$("#buyer_point").val(member_point);
				$(".payment_sale_price").text(member_point);
			}
		}
		else {
			alert("1회 구매시 최소 사용가능한 포인트는 1,000POINT 입니다.\n현재 보유하신 포인트가 부족합니다.");
			$("#buyer_point").val(0);
		}
		price_method();
	}
	
	// 결제 버튼 클릭!!
	function credit(size) {
		if($("#buyer_point").val() == "") {
			$("#buyer_point").val(0);
		}
		// 구매자 이름
		let buyer_name = $("#buyer_name").val();
		// 구매자 배송지 주소
		let buyer_address1 = $("#sample6_postcode").val();
		let buyer_address2 = $("#sample6_address").val();
		let buyer_address3 = $("#sample6_detailAddress").val();
		let buyer_address4 = $("#sample6_extraAddress").val();
		
		// 구매 수단
		let addr_paymethod = $("input:radio[name=addr_paymethod]:checked").val();
		// 현금영수증 여부
		let cashreceipt = $("input:radio[name=cashreceipt]:checked").val();
		// 현금영수증 개인,사업자 여부
		let cashreceipt1 = $("input:radio[name=cashreceipt1]:checked").val();
		
		// 문의사항 
		let question = $("#question").val();
		let question_pwd = $("#question_pwd").val();
		
		// 현금 영수증 개인 전화번호
		let cashreceipt_personal_number1 = $("#cashreceipt_personal_number1").val();
		let cashreceipt_personal_number2 = $("#cashreceipt_personal_number2").val();
		let cashreceipt_personal_number3 = $("#cashreceipt_personal_number3").val();
		
		// 현금 영수증 사업자번호
		let cashreceipt_employed_number = $("#cashreceipt_employed_number").val();
		
		// 구매자 휴대전화번호
		let buyer_phone1 = $("#buyer_tel1").val();
		let buyer_phone2 = $("#buyer_tel2").val();
		let buyer_phone3 = $("#buyer_tel3").val();
		// 구매자 이메일
		let buyer_email1 = $("#buyer_email1").val();
		let buyer_email2 = $("#buyer_email2").val();
		
		// 입금은행
		let paymethod_bank_name = $("#paymethod_bank_name").val();
		// 입금자명
		let paymethod_bank_buyer_name = $("#paymethod_bank_buyer_name").val();
		
		// 문의사항 비밀번호 유효성 검사
		if(question.trim() != "" || question_pwd.trim() != "") {
			if(!pwd_chk.test(question_pwd)) {
				alert("문의사항 비밀번호가 양식에 맞지 않습니다!");
				$("#question_pwd").focus();
				return false;
			}
		}
		// 빈칸 유효성 검사
		if(buyer_name.trim() == "" && buyer_address1.trim() != "" && buyer_address2.trim() != "" && buyer_address3.trim() != "" && buyer_phone1.trim() != "" && buyer_phone2.trim() != "" && buyer_phone3.trim() != "" && buyer_email1.trim() != "" && buyer_email2.trim() != "") {
			alert("받는이 성함을 입력해주세요!");
			$("#buyer_name").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() == "" && buyer_address2.trim() != "" && buyer_address3.trim() != "" && buyer_phone1.trim() != "" && buyer_phone2.trim() != "" && buyer_phone3.trim() != "" && buyer_email1.trim() != "" && buyer_email2.trim() != "") {
			alert("상품을 받으실 주소를 입력해주세요!");
			$("#sample6_postcode").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() != "" && buyer_address2.trim() == "" && buyer_address3.trim() != "" && buyer_phone1.trim() != "" && buyer_phone2.trim() != "" && buyer_phone3.trim() != "" && buyer_email1.trim() != "" && buyer_email2.trim() != "") {
			alert("상품을 받으실 주소를 입력해주세요!");
			$("#sample6_address").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() != "" && buyer_address2.trim() != "" && buyer_address3.trim() == "" && buyer_phone1.trim() != "" && buyer_phone2.trim() != "" && buyer_phone3.trim() != "" && buyer_email1.trim() != "" && buyer_email2.trim() != "") {
			alert("상품을 받으실 상세주소를 입력해주세요!");
			$("#sample6_detailAddress").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() != "" && buyer_address2.trim() != "" && buyer_address3.trim() != "" && buyer_phone1.trim() == "" && buyer_phone2.trim() != "" && buyer_phone3.trim() != "" && buyer_email1.trim() != "" && buyer_email2.trim() != "") {
			alert("받는이 휴대전화번호를 입력해주세요!");
			$("#buyer_tel1").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() != "" && buyer_address2.trim() != "" && buyer_address3.trim() != "" && buyer_phone1.trim() != "" && buyer_phone2.trim() == "" && buyer_phone3.trim() != "" && buyer_email1.trim() != "" && buyer_email2.trim() != "") {
			alert("받는이 휴대전화번호를 입력해주세요!");
			$("#buyer_tel2").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() != "" && buyer_address2.trim() != "" && buyer_address3.trim() != "" && buyer_phone1.trim() != "" && buyer_phone2.trim() != "" && buyer_phone3.trim() == "" && buyer_email1.trim() != "" && buyer_email2.trim() != "") {
			alert("받는이 휴대전화번호를 입력해주세요!");
			$("#buyer_tel3").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() != "" && buyer_address2.trim() != "" && buyer_address3.trim() != "" && buyer_phone1.trim() != "" && buyer_phone2.trim() != "" && buyer_phone3.trim() != "" && buyer_email1.trim() == "" && buyer_email2.trim() != "") {
			alert("받는이 이메일주소를 입력해주세요!");
			$("#buyer_email1").focus();
			return false;
		}
		else if(buyer_name.trim() != "" && buyer_address1.trim() != "" && buyer_address2.trim() != "" && buyer_address3.trim() != "" && buyer_phone1.trim() != "" && buyer_phone2.trim() != "" && buyer_phone3.trim() != "" && buyer_email1.trim() != "" && buyer_email2.trim() == "") {
			alert("받는이 이메일주소를 입력해주세요!");
			$("#buyer_email2").focus();
			return false;
		}
		else if(buyer_name.trim() == "" || buyer_address1.trim() == "" || buyer_address2.trim() == "" || buyer_address3.trim() == "" || buyer_phone1.trim() == "" || buyer_phone2.trim() == "" || buyer_phone3.trim() == "" || buyer_email1.trim() == "" || buyer_email2.trim() == "") {
			alert("받는이 정보를 모두 입력해주세요!");
			$("#buyer_name").focus();
			return false;
		}
		
		// 무통장 입금 결제시
		if(addr_paymethod == "cash") {
			// 입금 은행 올바르게 선택하지 않았거나, 입금자명이 작성되어있지 않을때
			if(paymethod_bank_name.trim() == "" || paymethod_bank_buyer_name.trim() == "") {
				alert("입금 은행 및 입금자명을 입력하세요!");
				return false;
			}
			else {
				// 현금 영수증 신청
				if(cashreceipt == 'Y') {
					// 개인
					if(cashreceipt1 == "personal") {
						// 현금영수증 개인을 신청했으나, 번호가 올바르게 전부 다 입력되지 않았을때
						if(cashreceipt_personal_number1.trim() == "" || cashreceipt_personal_number2.trim() == "" || cashreceipt_personal_number3.trim() == "") {
							alert("현금영수증 신청하실 전화번호를 입력하세요!");
							return false;
						}
						save_method(size);
						payment_form.submit();
					}
					// 사업자
					else if(cashreceipt1 == "employed") {
						// 현금영수증 사업자를 신청했으나, 번호가 입력되지 않았을때
						if(cashreceipt_employed_number.trim() == "") {
							alert("현금영수증을 신청하실 사업자 번호를 입력하세요!");
							return false;
						}
						save_method(size);
						payment_form.submit();
					}
				}
				// 현금 영수증 미신청
				else {
					save_method(size);
					payment_form.submit();
				}
			}
			
		}
		// 카드 결제시
		else if(addr_paymethod == "card") {
			save_method(size);
			payment_form.submit();		
		}
	}
	
	// hidden 태그에 값 저장해주는 메소드.
	function save_method(size) {
		// 결제금액
		let payment_price = $(".payment_price").text().replaceAll(",","");
		// 최종결제금액
		let payment_tot_price = $(".payment_tot_price").text().replaceAll(",","");
		// 배송비
		let payment_delivery_price = $(".payment_delivery_price").text().replaceAll(",","");
		// 포인트 사용액
		let buyer_point = $("#buyer_point").val();
		
		// 포인트 적립 예정액
		let payment_tot_point = $("#payment_tot_point").text().replaceAll(",","");
		
		let product_option = '';
		let product_count = '';
		let product_idx = '';
		
		for(let i=0; i<size; i++) {
			product_option += $("#product_view_option_color_"+i).text()+"/";
			product_option += $("#product_view_option_size_"+i).text()+":";
			product_count += $("#product_view_count_"+i).text()+"/";
			product_idx += $("#cart_product_idx_"+i).val()+"/";
		}
		
		$("input[name=order_price]").attr('value',payment_price);
		$("input[name=order_tot_price]").attr('value',payment_tot_price);
		$("input[name=delivery_price]").attr('value',payment_delivery_price);
		$("input[name=order_point]").attr('value',buyer_point);
		$("input[name=order_option]").attr('value',product_option);
		$("input[name=order_count]").attr('value',product_count);
		$("input[name=product_idx]").attr('value',product_idx);
		$("input[name=order_tot_point]").attr('value',payment_tot_point);
	}

</script>
</html>