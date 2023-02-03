<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- footer -->
<style>
	body, code {
	    font-size: 1.5rem;
	    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕',Dotum,'돋움','AppleGothic','Apple SD Gothic Neo',sans-serif;
	    color: #353535;
	    background: #fff;
	}
	#bottom {
	    position: relative;
	    bottom: -30px;
	    padding: 60px 60px 60px 60px;
	    background: #f9f9f9;
	    z-index: 9999;
	    color: #000;
	    word-break: keep-all;
	    text-align: center;
	}
	#bottom .bottom_menu a {
	    display: inline-block;
	    padding: 0 10px;
	    border-left: 1px solid #eee;
	    font-size: 1rem;
	    line-height: 1.6em;
	}
	#bottom .bottom_menu a:hover {
		text-decoration: none;
		color : #999;
	}
	#bottom .bottom_info table td {
	    width: auto;
	    font-size: 0.8rem;
	    line-height: 2em;
	    white-space: normal;
	}
	#bottom .bottom_info table th {
	    width: 160px;
	    font-size: 0.9rem;
	    line-height: 2em;
	    text-align: left;
	    font-weight: 600;
	}
	#bottom .bottom_menu .bottom_plus {
		position: relative;
	    left: 0px;
	    top: 5px;
	    font-size: 1.6rem;
	    line-height: 1.6em;
	    border-left: 0;
	}
	#bottom .bottom_menu .top_btn {
		position: relative;
	    right: 0px;
	    top: 5px;
	    font-size: 1.6rem;
	    line-height: 1.6em;
	    border-left: 0;
	}
	#bottom .bottom_info ul {
	    text-align: left;
	    font-size: 0;
	    line-height: 0;
	    width: 100%;
	    min-width: 1280px;
	    float: left;
	    margin: 0px;
	    padding: 0px;
	}
	#bottom .bottom_info {
	    overflow: hidden;
	    position: relative;
	}
	th, td {
    	border: 0;
	}
	div {
   		display: block;
	}
	#bottom.move_Top_Out2 {
	    transition: 1s ease;
	    transition-delay: 0s !important;
	    transform: translate(0,30px);
	    opacity: 0;
	}
	.kg {
		color: #442678;
	}
	li {
		list-style: none;	
	}
	#bottom .bottom_linkmenu .escro a {
	    padding: 0px 10px;
	    border-radius: 10px;
	    line-height: 20px;
	    color: #fff;
	    background: #555;
	    display: inline-block;
	    font-size: 0.9rem;
	    margin-left: 10px;
	}
	#bottom .bottom_linkmenu .escro {
		font-size: 0.8rem;
	}
	#bottom .bottom_linkmenu p {
	    font-size: 1.1rem;
	    line-height: 18px;
	    color: #777;
	    margin: 0px auto 10px;
	    font-weight: 300;
	}
	#bottom .bottom_linkmenu {
	    position: relative;
	    margin: 0 0px;
	    overflow: hidden;
	    text-align: left;
	}
	#bottom .bottom_linkmenu .escro a:hover {
		text-decoration: none;
	 	transition: 0.5s ease;
		background: #fff;
		color: #aaa;
	}
</style>
<body>
	<div class="footer animate__animated">
		<div id="bottom" class="xans-element- xans-layout xans-layout-footer move_Top_In2">
			<div class="row">
				<div class="col text-left">
					<a href="" class="bottom_plus" target="_blank" onclick="winPop(this.href); return false;"><i class="fa fa-plus" aria-hidden="true"></i></a>
				</div>
				<div class="bottom_menu col-4">
					<a href="/s">HOME</a>
					<a href="">AGREEMENT</a>
					<a href=""><span style="font-weight: 800;">개인정보취급방침</span></a>
					<a href="">GUIDE</a>
				</div>
				<div class="col text-right">
					<a href="#top" class="top_btn"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
				</div>
			</div>
			<hr/>
			<div class="bottom_info">
				<!--하단 회사정보-->
				<ul>
					<li class="bottom_mypage" style="float: left;">
						<table>
							<tbody>
									<tr><th><span>BANK ACCOUNT</span></th></tr>
								<tr>
									<th>국민</th>
									<td>712401-01-603058</td>
								</tr>
								<tr>
									<th>예금주</th>
									<td>문아이즈 (서하늘)</td>
								</tr>
							</tbody>
						</table>
					</li>
					<li></li>
					<li style="float: left; border-left: 1px solid #eee; margin-left: 60px; padding-left: 60px;">
						<h2>COMPANY INFO</h2>
						<a href="http://www.mooneyes.kr"><img style="width:150px" src="${ctp}/images/footter_logo.png"></a><b></b>
						<table>
							<tbody>
								<tr>
									<th>COMPANY</th>
									<td><span style="font-weight: 900;">문아이즈코리아 (MOONEYES KOREA SHAKEPISTON)</span></td>
								</tr>
								<tr>
									<th>OWNER</th>
									<td>서하늘</td>
								</tr>
								<tr class=" cpo">
									<th>C.P.O</th>
									<td>서하늘</td>
								</tr>
								<tr>
									<th>E-mail</th>
									<td><a href="mailto:gksmf5234@gmail.com">gksmf5234@gmail.com</a></td>
								</tr>
		
								<tr>
									<th>TEL</th>
									<td>01084172769 *상품관련 문의 전화시간 (월~금) PM 1:00 ~ PM 5:00 </td>
								</tr>
								<tr class="mallorder">
									<th>ORDER LICENSE</th>
									<td>제2022-충북청주-0376호
										<a href="#none" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2753500872', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a>
									</td>
								</tr>
								<tr class="business">
									<th>BUSINESS LICENSE</th>
									<td>275-35-00872</td>
								</tr>
								<tr>
									<th>ADDRESS</th>
									<td><span style="font-weight: 900;">28355 충청북도 청주시 흥덕구 신성로 133 (신성동) 102동 문아이즈 코리아 쉐이크피스톤</span></td>
								</tr>
								<tr>
									<th>매장 OPEN</th>
									<td><span style="font-weight: 900;">PM12:00 ~ PM7:00</span></td>
									<th>정기휴무 CLOSED</th>
									<td><b>매주 수요일 (Wednesday)</b></td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>
			</div>
			<hr/>
			<div class="row bottom_linkmenu">
				<p class="xans-element- xans-layout xans-layout-footer copy ">Copyright 2016 - 2022 문아이즈 KOREA All right reserved / <a href="/" target="_blank"></a></p>
				<!--하단에스크로배너 및 기타배너-->
				<p class="escro">
					고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG사의 구매안전서비스를 이용하실 수 있습니다. 　
					<span class="kg"><span style="font-weight: 900;">KG 이니시스</span></span> 에스크로 <a href="#%EB%A7%81%ED%81%AC%EC%A3%BC%EC%86%8C" target="_blank" class="signCheckBtn">서비스가입사실확인</a>
				</p>
			</div>
		</div>
	</div>
</body>