<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page import = "data.DAO" %>
<%@ page import =  "data.PVO"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.ArrayList" %>


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
<%
	List articleList = null;
	ArrayList<Integer> product= new ArrayList<Integer>();
	DAO dao = DAO.getDao();
	int count ;//

	int pPrice = Integer.valueOf(request.getParameter("pPrice"));
	int pNum = Integer.valueOf(request.getParameter("pNum"));
	String oProduct= request.getParameter("pProduct");
	int oQuan = Integer.valueOf(request.getParameter("oQuan"));
%>
<head>
<title>�ֹ��ϱ�</title>
<meta charset="euc-kr">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> �ֹ��ϱ�</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script src="js/mobile.js" type="text/javascript"></script>
</head>

<% 
  try{     
%>
<table border=1 width="500px" cellspacing=0>
	<tr>
		<td>��ǰ��ȣ</td><td><%=pNum %></td>
	</tr>
	<tr>
		<td>ǰ��</td><td><%=oProduct %></td>
	</tr>	
	<tr>
		<td>����</td><td><%=pPrice %></td>
	</tr>
	<tr>
		<td>����</td><td><%=oQuan %></td>
	</tr>
	<tr>
		<td>�� ��</td><td><%=oQuan*pPrice %></td>
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
					<form action="orderPro.jsp" onsubmit="return writeSave()">
						<input type="text" name="oName" value="�̸�" onblur="this.value=!this.value?'�� ��':this.value;" onfocus="this.select()" onclick="this.value='';">
						<input type="text" name="oPhone" value="��ȭ��ȣ" onblur="this.value=!this.value?'��ȭ��ȣ':this.value;" onfocus="this.select()" onclick="this.value='';">
					
						<input type="text" name="oAdd" value="�ּ�" onblur="this.value=!this.value?'��ȭ��ȣ':this.value;" onfocus="this.select()" onclick="this.value='';">	
					<input type=hidden name=oProduct value="<%=oProduct%>">
					<input type=hidden name=oQuan value="<%=oQuan%>">
					<input type=hidden name=oId value="<%=uid%>">
					<input type=hidden name=oPrice value="<%=oQuan*pPrice%>">
					<input type="submit" value="�����ϱ�" id="submit">
<%
  }catch(Exception e){}
%>
					</form>
				</div>
					</center>
				
			</div>
		</div>
		
	</div>
</body>
</html>
	
