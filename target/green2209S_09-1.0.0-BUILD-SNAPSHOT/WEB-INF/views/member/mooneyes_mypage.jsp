<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mooneyes_mypage.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<script>
		'use strict';
		$(function(){
			$(".myshop_sub").hover(function(){
				$(this).css("background-color","#ececec");
			});
			$(".myshop_sub").mouseleave(function(){
				$(this).css("background-color","");
			});
		});
	</script>
	<style>
		.container {
			font-size: 0.8rem;
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
		.order-list {
			border-right: 1px solid #ececec;
			padding-top: 30px;
			padding-bottom: 30px;
			text-align: center;
		}
		.cs-list {
			border-right: 1px solid #ddd;
			text-align: center;
			margin: 10px 0px 10px 0px;
		}
		div strong {
			font-size: 1rem;
		}
		div .count {
			font-weight: 800;
			font-size: 1.4rem;
		}
		.cs {
			border-top: 1px solid #ececec;
    		background: #f7f7f7;
		}
		.cs div {
			padding: 0px;
		}
		.cs div a strong {
			text-align: left;
			display: block;
		}
		.myshop_main {
			border: 1px solid #ececec;
		}
		.myshop_sub img {
			width: 3vw;
		}
		.myshop_sub {
			text-align: center;
			border-right: 1px solid #ececec;
			padding: 40px 0px;
		}
		.myshop_sub a strong {
			font-size: 1.3rem;
		}
		.myshop_sub a {
			font-size: 1rem;
		}
		.order-list a:hover, .cs-list a:hover {
			text-decoration: none;
			color: #000;
		}
		.myshop_sub a:hover {
			text-decoration: none;
			color: #bbb;
		}
	</style>
</head>
<body>
	<!-- ?????? ?????? -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- ????????? ?????? -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<div class="container">
		<div class="mb-4 title_move" style="text-align: center;"><img src="${ctp}/images/logo.png" style="width: 10vw;" class="logo_img"/></div>
		<div class="row mb-2"><span style="font-size: 1.5rem; margin:0 auto;">MOONEYES MY PAGE</span></div>
		<div class="row" style="border-top: 1px solid #ececec; border-left: 1px solid #ececec; border-right: 1px solid #ececec;">
			<div class="p-2"><img src="${ctp}/images/mg_img.png" width="40vw"/></div>
			<div class="col p-2"><font color="blue" style="font-weight: 800;">${vo.member_name}???</font>??? ???????????????<br/><font style="font-weight: 800;">[${vo.member_level == 0 ? '?????????' : ''}${vo.member_level == 1 ? '?????????' : ''}${vo.member_level == 2 ? '????????????' : ''}${vo.member_level == 3 ? '?????????' : ''}${vo.member_level == 4 ? '?????????' : ''}]</font>?????????.</div>
		</div>
		<div class="row mb-2" style="border: 1px solid #ececec; padding: 10px 10px 10px 20px;">POINT :&nbsp;&nbsp;<font color="blue"><fmt:formatNumber value="${vo.member_point}" pattern="#,###"/>???</font></div>
		<div class="order_page row p-3" style="border: 1px solid #ececec; font-size: 1.1rem; font-weight: 800;">?????? ???????????? ??????</div>
		<div class="row" style="border-left: 1px solid #ececec; border-right: 1px solid #ececec;">
			<div class="col order-list"><a href="${ctp}/member/order_list"><strong>?????????</strong><br/><span class="count">0</span></a></div>
			<div class="col order-list"><a href="${ctp}/member/order_list"><strong>???????????????</strong><br/><span class="count">0</span></a></div>
			<div class="col order-list"><a href="${ctp}/member/order_list"><strong>?????????</strong><br/><span class="count">0</span></a></div>
			<div class="col order-list" style="border: 0px;"><a href="${ctp}/member/order_list"><strong>????????????</strong><br/><span class="count">0</span></a></div>
		</div>
		<div class="row cs">
			<div class="col cs-list"><a href="${ctp}/member/order_list"><strong style="display: block; text-align: center;">??????</strong><font class="count" style="display: inline-block; text-align: center;">0</font></a></div>
			<div class="col cs-list"><a href="${ctp}/member/order_list"><strong style="display: block; text-align: center;">??????</strong><font class="count" style="display: inline-block; text-align: center;">0</font></a></div>
			<div class="col cs-list" style="border: 0px; display: block; text-align: center; margin: 10px 0px 10px 0px;"><a href="${ctp}/member/order_list"><strong style="text-align: center;">?????? </strong><font class="count" style="display: inline-block; text-align: center;">0</font></a></div>
		</div>
		<div class="row myshop_main">
			<div class="col myshop_sub"><a href="${ctp}/member/order_list"><img src="${ctp}/images/order_list_search.png" /><br/><strong>ORDER</strong><br/>???????????? ??????</a></div>
			<div class="col myshop_sub"><a href="${ctp}/member/my_info?mid=${vo.member_mid}"><img src="${ctp}/images/member_info.png" /><br/><strong>PROFILE</strong><br/>?????? ??????</a></div>
			<div class="col myshop_sub"><a href="${ctp}/"><img src="${ctp}/images/wishlist.png" /><br/><strong>WISHLIST</strong><br/>?????? ??????</a></div>
			<div class="col myshop_sub" style="border: 0px;"><a href="${ctp}/"><img src="${ctp}/images/like.png" /><br/><strong>LIKE IT</strong><br/>?????????</a></div>
		</div>
		<div class="row myshop_main">
			<div class="col myshop_sub"><a href="${ctp}/"><img src="${ctp}/images/point.png" /><br/><strong>MILEAGE</strong><br/>POINT</a></div>
			<div class="col myshop_sub"><a href="${ctp}/"><img src="${ctp}/images/headphone.png" /><br/><strong>CONSULT</strong><br/>1:1 ????????????</a></div>
			<div class="col myshop_sub"><a href="${ctp}/"><img src="${ctp}/images/coupons.png" /><br/><strong>COUPON</strong><br/>??????</a></div>
			<div class="col myshop_sub" style="border: 0px;"><a href="${ctp}/"><img src="${ctp}/images/board.png" /><br/><strong>BOARD</strong><br/>????????? ??????</a></div>
		</div>
		<div class="row myshop_main">
			<div class="col myshop_sub"><a href="${ctp}/"><img src="${ctp}/images/delivery.png" /><br/><strong>ADDRESS</strong><br/>?????? ????????? ??????</a></div>
			<div class="col myshop_sub"><a href="${ctp}/"><img src="${ctp}/images/calendar.png" /><br/><strong>SUBSCRIPTION</strong><br/>?????? ?????? ??????</a></div>
			<div class="col myshop_sub" style="border: 0px;"><a href="${ctp}/member/email_certification"><img src="${ctp}/images/email_certification.png" /><br/><strong>CERTIFICATION</strong><br/>????????? ??????</a></div>
		</div>
	</div>
	<p><br/><p>
	<!-- ?????? -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>