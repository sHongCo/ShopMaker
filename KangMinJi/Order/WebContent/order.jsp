<!--  �ֹ����� ������ / ȸ������ ������ DB�Է��� ���� ������ ���� �������� ��
	Order_F/ordersForm.jsp�� �ٿ��� ��
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("���� �α� order.jsp userID:" + did);
	String didCheck = did;

	String productName = request.getParameter("productNames");
	int productCount = Integer.parseInt(request.getParameter("productCount"));
	int productPrice = Integer.parseInt(request.getParameter("pPrice"));

	DAO dao = new DAO();
	OVO ovo = new OVO();
	dao.orderCheck(ovo, did, productName, productCount, productPrice);
	// wishList2 ���� �ֹ�Ȯ�� ������ order���̺� ����
	/* System.out.println("productName : " + productName);
	System.out.println("productPrice : " + productPrice);
	System.out.println("productCount : " + productCount); */
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>order.jsp</title>
</head>
<body>
	wishList2.jsp���� ���� ������ order ���̺� �� ����Ϸ�
	<h1 class="bor_btm266 m_bottom20">�ֹ� ����</h1>

	<!--  ����° -->
	<form action="ordersForm.jsp" method="post">

		<table width="800" border="1">

			<%
				ArrayList<OVO> list = dao.orderOutputData(did);
				for (int i = 0; i < list.size(); i++) {

					OVO ovo2 = list.get(i);
			%>
			<tr>
				<td>���̸�</td>
				<td colspan="3"><%=ovo2.getoName()%>&nbsp;��</td>
			</tr>

			<tr>
				<td>��ID</td>
				<td colspan="3"><%=ovo2.getoId()%></td>
			</tr>

			<tr>
				<td>�� ��ȭ��ȣ</td>
				<td colspan="3"><%=ovo2.getoPhone()%></td>
			</tr>

			<tr>
				<td>���ּ�</td>
				<td colspan="3"><%=ovo2.getoAdd()%></td>
			</tr>

			<tr>
				<td>�ֹ���ǰ�̸�</td>
				<td colspan="3"><%=ovo2.getoProduct()%></td>
				<input type=hidden name=oProduct value="<%=ovo2.getoProduct()%>">
				
			</tr>
			<tr>
				<td>�ֹ���ǰ����</td>
				<td colspan="3"><%=ovo2.getoPrice()%> ��</td>
					<input type=hidden name=oPrice value="<%=ovo2.getoPrice()%>">
			</tr>

			<tr>
				<td>�ֹ�����</td>
				<td colspan="3"><%=ovo2.getoQuan()%> ��</td>
				<input type=hidden name=oQuan value="<%=ovo2.getoQuan()%>">
			</tr>


			<tr>
				<td>�ֹ���¥</td>
				<td colspan="3"><%=ovo2.getoDate()%></td>
		</tr>

			<%
				}
			%>

		</table>
		<input type="submit" value="ordersForm.jsp">
	</form>

</body>
</html>