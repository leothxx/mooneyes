<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>monneyes_product_new_item.jsp</title>
	<style>
		.new-item {
			background-color: #ffff00;
		}
		.new-item-logo {
			font-weight: 800;
			font-size: 2rem;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="new-item animate__animated mt-5" style="width: 100%; margin: 0px auto;">
		<p><br/><br/><br/></p>
		<div class="row"><div class="col new-item-logo">NEW ARRIVAL ITEM!</div></div>		
	</div>
</body>
</html>