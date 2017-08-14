<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>

<%

	String productCount = request.getParameter("oQuan");

	String productName = request.getParameter("pNum");
	String pProduct = request.getParameter("pProduct");
	String pPrice = request.getParameter("pPrice");
	System.out.println("pNum : " + productName);
	
	int wishListpNum = Integer.parseInt(productName);
	
	//int wishListpNum = Integer.parseInt(request.getParameter("pNum"));
	
	//String oQuan = request.getParameter("oQuan");
	
	
//	String test = request.getParameter(pProductName);
//	int pNum = Integer.parseInt(request.getParameter("pNum"));

	
	
/* 	
	System.out.println("pProduct : " + pProduct);
	System.out.println("pPrice : " + pPrice);
	 */
	DAO dao = new DAO();
	 PVO pvo = dao.getNum(wishListpNum);

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wishList.jsp</title>


</head>
<body>
	<h1 class="bor_btm266 m_bottom20">장바구니 내역</h1>
	
	
<!--  첫번째 -->
<table border=1 width="700px" cellspacing=0>

	<tr>
		<td width="150">제품 ID번호</td>
		<td colspan="3"><%=productName %></td>
		
	</tr>
	<tr>
		<td>재고량</td>
		<td colspan="3"><%=pvo.getpQuan()%>개</td>
	</tr>
	<tr>
		<td>가격</td>
		<td colspan="3"><%=pvo.getpPrice()%>원</td>
	</tr>
	<tr>
		<td>희망 주문량</td>
		<td colspan="3"><%=productCount%>개</td>
	</tr>
</table> 

<!--  두번째 -->








<input type="button" value="쇼핑 더하기" onClick="history.go(-1)">


</body>
</html>