<!-- ��ǰ ������ ������ / Good -> Goods / ����ֹ��� text -> Scroll -->


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- <jsp:useBean id="shop" class="shop.PVO" scope="page" /> --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.*"%>

<%
	String userID = null;

	if (session.getAttribute("uId") != null) {
		userID = (String) session.getAttribute("uId");
	}

	System.out.println("���� �α� viewGood.jsp userID:" + userID);

	String productName = request.getParameter("pNum");
	int pNum = Integer.parseInt(request.getParameter("pNum"));

	System.out.println("int pNum Good.jsp pNum : " + pNum); // 1

	DAO dao = new DAO();
	PVO pvo = dao.getNum(pNum);
%>

<h1 class="bor_btm266 m_bottom20">�󼼺���</h1>
<br />
<form action="wishList2.jsp" method="post">





	<table border=1 width="700px" cellspacing=0>




		<tr>
			<td width="150">��ǰ ID��ȣ</td>
			<td colspan="3"><%=productName%></td>
		</tr>
		<tr>
			<td>��ǰ��</td>
			<td colspan="3"><%=pvo.getpProduct()%></td>
		</tr>
		<tr>
			<td>����</td>
			<td colspan="3"><%=pvo.getpPrice()%>��</td>
		</tr>
		<tr>
			<td>���</td>
			<td colspan="3"><%=pvo.getpQuan()%>��</td>
		</tr>

		<tr>

			<td>��� �ֹ���</td>
			<td colspan="3"><input type="text" name="oQuan">��</td>


		</tr>

		<tr>
			<td>����</td>
			<td colspan="3"><img src="images/1.jpg" width="360px"
				height="360px"></td>
		</tr>
	</table>
	<br>

	<input type=hidden name=pProduct value="<%=pvo.getpProduct()%>">
	<input type=hidden name=pPrice value="<%=pvo.getpPrice()%>">

	<!-- 1���� -->
	<input type="hidden" name=pNum value="<%=pNum%>">


	<input type=submit value="��ٱ��� Ȯ��" > <input type="button"
		value="��ǰ������� ���ư���" onClick="location.href='viewGoodList.jsp'">

</form>

