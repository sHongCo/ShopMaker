<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
	<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품추가</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>제품 정보</h1>
<br />
<table border=1 width="700px" cellspacing=0>


<form method=post action="addGoodsPro.jsp">

	<tr>
		<td>제품명</td>
		<td colspan="3">
		<input type="text" name=pProduct value=>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td colspan="3">
		<input type="text" name=pPrice value=> 원</td>
	</tr>
	<tr>
		<td>재고량</td>
		<td colspan="3">
		<input type="text" name=pQuan value=> 개</td>
	</tr>

</table>
	<input type=submit value="등 록">
	<input type="button" value="상품목록으로 돌아가기" onClick="location.href='GoodList.jsp'";>
</form>
<br>

</body>
</html>