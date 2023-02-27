<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<script>
	'use strict';
	
	function product_search() {
		let search = $("#search").val();
		location.href="${ctp}/product/search?searchString="+search;
	}
</script>
<!-- Right menu -->
<style>
	#right {
	    position: fixed;
	    right: 55px;
	    top: 55px;
	    z-index: 999;
	    width: 40px;
	    padding-bottom: 0px;
	    text-align: center;
	}
	#right #r_search a, #right #side_on a {
	    width: 40px;
	    padding: 11px 0;
	    line-height: 18px;
	    font-size: 1.4rem;
	    text-align: center;
	    background: rgba(255,255,255,0);
	    vertical-align: middle;
	    color: #000;
	    display: block;
	}
	ul li a:hover {
		text-decoration: none;
	    color: #000;
	}
	#r_search:hover, #side_on:hover {
		background: rgba(255,255,255,0.7);
	}
	#searchForm {
		position: fixed;
		right: 30px;
		top: 57px;
	}
	#search {
		border: 0px;
		background-color: black;
		border-radius: 15px;
		color: white;
	}
	.tuxedo-menu {
		display: none;
   		position: fixed;
   		top: 0%;
  			left: 0;
   		width: 100%;
   		height: 100%;
   		padding: 0px;
   		z-index: 999999;
   		background: rgba(0,0,0,0.9);
	}
	#menubar ul li {
		list-style: none;
	}
	#menubar {
		display: flex;
		justify-content: center;
		margin: 15% auto;
		text-align: center;
		font-weight: 600;
	}
	#menubar h2 {font-size: 1.2rem;}
	#menubar ul li a {font-size: 0.9rem;}
	#menubar ul li a:hover {
		color: #888;
	    transition: 0.3s;
	}
	#menubar h2 {
	    color: #fff;
	    font-size: 1.9rem;
	    margin-bottom: 10px;
	    padding-bottom: 10px;
	    border-bottom: 0px solid #333;
	    transition: 0.5s;
	}
</style>
<body>
	<!-- 오른쪽 메뉴 -->
	<div id="right">
	    <div id="r_search" class="mb-4">
	    	<a href="javascript:searchFormClick()"><i class="fa fa-search" aria-hidden="true"></i></a>
    	</div>
    	<div id="searchForm">
    		<a href="javascript:searchFormClose()"><i class="fa fa-times" aria-hidden="true"></i></a>
    		<input type="text" name="search" id="search" onkeyup="javascript:if(window.event.keyCode==13){product_search()}" />
	    	<a href="javascript:product_search()"><i class="fa fa-search" aria-hidden="true"></i></a>
    	</div>
	    <div id="side_on"><a href="javascript:sidebarOn()" class="tuxedo-menu-trigger"><i class="fa fa-bars" aria-hidden="true"></i></a></div>
	</div>
	<!-- 우측 사이드 온 메뉴 -->
	<nav id="sidebar" class="tuxedo-menu" style="display: block; color: white;">
		<div style="position: fixed; top: 125px; right: 65px;">
	   		<a href="javascript:sidebarClose()"><i class="fa fa-times" aria-hidden="true"></i></a>
		</div>
		<div class="row" id="menubar">
			<ul>
				<h2>CATEGORY</h2>
				<c:forEach var="vo" items="${main_category_vos}" varStatus="st">
        			<li><a href="${ctp}/product/main_category_view?category_main=${vo.category_main}">${vo.category_main_name}.</a></li>
				</c:forEach>
			</ul>
			<ul>
				<h2>MEMBERS</h2>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login">LOGIN</a></c:if><c:if test="${sMid != null}"><a href="${ctp}/member/logout">LOGOUT</a></c:if> </li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/join">JOIN US</a></c:if><c:if test="${sMid != null }"><a href="${ctp}/member/my_info?mid=${sMid}">MY INFO</a></c:if></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/member/cart"></c:if>BASKET<span>(${basket})</span></a></li>
			</ul>
			<ul>
				<h2>MY PAGE</h2>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/error/ready"></c:if>ORDER LIST</a></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/error/ready"></c:if>MILEAGE</a></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/error/ready"></c:if>MY COUPON</a></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/error/ready"></c:if>MY DEPOSITS</a></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/error/ready"></c:if>1:1 BOARD</a></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/error/ready"></c:if>MY BOARD</a></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/member/address"></c:if>MY ADDRESS</a></li>
				<li><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/product/wish_list"></c:if>WISH LIST</a></li>
			</ul>
		</div>
	</nav>
	<!-- 우측 전체메뉴 끝-->
</body>