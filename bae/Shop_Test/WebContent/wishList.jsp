<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.*"%>

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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>wishList.jsp</title>


</head>
<body>
	<h1 class="bor_btm266 m_bottom20">��ٱ��� ����</h1>
	
	
<!--  ù��° -->
<table border=1 width="700px" cellspacing=0>

	<tr>
		<td width="150">��ǰ ID��ȣ</td>
		<td colspan="3"><%=productName %></td>
		
	</tr>
	<tr>
		<td>���</td>
		<td colspan="3"><%=pvo.getpQuan()%>��</td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3"><%=pvo.getpPrice()%>��</td>
	</tr>
	<tr>
		<td>��� �ֹ���</td>
		<td colspan="3"><%=productCount%>��</td>
	</tr>
</table> 

<!--  �ι�° -->








<input type="button" value="���� ���ϱ�" onClick="history.go(-1)">


</body>
</html>