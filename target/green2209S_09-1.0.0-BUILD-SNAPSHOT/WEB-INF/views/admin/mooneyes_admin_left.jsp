<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adminLeft</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <style>
  	* {
  		font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕',Dotum,'돋움','AppleGothic','Apple SD Gothic Neo',sans-serif;
  	}
  	.adminMainBack:hover {
  		color: #aaa;
  		text-decoration: none;
  	}
  	.homeBack:hover {
  		color: #aaa;
  		text-decoration: none;
  	}
  	.card-link:hover {
  		color: #aaa;
  		text-decoration: none;
  	}
  	.card-body a:hover {
  		color: #aaa;
  		text-decoration: none;
  	}
  	.card-header {
	    padding: 0.75rem 1rem;
	    margin-bottom: 0;
	    background-color: rgba(255,223,0,0.9);
	    border-bottom: 1px solid rgba(0,0,0,.125);
	    font-weight: 800;
	}
	.card-body {
	    -ms-flex: 1 1 auto;
	    flex: 1 1 auto;
	    min-height: 1px;
	    padding: 0.75rem;
	    background-color: rgba(255,223,0,0.5);
	    font-weight: 500;
	}
  </style>
</head>
<body>
	<div class="container text-center">
		<div class="mb-2 mt-2"><a href="${ctp}/admin/mooneyes_admin_content" target="adContent" class="adminMainBack"><img src="${ctp}/images/logo3.jpg" width="100vw"/></a></div>
  	<div class="mb-2"><a href="${ctp}/" target="_top" class="homeBack mb-5"><i class="fa-sharp fa-solid fa-house" style="font-size: 20px;"></i></a></div>
  	<div id="accordion">
    	<div class="card">
      	<div class="card-header">
        	<a class="card-link" data-toggle="collapse" href="#collapseOne">
          	회원관리
        	</a>
      	</div>
      	<div id="collapseOne" class="collapse" data-parent="#accordion">
        	<div class="card-body">
         	  <a href="${ctp}/nopage.mem" target="adContent">회원전체관리</a>
        	</div>
        	<div class="card-body">
         	  <a href="${ctp}/nopage.mem" target="adContent">적립금관리</a>
        	</div>
      	</div>
    	</div>
	    <div class="card">
	      <div class="card-header">
	        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
	        주문관리
	      	</a>
	      </div>
	      <div id="collapseTwo" class="collapse" data-parent="#accordion">
        	<div class="card-body">
         	  <a href="${ctp}/nopage.mem" target="adContent">주문조회</a>
        	</div>
        	<div class="card-body">
         	  <a href="${ctp}/nopage.mem" target="adContent">주문수정</a>
        	</div>
        	<div class="card-body">
         		<a href="${ctp}/nopage.mem" target="adContent">환불조회</a>
        	</div>
	      </div>
	    </div>
	    <div class="card">
	      <div class="card-header">
	        <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
	         	상품관리
	        </a>
	      </div>
	      <div id="collapseThree" class="collapse" data-parent="#accordion">
        	<div class="card-body">
         		<a href="${ctp}/admin/product_input" target="adContent">상품등록</a>
        	</div>
        	<div class="card-body">
         		<a href="${ctp}/productUpdateList.ad" target="adContent">상품수정</a>
        	</div>
        	<div class="card-body">
         		<a href="${ctp}/nopage.mem" target="adContent">후기관리</a>
        	</div>
	      </div>
	    </div>
	    <div class="card">
	      <div class="card-header">
	        <a class="collapsed card-link" data-toggle="collapse" href="#collapseFour">
	        	고객센터
	      	</a>
	      </div>
	      <div id="collapseFour" class="collapse" data-parent="#accordion">
        	<div class="card-body">
         		<a href="${ctp}/nopage.mem" target="adContent">문의조회</a>
        	</div>
        	<div class="card-body">
         		<a href="${ctp}/nopage.mem" target="adContent">답변작성</a>
        	</div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>