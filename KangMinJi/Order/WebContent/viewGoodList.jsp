<!-- 
��ǰ����Ʈ�� �����ִ°� / Good -> Goods / �̹������� ���� ÷�� / Btn �̹��� ����
 -->


<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<jsp:useBean id="shop" class="data.PVO" scope="page" />
<%@ page import="java.io.PrintWriter"%>
<%@ page import="data.DAO"%>
<%@ page import="data.PVO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�Ǹ� ���</title>

<link rel="stylesheet" type="text/css"
	href="resources/css/goods_basket.css">

</head>
<body>
	 	<%@ include file="header.jsp" %>
	<%
		String pNum = null;
		if (session.getAttribute("pNum") != null) {
			pNum = (String) session.getAttribute("pNum");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
	%>
	
	<h1 class="bor_btm266 m_bottom20">�ǸŸ��</h1>
	<table border="1">
		<%
			DAO dao = new DAO();
			ArrayList<PVO> list = dao.getList(pageNumber);
			for (int i = 0; i < list.size(); i++) {
				PVO pvo = list.get(i);
		%>
		<tr>
			<th>��ǰ ID��ȣ</th>
			<th>��ǰ �̹���</th>
			<th>��ǰ��</th>
			<th>����</th>
		</tr>
		<tr>
			<td><%=pvo.getpNum()%></td>
			<td><a> <img src="images/1.jpg" width="120px" height="110px">
			</a></td>
			<td>


 		<a href="viewGood.jsp?pNum=<%=pvo.getpNum()%>">
 		<input type="button"  value="<%=pvo.getpProduct()%>"> </a>
 
 
			</td>
			<td><%=pvo.getpPrice()%>��</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
