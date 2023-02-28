`<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_order_view.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/postcode.js"></script>
  	<link rel="stylesheet" href="${ctp}/resources/css/payment-view.css" />
  	<script>
  		'use strict';
  		$(function(){
  			let addr_paymethod = "${vo.addr_paymethod}";
  			let cashreceipt = "${vo.cashreceipt}";
  			let cashreceipt1 = "${vo.cashreceipt1}";
  			
  			$("#addr_paymethod1_view").hide();
  			$("#cashreceipt_Y_view").hide();
  			$("#cashreceipt_personal_view").hide();
  			$("#cashreceipt_employed_view").hide();
  			
  			if(addr_paymethod == "cash") {
  				$("#addr_paymethod_img1").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_card_disabled.gif");
  				$("#addr_paymethod_img0").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank.gif");
  				$("#addr_paymethod1_view").hide();
	  			$("#addr_paymethod0_view").show();
  			}
  			else if(addr_paymethod == "card") {
  				$("#addr_paymethod_img0").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank_disabled.gif");
  				$("#addr_paymethod_img1").attr("src","//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_card.gif");
  				$("#addr_paymethod0_view").hide();
	  			$("#addr_paymethod1_view").show();
  			}
  			if(cashreceipt == "Y") {
  				$("#cashreceipt_Y_view").show();
  			}
  			else if(cashreceipt == "N") {
  				$("#cashreceipt_Y_view").hide();
  				$("#cashreceipt_personal_view").hide();
  				$("#cashreceipt_employed_view").hide();
  			}
  			if(cashreceipt1 == "personal") {
  				$("#cashreceipt_personal_view").show();
  			}
  			else if(cashreceipt1 == "employed") {
  				$("#cashreceipt_employed_view").show();
  			}
  		});
  		
  		// 주문 취소 클릭시
  		function order_cancel(idx) {
  			let payment = "${vo.payment}";
  			if(payment == "D") {
  				alert("배송중인 상태에서는 주문을 취소할 수 없습니다.\n상품 수령 후 제품 및 포장 손상없이 7일 이내 환불은 가능합니다.");
  				return false;
  			}
  			else if(payment == "O") {
  				alert("배송완료인 상태에서는 주문을 취소할 수 없습니다.\n제품 및 포장 손상없이 7일 이내 환불은 가능합니다.");
  				return false;
  			}
  			else if(payment == "C") {
  				alert("해당 주문건은 이미 취소되었습니다.");
  				return false;
  			}
  			else if(payment == "R") {
  				alert("이미 환불처리가 완료된 주문건입니다.");
  				return false;
  			}
  			let ans = confirm("정말로 주문을 취소하시겠습니까?");
  			if(ans == false) {
  				return false;
  			}
  			else {
  				$.ajax({
  					type : "post",
  					url : "${ctp}/order/order_cancel",
  					data : {order_idx : idx},
  					success : function(res) {
  						if(res == "1") {
  							alert("주문이 취소되었습니다.");
  						}
  						else {
  							alert("주문을 취소하는 도중 에러가 발생하였습니다!\n다시 시도해주세요.");
  						}
  						$(".payment-payment-form-view").load(location.href+' .payment-payment-form-view');
  					},
  					error : function() {
  						alert("전송 오류!!");
  					}
  				});
  			}
  		}
  	</script>
  	<style>
  		.order-view a:hover {
  			text-decoration: none;
  			opacity: 0.6;
  			transition: 0.3s;
  		}
  	</style>
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
					<div class="col payment-title" style="padding: 15px;">주문 영수증</div>
				</div>
				<div class="mt-2"></div>
				<div class="delivery-view" style="padding: 10px;">
					<div class="row mb-3"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>배송지</b></div></div>
					<div class="row mt-3 mb-4">
						<div class="col-2 payment-table-name">받는사람&nbsp;<font color='blue'>*</font></div>
						<div class="col"><input type="text" id="buyer_name" name="buyer_name" value="${vo.order_name}" disabled class="payment-form"/></div>
					</div>
					<div class="row mb-2">
						<div class="col-2 payment-table-name">주소&nbsp;<font color='blue'>*</font></div>
						<div class="col-3 pr-1"><input type="text" name="postcode" id="sample6_postcode" value="${postCode}" placeholder="우편번호" required disabled class="payment-form" /></div>
						<div class="col-2" style="padding-top: 10px;"><a href="javascript:sample6_execDaumPostcode()" style="margin: 0px; vertical-align: -10px;"><img src="${ctp}/images/search_top_btn.png" style="width:20px;"/></a></div>
					</div>
					<div class="row mb-2">
						<div class="col-2 payment-table-name"></div>
						<div class="col"><input type="text" name="roadAddress" id="sample6_address" size="50" value="${roadAddress}" placeholder="주소" class="payment-form" disabled /></div>
					</div>
					<div class="row mb-2">
						<div class="col-2 payment-table-name"></div>
						<div class="col"><input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" placeholder="상세주소" class="payment-form" disabled /></div>
					</div>
					<div class="row mb-4">
						<div class="col-2 payment-table-name"></div>
						<div class="col"><input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" placeholder="참고항목" class="payment-form" disabled /></div>
					</div>
					<div class="row mb-4">
						<div class="col-2 payment-table-name">휴대전화&nbsp;<font color='blue'>*</font></div>
						<div class="col">
							<select id="buyer_tel1" name="buyer_tel1" class="payment-form" style="width: 30%;" disabled>
								<option value="010" ${member_phone1 == '010' ? 'selected' : ''}>010</option>
								<option value="011" ${member_phone1 == '011' ? 'selected' : ''}>011</option>
								<option value="016" ${member_phone1 == '016' ? 'selected' : ''}>016</option>
								<option value="017" ${member_phone1 == '017' ? 'selected' : ''}>017</option>
								<option value="018" ${member_phone1 == '018' ? 'selected' : ''}>018</option>
								<option value="019" ${member_phone1 == '019' ? 'selected' : ''}>019</option>
							</select>
							<span>-</span>
							<input type="text" id="buyer_tel2" value="${member_phone2}" name="buyer_tel2" class="payment-form" style="width: 32%;" disabled/>
							<span>-</span>
							<input type="text" id="buyer_tel3" value="${member_phone3}" name="buyer_tel3" class="payment-form" style="width: 33%;" disabled/>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-2 payment-table-name">이메일&nbsp;<font color='blue'>*</font></div>
						<div class="col">
							<input type="text" id="buyer_email1" name="buyer_email1" value="${member_email1}" class="payment-form" style="width: 48%;" disabled/>
							<span>@</span>
							<select name="buyer_email2" id="buyer_email2" class="payment-form" style="width: 48%;" disabled>
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
					<div class="row mb-4">
						<div class="col">
							<select name="delivery_msg" id="delivery_msg" class="payment-form" style="padding: 5px 0px 5px 10px;" disabled>
								<option value="" ${vo.delivery_msg == '' ? 'selected' : ''}>-- 메세지 선택 (선택사항) --</option>
								<option value="배송 전에 미리 연락 바랍니다." ${vo.delivery_msg == '배송 전에 미리 연락 바랍니다.' ? 'selected' : ''}>배송 전에 미리 연락 바랍니다.</option>
								<option value="부재시 경비실에 맡겨주세요." ${vo.delivery_msg == '부재시 경비실에 맡겨주세요.' ? 'selected' : ''}>부재시 경비실에 맡겨주세요.</option>
								<option value="부재시 문 앞에 놓아주세요." ${vo.delivery_msg == '부재시 문 앞에 놓아주세요.' ? 'selected' : ''}>부재시 문 앞에 놓아주세요.</option>
								<option value="빠른 배송 부탁드립니다." ${vo.delivery_msg == '빠른 배송 부탁드립니다.' ? 'selected' : ''}>빠른 배송 부탁드립니다.</option>
								<option value="택배함에 보관해 주세요." ${vo.delivery_msg == '택배함에 보관해 주세요.' ? 'selected' : ''}>택배함에 보관해 주세요.</option>
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
				<div class="order-view" style="padding: 10px;">
					<div class="row mb-5 mt-2"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>주문상품</b></div></div>
					<c:forEach var="cart_vo" items="${cart_vos}" varStatus="st">
						<input type="hidden" id="cart_product_idx_${st.index}" name="cart_product_idx_${st.index}" value="${cart_vo.product_idx}" />
						<a href="${ctp}/product/product_view?product_idx=${cart_vo.product_idx}">
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
						</a>
					</c:forEach>
				</div>
				<div class="row delivery-price-view" style="background: #f6f6f6;padding: 10px; width: 100%; margin: 0 auto;">
					<div class="col text-left" style="font-size: 0.9rem; color:#888;">배송비</div>
					<div class="col text-right"><c:if test="${vo.delivery_price == '0'}">무료</c:if><c:if test="${vo.delivery_price != '0'}"><fmt:formatNumber value="${vo.delivery_price}" pattern="#,###" />원</c:if> </div>
				</div>
				<div class="mt-2"></div>
				<div class="point-view" style="padding: 10px;">
					<div class="row mb-4"><div class="col-3 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>할인/부가결제</b></div></div>
					<div class="row">
						<div class="col-2 payment-table-name text-left" style="margin-right: 5px;">사용 POINT</div>
						<div class="col-9 p-0"><input type="text" id="buyer_point" name="buyer_point" value="<fmt:formatNumber value='${vo.order_point}' pattern='#,###'/>" class="payment-form text-right" style="padding-right: 10px;" disabled/></div>
					</div>
					<div class="row mt-3 mb-4">
						<div class="col text-right" style="padding-right: 25px;">
							보유잔액&nbsp;<span class="payment_member_point"><fmt:formatNumber value="${member_vo.member_point}" pattern="#,###"/>원</span>
						</div>
					</div>
				</div>
				<div class="row sale-price-view" style="background: #f6f6f6;padding: 10px; width: 100%; margin: 0 auto;">
					<div class="col text-left" style="font-size: 1.1rem; color:#000; font-weight: 800;">적용금액</div>
					<div class="col text-right" style="color: #3971FF; font-weight: 800; font-size: 1.1rem;"><span class="payment_sale_tot">-<fmt:formatNumber value="${vo.order_point}" pattern="#,###"/>원</span></div>
				</div>
				<div class="mt-2"></div>
				<div class="payment-info-view" style="padding: 10px;">
					<div class="row mb-3"><div class="col-3 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>결제정보</b></div></div>
					<div class="row mb-2" style="padding-left: 10px; font-size: 1rem;">
						<div class="col text-left">주문상품</div>
						<div class="col text-right" style="font-weight: 800; font-size: 1.2rem;"><span class="payment_price"><fmt:formatNumber value="${vo.order_price}" pattern="#,###"/></span>원</div>
					</div>
					<div class="row mb-2" style="padding-left: 10px; font-size: 1rem;">
						<div class="col text-left">배송비</div>
						<div class="col text-right" style="font-weight: 800; font-size: 1.2rem;">+<span class="payment_delivery_price"><c:if test="${vo.order_price > 50000}">0</c:if><c:if test="${vo.order_price < 50000}">3,000</c:if></span>원</div>
						
					</div>
					<div class="row mb-4" style="padding-left: 10px; font-size: 1rem;">
						<div class="col text-left">할인/부가결제</div>
						<div class="col text-right" style="font-weight: 800; font-size: 1.2rem;"><font color='red'>-<span class="payment_sale_price"><fmt:formatNumber value="${vo.order_point}" pattern="#,###"/></span></font>원</div>
					</div>
				</div>
				<div class="row" style="padding: 10px; background-color: #F4F7FF; font-size: 1.4rem; font-weight: 800; width:100%; margin: 0 auto;">
					<div class="col text-left">최종 결제 금액</div>
					<div class="col text-right" style="color: #3971FF;"><span class="payment_tot_price"><fmt:formatNumber value="${vo.order_tot_price}" pattern="#,###"/></span>원</div>
				</div>
				<div class="mt-2"></div>
				<div class="payment-method-view" style="padding: 10px;">
					<div class="row mb-3"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1.2rem;"><b>결제수단</b></div></div>
					<div class="row mb-4"><div class="col-2 text-left" style="padding-left: 30px; font-size: 1rem;">결제수단 선택</div></div>
					<div class="radio-inner">
						<span class="ec-base-label">
							<input id="addr_paymethod0" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cash" type="radio" checked="checked" autocomplete="off" ${vo.addr_paymethod == "card" ? 'checked' : ''} disabled/>
							<label for="addr_paymethod0"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_bank.gif" id="addr_paymethod_img0" pay_name="무통장 입금" pay_code="cash"></label>
						</span>
						<span class="ec-base-label">
							<input id="addr_paymethod1" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="card" type="radio" autocomplete="off" ${vo.addr_paymethod == "card" ? 'checked' : ''} disabled/>
							<label for="addr_paymethod1"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_card_disabled.gif" id="addr_paymethod_img1" pay_name="카드 결제" pay_code="card"></label>
						</span>
					</div>
					<div id="addr_paymethod0_view" style="padding: 10px;" class="mt-3">
						<div class="row mb-2">
							<div class="col-2 text-center" style="padding-top:10px;">입금은행<font color="blue">*</font></div>
							<div class="col">
								<select id="paymethod_bank_name" name="paymethod_bank_name" class="payment-form" disabled>
									<option value="" ${vo.paymethod_bank_name == '' ? 'selected' : ''}>::: 선택해 주세요 :::</option>
									<option value="국민71240101603058" ${vo.paymethod_bank_name == '국민71240101603058' ? 'selected' : ''}>국민은행 : 712401-01-603058 문아이즈(서하늘)</option>
								</select>
							</div>
						</div>
						<div class="row mb-4">
							<div class="col-2 text-center" style="padding-top:10px;">입금자명<font color="blue">*</font></div>
							<div class="col"><input type="text" id="paymethod_bank_buyer_name" name="paymethod_bank_buyer_name" class="payment-form" value="${vo.paymethod_bank_buyer_name}" disabled/></div>
						</div>
						<div class="row" style="font-size: 1.1rem; padding: 10px;">
							<div class="col text-left"><b>현금영수증</b></div>
						</div>
						<div class="row mb-1" style="font-size: 1.1rem; padding: 10px;">
							<div class="col text-left">
								<input type="radio" id="cashreceipt_Y" name="cashreceipt" value="Y" ${vo.cashreceipt == 'Y' ? 'checked' : ''} onclick="return(false);"/>
								<label for="cashreceipt_Y">현금영수증 신청</label>&nbsp;
								<input type="radio" id="cashreceipt_N" name="cashreceipt" value="N" ${vo.cashreceipt != 'Y' ? 'checked' : ''}  onclick="return(false);"/>
								<label for="cashreceipt_N">신청안함</label>
							</div>
						</div>
						<div id="cashreceipt_Y_view" class="row mb-1" style="padding-left: 10px;">
							<div class="col text-left">
								<input type="radio" id="cashreceipt_personal" name="cashreceipt1" value="personal" ${vo.cashreceipt1 == 'personal' ? 'checked' : ''} onclick="return(false);"/>
								<label for="cashreceipt_personal">개인</label>&nbsp;
								<input type="radio" id="cashreceipt_employed" name="cashreceipt1" value="employed" ${vo.cashreceipt1 == 'employed' ? 'checked' : ''} onclick="return(false);"/>
								<label for="cashreceipt_employed">사업자</label>
							</div>
						</div>
						<div id="cashreceipt_personal_view" class="row mb-1" style="padding: 10px;">
							<div class="col">
								<select name="cashreceipt_personal_number1" id="cashreceipt_personal_number1" class="payment-form" style="width: 30%;" disabled>
									<option value="010" ${cashreceipt_personal_number1 == '010' ? 'selected' : ''}>010</option>
									<option value="011" ${cashreceipt_personal_number1 == '011' ? 'selected' : ''}>011</option>
									<option value="016" ${cashreceipt_personal_number1 == '016' ? 'selected' : ''}>016</option>
									<option value="017" ${cashreceipt_personal_number1 == '017' ? 'selected' : ''}>017</option>
									<option value="018" ${cashreceipt_personal_number1 == '018' ? 'selected' : ''}>018</option>
									<option value="019" ${cashreceipt_personal_number1 == '019' ? 'selected' : ''}>019</option>
								</select>
								<span>-</span>
								<input type="tel" name="cashreceipt_personal_number2" id="cashreceipt_personal_number2" value="${cashreceipt_personal_number2}" class="payment-form" style="width: 30%;" disabled />
								<span>-</span>
								<input type="tel" name="cashreceipt_personal_number3" id="cashreceipt_personal_number3" value="${cashreceipt_personal_number3}" class="payment-form" style="width: 30%;" disabled/>
							</div>
						</div>
						<div id="cashreceipt_employed_view" class="row mb-1" style="padding: 10px;">
							<div class="col"><input type="text" id="cashreceipt_employed_number" name="cashreceipt_employed_number" class="payment-form" placeholder="사업자번호" value="${vo.cashreceipt_employed_number}" disabled style="padding-left: 10px;"/></div>
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
						<div class="col text-right" style="color: blue;"><span id="payment_tot_point"></span><fmt:formatNumber value="${vo.order_tot_point}" pattern="#,###" />원</div>
					</div>
				</div>
				<div class="mt-2"></div>
				<div class="payment-payment-form-view">
					<br/>
					<div class="row" style="padding: 10px 10px 20px 10px; font-size: 1rem;"><div class="col text-center"><b>현재 주문 상태 : <c:if test="${vo.payment == 'N'}">입금전</c:if><c:if test="${vo.payment == 'Y'}">배송준비중</c:if><c:if test="${vo.payment == 'D'}">배송중</c:if><c:if test="${vo.payment == 'O'}">배송완료</c:if><c:if test="${vo.payment == 'C'}"><font color='red'>취소</font></c:if><c:if test="${vo.payment == 'E'}">교환</c:if><c:if test="${vo.payment == 'R'}">환불</c:if></b></div></div>
				</div>
				<div class="payment-btn-view">
					<input type="button" value="주문 취소하기" id="payment_btn_tot_price" class="payment-btn-css" onclick="order_cancel(${vo.order_idx})" style="background: #F03737;" />
				</div>
				<div class="payment-help-view" style="padding: 15px; background-color: #FAFAFD;">
					<div class="row help-view-text">- 주문 영수증을 확인 할 수 있습니다.<br/>모든 주문은 수정이 불가능하며, 주문 취소 후 재주문 해주셔야 합니다.</div>
					<div class="row help-view-text">- 주문 취소는 주문 상태가 입금전이거나, 배송준비중인 단계에서만 가능합니다.<br/>혹시나 환불을 원하실 경우 배송을 받아 보신 후 제품 포장 및 제품 상태 손상 없이 환불처리는 가능합니다.</div>
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
</html>