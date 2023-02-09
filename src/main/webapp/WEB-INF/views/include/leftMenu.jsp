<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- Left Menu -->
<script>

</script>
<style>
	#left {
	    font-size: 1.5rem;
	    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움','AppleGothic','Apple SD Gothic Neo','sans-serif';
	    color: #353535;
	    background: #fff;
	}
	#left {
	    position: fixed;
	    left: 30px;
	    margin-top: 20px;
	    z-index: 999;
	    width: 200px;
	    background: rgba(255,255,255,0);
	    padding: 30px;
	    -webkit-transition: all 0.5s ease-in;
	    -ms-transition: all 0.5s ease-in;
	    -o-transition: all 0.5s ease-in;
	    transition: all 0.5s ease-in;
	}
	#left:hover {background: rgba(255,255,255,0.7);}
	#left_menu .logo img {
  			width: 100%;
   		position: relative;
	}
	#left_menu .login_menu {
	    line-height: 1.6em;
	    font-size: 0.8rem;
	    color: #000;
	    letter-spacing: 1px;
	    text-transform: uppercase;
	    font-weight: 400;
	    white-space: nowrap;
	}
	ul li a:hover {
		text-decoration: none;
	    color: #000;
	}
	#left_menu .category {
	    margin: 0px auto;
	    padding: 10px 0 20px 10px;
	}
	.shop_category  a, .shop_category ul, .shop_category li {
		list-style: none;
		font-size: 0.8em;
	} 
	.category-body a {
		text-align: left;
		font-weight: 600;
		position: relative;
		color: rgba(0,0,0,0.5); 
		font-weight: bold; 
		padding: 2px;
		display : block;
	}
	.category-body a::after {
		position: absolute; 
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 20px; 
		line-height: 20px; 
		content: attr(title); 
		color: #000000; 
		border-bottom: 2px solid #000; 
		max-width: 0; 
		overflow: hidden; 
		transition: all 0.5s;
	}
	.category-body a:hover::after {max-width: 100%;}
	.category-body ul li {display: inline-block;}
	.category-body ul li a {color : white;}
	.sub_apparel {
		text-align: center;
		width: 150px;
		position: fixed;
		left: 180px;
		top: 350px;
		z-index: 1000;
		background-color: black;
		color : white;
		font-size: 0.9rem;
		text-align: center;
		list-style: none;
	}
	.sub_goods {
		text-align: center;
		width: 150px;
		position: fixed;
		left: 180px;
		top: 370px;
		z-index: 1000;
		background-color: black;
		color : white;
		font-size: 0.9rem;
		text-align: center;
		list-style: none;
	}
	.sub_collabo {
		text-align: center;
		width: 150px;
		position: fixed;
		left: 180px;
		top: 390px;
		z-index: 1000;
		background-color: black;
		color : white;
		font-size: 0.9rem;
		text-align: center;
		list-style: none;
	}
	.sub_car {
		text-align: center;
		width: 150px;
		position: fixed;
		left: 180px;
		top: 410px;
		z-index: 1000;
		background-color: black;
		color : white;
		font-size: 0.9rem;
		text-align: center;
		list-style: none;
	}
	.sub_motorcycle {
		text-align: center;
		width: 200px;
		position: fixed;
		left: 180px;
		top: 430px;
		z-index: 1000;
		background-color: black;
		color : white;
		font-size: 0.9rem;
		text-align: center;
		list-style: none;
	}
	.sub_RF {
		text-align: center;
		width: 150px;
		position: fixed;
		left: 180px;
		top: 465px;
		z-index: 1000;
		background-color: black;
		color : white;
		font-size: 0.9rem;
		text-align: center;
		list-style: none;
	}
	.sub_apparel li, .sub_goods li, .sub_collabo li, .sub_car li, .sub_motorcycle li, .sub_RF li {list-style: none;}
	.sub_apparel li a:hover, .sub_goods li a:hover, .sub_collabo li a:hover, .sub_car li a:hover, .sub_motorcycle li a:hover, .sub_RF li a:hover {color: #ccc;}
	.sub_ul {text-align: center;}
	.sub_ul li {display: inline-block;}
	#insta:hover {opacity: 0.8;}
	.page-body {
		list-style: none;
		font-size: 0.5em;
		font-weight: 600;
	}
	.sub_goods {
		background-color: black;
		color : white;
	}
</style>
<body>
	<!-- 왼쪽 메뉴 -->
	<div id="left" class="animate__animated">
		<ul id="left_menu" class="nav accordion">
			<!-- 메인로고 메뉴 -->
			<li class="logo mb-5">
				<a href="${ctp}/"><img src="${ctp}/resources/images/logo.png" alt="logo"/></a>				
			</li>
			<!-- 로그인 메뉴 --> 
			<li class="login_menu"><c:if test="${sMid == null}"><a href="${ctp}/member/login">login</a></c:if><c:if test="${sMid != null}"><a href="${ctp}/member/logout">logout</a></c:if>/<c:if test="${sMid == null }"><a href="${ctp}/member/join">join us</a></c:if><c:if test="${sMid != null }"><a href="${ctp}/member/my_info?mid=${sMid}">MY INFO</a></c:if></li>
			<c:if test="${sLevel >= 3}"><li class="login_menu"><a href="${ctp}/admin/main">ADMIN</a></li></c:if>
			<li class="login_menu mb-3"><c:if test="${sMid == null}"><a href="${ctp}/member/login"></c:if><c:if test="${sMid != null}"><a href="${ctp}/member/mypage?id=${sMid}"></c:if>my page</a> / <a href="/order/basket.html" class="">basket<span>(0)</span></a></li>
			<!-- 스토어 메뉴 -->
			<li class="shop_category mb-4">
				<a class="categoryOn" href="#category1" style="font-weight: 700; font-size: 0.7em;">SHOP CATEGORY</a>
        		<ul class="collapse show p-0" id="category1" data-parent="#accordion">
        			<li class="category-body"><a href="">ALL ITEM.</a></li>
					<li class="category-body"><a href="">HELMET.</a></li>
					<li class="category-body"><a href="" class="menu_apparel menu_apparel2">APPAREL.</a></li>
					<li class="category-body"><a href="" class="menu_goods">GOODS.</a></li>
					<li class="category-body"><a href="" class="menu_collabo">SPECIAL COLLABO.</a></li>
					<li class="category-body"><a href="" class="menu_car">CUSTOM CAR PARTS.</a></li>
					<li class="category-body"><a href="" class="menu_motorcycle">MOTORCYCLE PARTS.</a></li>
					<li class="category-body"><a href="" class="menu_RF">RATFINK FEVER.</a></li>
					<li class="category-body"><a href="">EVENT TICKET.</a></li>
				</ul>
			</li>
			<!-- 페이지 메뉴 -->
			<li class="page-body"><a href="">>문아이즈 HISTORY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li class="page-body"><a href="">>문의하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li class="page-body"><a href="">>매장안내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li class="page-body mb-4"><a href="">>정식딜러인증서&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<!-- 인스타그램 링크 -->
			<li>
				<a href="http://www.instagram.com/leothx_x" target="_self" id="insta"><img src="${ctp}/resources/images/instagramlogo.png" width="150px"/></a>
			</li>
		</ul>
	</div>
	<div class="sub_apparel p-2" id="sub_apparel">
		<ul class="p-0 m-0" style="display : block;">
			<li><a href="">KIDS & LADIES WEAR.</a></li>
			<li><a href="">HAT & CAP.</a></li>
			<li><a href="">T-SHIRTS.</a></li>
			<li><a href="">JACKET.</a></li>
			<li><a href="">COVER ALL.</a></li>
			<li><a href="">LONG T-SHIRTS.</a></li>
			<li><a href="">SHIRTS.</a></li>
			<li><a href="">PANTS.</a></li>
			<li><a href="">SHOES.</a></li>
			<li><a href="">ACCESOIRES.</a></li>
		</ul>
	</div>
	<div class="sub_goods p-2" id="sub_goods">
		<ul class="p-0 m-0" style="display : block;">
			<li><a href="">DIECAST.</a></li>
			<li><a href="">KEYRING.</a></li>
			<li><a href="">SIGN BOARD.</a></li>
			<li><a href="">GARAGE.</a></li>
			<li><a href="">LIVING.</a></li>
			<li><a href="">OFFICE SUPPLY.</a></li>
			<li><a href="">PRINT & DVD.</a></li>
			<li><a href="">STICKER & DECAL.</a></li>
			<li><a href="">IPHONE CASE.</a></li>
		</ul>
	</div>
	<div class="sub_collabo p-2" id="sub_collabo">
		<ul class="p-0 m-0" style="display : block;">
			<li><a href="">VANS.</a></li>
			<li><a href="">G-SHOCK.</a></li>
			<li><a href="">SHAKEPISTON.</a></li>
			<li><a href="">NEW ERA.</a></li>
			<li><a href="">GALLOP HELMET.</a></li>
		</ul>
	</div>
	<div class="sub_car p-2" id="sub_car">
		<ul class="p-0 m-0" style="display : block;">
			<li><a href="">AIR FRESHENERS.</a></li>
			<li><a href="">ANTENA BALL.</a></li>
			<li><a href="">BOLTS.</a></li>
			<li><a href="">INTERIORS.</a></li>
			<li><a href="">MAT.</a></li>
			<li><a href="">STREEING WHEELS.</a></li>
			<li><a href="">SUN SHADE.</a></li>
			<li><a href="">TRUCK GOODS.</a></li>
			<li><a href="">WHEELS & TIRES.</a></li>
		</ul>
	</div>
	<div class="sub_motorcycle p-2" id="sub_motorcycle">
		<ul class="p-0 m-0" style="display : block;">
			<li><a href="">ACCESSORIES.</a></li>
			<li><a href="">AIR FILTERS & SCOOPS.</a></li>
			<li><a href="">BOLTS.</a></li>
			<li><a href="">EXHAUST PARTS.</a></li>
			<li><a href="">HARLEY-DAVIDSON PARTS.</a></li>
			<li><a href="">MQQN TANKS.</a></li>
			<li><a href="">MOON DISC.</a></li>
			<li><a href="">TIRES & ACC.</a></li>
		</ul>
	</div>
	<div class="sub_RF p-2" id="sub_RF">
		<ul class="p-0 m-0" style="display : block;">
			<li><a href="">APPAREL.</a></li>
			<li><a href="">GOODS.</a></li>
		</ul>
	</div>
</body>