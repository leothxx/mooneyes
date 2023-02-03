<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="${ctp}/js/menu.js"></script>
	<style>
		body, code {
		    font-size: 1.5rem;
		    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움','AppleGothic','Apple SD Gothic Neo','sans-serif';
		    color: #353535;
		    background: #fff;
		}
	</style>
</head>
<body>
	<!-- 왼쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
	<!-- 오른쪽 메뉴 -->
	<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
	<!-- AD -->
	<p><img src="${ctp}/resources/images/backgroundimage.jpg" width="100%" height="100%"/><p>
	<!-- 메인 -->
	<div class="container">
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	</div>
	<p><br/><p>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>