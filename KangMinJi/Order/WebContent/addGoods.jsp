<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>+
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
	<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		Object id;
		String uid="BBEBBE";
        /*if(session.getAttribute("uid") == null) // �α����� �ȵǾ��� ��
        {  
			<script language="javascript">
			<!--
			 alert("�α��� �ϼ���!");
			 history.go(-1);
			-->
			</script>
        }
        else // �α��� ���� ���
        {
        	id=session.getValue("uid");
        	uid=id.toString();
        }
*/
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ�߰�</title>
</head>
<body>
<h1>��ǰ ����</h1>
<br />
<table border=1 width="700px" cellspacing=0>


<form method=post action="addGoodsPro.jsp">

	<tr>
		<td>��ǰ��</td>
		<td colspan="3">
		<input type="text" name=pProduct value=>
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3">
		<input type="text" name=pPrice value=> ��</td>
	</tr>
	<tr>
		<td>���</td>
		<td colspan="3">
		<input type="text" name=pQuan value=> ��</td>
	</tr>

</table>
	<input type=submit value="�� ��">
	<input type="button" value="��ǰ������� ���ư���" onClick="location.href='GoodList.jsp'";>
</form>
<br>

</body>
</html>