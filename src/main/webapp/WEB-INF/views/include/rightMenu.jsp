<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
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
    		<input type="text" name="search" id="search" />
	    	<a href=""><i class="fa fa-search" aria-hidden="true"></i></a>
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
				<li><a href="">ALL ITEM.</a></li>
				<li><a href="">HELMET.</a></li>
				<li><a href="">APPAREL.</a></li>
				<li><a href="">GOODS.</a></li>
				<li><a href="">SPECIAL COLLABO.</a></li>
				<li><a href="">CUSTOM CAR PARTS.</a></li>
				<li><a href="">MOTORCYCLE PARTS.</a></li>
				<li><a href="">RATFINK FEVER.</a></li>
				<li><a href="">EVENT TICKET.</a></li>
			</ul>
			<ul>
				<h2>MEMBERS</h2>
				<li><a href="">LOGIN</a></li>
				<li><a href="${ctp}/member/join">JOIN US</a></li>
				<li><a href="">BASKET<span>0</span></a></li>
			</ul>
			<ul>
				<h2>MY PAGE</h2>
				<li><a href="">ORDER LIST</a></li>
				<li><a href="">MILEAGE</a></li>
				<li><a href="">MY COUPON</a></li>
				<li><a href="">MY DEPOSITS</a></li>
				<li><a href="">1:1 BOARD</a></li>
				<li><a href="">MY BOARD</a></li>
				<li><a href="">MY ADDRESS</a></li>
				<li><a href="">WISH LIST<span>0</span></a></li>
				<li><a href="">TODAY VIEW<span>0</span></a></li>
			</ul>
		</div>
	</nav>
	<!-- 우측 전체메뉴 끝-->
</body>