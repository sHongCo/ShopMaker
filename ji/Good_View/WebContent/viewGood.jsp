<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="shop.DAO" %> 
<%@ page import="shop.PVO" %>   
<%@ page import="java.util.ArrayList" %>    
<% int pNum = Integer.parseInt(request.getParameter("pNum"));%>
<%
    		DAO dao = new DAO();
    		ArrayList<PVO> list = dao.getList(1);			
%>
<jsp:useBean id="shop" class="shop.PVO" scope="page" />    
<h1> ��ǰ ����</h1>
<br>
<table border=1 width="700" cellspacing=0>
 <tr>
  <td width="150">��ǰ ID��ȣ</td>
  <td colspan="3"><%=list.get(pNum-1).getpNum() %></td>
 </tr>
 <tr>
  <td>��ǰ��</td> 
   <td colspan="3"><%=list.get(pNum-1).getpProduct() %></td>
 </tr>
 <tr>
  <td>����</td> 
  <td colspan="3"><%=list.get(pNum-1).getpPrice() %>��</td>
 </tr>
 <tr>
  <td>����</td>
  <td colspan="3"><%=list.get(pNum-1).getpQuan() %>��</td>
 </tr>
	
 <tr>
  <td>��� �ֹ���</td>
  <td colspan="3"><input type="text" name="oQuan">��</td>
 </tr>
 <tr>
  <td>����</td>
  <td colspan="3"><img src="images/1.jpg" width="360ox" height="360px"></td>
 </tr> 
</table>

<br>
<form method=post action=Cart>
<input type=hidden name=pNum value="<%=list.get(pNum-1).getpNum() %>">
<input type=hidden name=pProduct value="<%=list.get(pNum-1).getpProduct() %>">
<input type=hidden name=pPrice value="<%=list.get(pNum-1).getpPrice() %>">
<input type=submit value="��ٱ��Ͽ� ���">
<input type ="button" value = "��ǰ������� ���ư���" onClick ="location.href='viewGoodList.jsp'">
</form>