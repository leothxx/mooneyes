<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp30023371"); 
    
        //function requestPay() {
            IMP.request_pay({
                pg : 'html5_inicis.INIpayTest',
                pay_method : 'card',
                // merchant_uid: "57008833-33004", 
                merchant_uid: "mooneyes_" + new Date().getTime(), 
                // name : '당근 10kg',
                name : '${sPayMentVO.name}',
                // amount : 1004,
                amount : 10,
                // buyer_email : 'Iamport@chai.finance',
                buyer_email : '${sPayMentVO.buyer_email}',
                // buyer_name : '아임포트 기술지원팀',
                buyer_name : '${sPayMentVO.buyer_name}',
                // buyer_tel : '010-1234-5678',
                buyer_tel : '${sPayMentVO.buyer_tel}',
                // buyer_addr : '서울특별시 강남구 삼성동',
                buyer_addr : '${sPayMentVO.buyer_addr}',
                // buyer_postcode : '123-456'
                buyer_postcode : '${sPayMentVO.buyer_postcode}',
            }, function (rsp) { // callback
                if (rsp.success) {
                	  alert("결재가 완료되었습니다.");
                    console.log(rsp);
                    location.href = '${ctp}/payment/paymentOk';
                } else {
                	  alert("결재가 취소 되었습니다.\n다시 시도해주세요.");
                    console.log(rsp);
                    location.href = '${ctp}/member/cart';
                }
            });
        //}
    </script>
    <style>
    	div .title_move img {
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
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
	<div class="logo_img mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 8vw;"/></div>
	<div class="row" style="margin: 0 auto;"><div class="col text-center">결제중입니다...</div></div>
</body>
</html>