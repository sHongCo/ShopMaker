<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


<%
	Object id;
	//String uid="BBEBBE";

	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("���� �α� order.jsp userID:" + did);
	String didCheck = did;

	/* 	String oProduct = request.getParameter("oProduct");
		String somePrice = request.getParameter("oPrice");
		String oQuan = request.getParameter("oQuan"); */
%>
<head>
<title>�ֹ��ϱ�</title>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<h1>�ֹ����</h1>
<%
	DAO dao = new DAO();
	
	ArrayList<OVO> product = dao.getProductList(did);
	int oPrice = 0;

	try {
		for (int i = 0; i < product.size(); i++) {
			OVO ovo = product.get(i);
%>
<form action="ordersPro.jsp" method="post">
	<table border=1 width="500px" cellspacing=0>
		<tr>
			<td>ǰ��</td>
			<td><%=ovo.getoProduct()%></td>
			<input type=hidden name=oProduct value="<%=ovo.getoProduct()%>">
		</tr>
		<tr>
			<td>����</td>
			<td><%=ovo.getoPrice()%></td>
			<input type=hidden name=pPrice value="<%=ovo.getoPrice()%>">
		</tr>
		<tr>
			<td>����</td>
			<td><%=ovo.getoQuan()%></td>
			<input type=hidden name=oQuan value="<%=ovo.getoQuan()%>">
		</tr>
<%-- 		<input type=hidden name=oNum valuel="<%=ovo.getoNum() %>">
		<%System.out.println("ordersForm ovo.getoNum() : " + ovo.getoNum()); %> --%>
		<%
			oPrice += ovo.getoPrice() * ovo.getoQuan();
					System.out.println("ordersForm oPriced : " + oPrice);
				}
		%>
		<tr>
			<td>�� ��</td>
			<td><%=oPrice%></td>
		</tr>
	</table>
	<body>
		<div id="page">

			<div id="body" class="contact">
				<div class="header">
					<div>
						<h1>�ֹ�����</h1>
					</div>
				</div>
				<div class="footer">
					<center>
						<div class="orderPro">
							<h1>INQUIRY FORM</h1>
							<input type="text" name="oName" value="�̸�"
								onblur="this.value=!this.value?'�� ��':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type="text" name="oPhone" value="��ȭ��ȣ"
								onblur="this.value=!this.value?'��ȭ��ȣ':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type="text" name="oAdd" value="�ּ�"
								onblur="this.value=!this.value?'��ȭ��ȣ':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type=hidden name=oId value="<%=did%>"> <input
								type=hidden name=oPrice value="<%=oPrice%>"> <input
								type="submit" value="�����ϱ�" id="submit">
							<%
								} catch (Exception e) {
								}
							%>
						
</form>
</div>
</center>

</div>
</div>

</div>
</body>
</html>

