<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


<%@ include file="header.jsp" %>
<%
	
	//String uid="BBEBBE";

	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 order.jsp userID:" + did);
	String didCheck = did;

	/* 	String oProduct = request.getParameter("oProduct");
		String somePrice = request.getParameter("oPrice");
		String oQuan = request.getParameter("oQuan"); */
%>
<head>
<title>주문하기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<h1>주문목록</h1>
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
			<td>품명</td>
			<td><%=ovo.getoProduct()%></td>
			<input type=hidden name=oProduct value="<%=ovo.getoProduct()%>">
		</tr>
		<tr>
			<td>가격</td>
			<td><%=ovo.getoPrice()%></td>
			<input type=hidden name=pPrice value="<%=ovo.getoPrice()%>">
		</tr>
		<tr>
			<td>수량</td>
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
			<td>총 액</td>
			<td><%=oPrice%></td>
		</tr>
	</table>
	<body>
		<div id="page">

			<div id="body" class="contact">
				<div class="header">
					<div>
						<h1>주문정보</h1>
					</div>
				</div>
				<div class="footer">
					<center>
						<div class="orderPro">
							<h1>INQUIRY FORM</h1>
							<input type="text" name="oName" value="이름"
								onblur="this.value=!this.value?'이 름':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type="text" name="oPhone" value="전화번호"
								onblur="this.value=!this.value?'전화번호':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type="text" name="oAdd" value="주소"
								onblur="this.value=!this.value?'전화번호':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type=hidden name=oId value="<%=did%>"> <input
								type=hidden name=oPrice value="<%=oPrice%>"> <input
								type="submit" value="결제하기" id="submit">
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

