<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sampleOk.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <script type="text/javascript" src="${ctp}/js/menu.js"></script>
</head>
<body>
<!-- 왼쪽 메뉴 -->
<jsp:include page="/WEB-INF/views/include/leftMenu.jsp"/>
<!-- 오른쪽 메뉴 -->
<jsp:include page="/WEB-INF/views/include/rightMenu.jsp"/>
<p><br/></p>
<div class="container">
  <h2>결재가 정상적으로 처리되었습니다.</h2>
  <p>(주문/결재하신 내용은 다음과 같습니다.)</p>
  <hr/>
  <table class="table table-bordered">
    <tr>
      <th>결제 금액</th>
      <td><input type="number" name="amount" value="${vo.amount}" class="form-control"/></td>
    </tr>
    <tr>
      <th>구매 물품명</th>
      <td><input type="text" name="name" value="${vo.name}" class="form-control"/></td>
    </tr>
    <tr>
      <th>이메일</th>
      <td><input type="text" name="buyer_email" value="${vo.buyer_email}" class="form-control"/></td>
    </tr>
    <tr>
      <th>주문자</th>
      <td><input type="text" name="buyer_name" value="${vo.buyer_name}" class="form-control"/></td>
    </tr>
    <tr>
      <th>연락처</th>
      <td><input type="text" name="buyer_tel" value="${vo.buyer_tel}" class="form-control"/></td>
    </tr>
    <tr>
      <th>주소</th>
      <td><input type="text" name="buyer_addr" value="${vo.buyer_addr}" class="form-control"/></td>
    </tr>
    <tr>
      <th>우편번호</th>
      <td><input type="text" name="buyer_postcode" value="${vo.buyer_postcode}" class="form-control"/></td>
    </tr>
  </table>
  <p class="text-center">
    <a href="${ctp}/" class="btn btn-success">계속쇼핑하기</a>
  </p>
</div>
<p><br/></p>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>