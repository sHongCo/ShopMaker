<%
/**
 * @author ������
 * @date 17.08.10
 * @File viewGood.jsp
 * 
 * viewGood(��������)
 * -> �ٷ��ֹ��ϱ� ������ �̵�
 */
 
 %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


 
<%
int pNum = Integer.parseInt(request.getParameter("pNum"));
System.out.println(pNum);
DAO dao = new DAO();
pvo = dao.getProduct(pNum);
%>

<h1>��ǰ ����</h1>
<br />
<table border=1 width="700px" cellspacing=0>

<form method=post action="orderForm.jsp">
	<tr>
		<td width="150">��ǰ ID��ȣ</td>
		<td colspan="3"><%=pvo.getpNum()%></td>
		<input type=hidden name=pNum value="<%=pvo.getpNum()%>"> 
	</tr>
	<tr>
		<td>��ǰ��</td>
		<td colspan="3"><%=pvo.getpProduct()%></td>
		<input type=hidden name=pProduct value="<%=pvo.getpProduct()%>">
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3"><%=pvo.getpPrice()%>��</td>
		<input type=hidden name=pPrice value="<%=pvo.getpPrice()%>">
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
		<td colspan="3"><img src="images/1.jpg" width="360ox"
			height="360px"></td>
	</tr>
</table>
	 <input	type=submit value="�ֹ��ϱ�">
 	 <input type="button" value="��ǰ������� ���ư���" onClick="location.href='viewGoodList.jsp'";>
</form>
<br>
