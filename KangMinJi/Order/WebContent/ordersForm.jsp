<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page import = "data.PVO" %>
<%@ page import = "data.DAO" %>
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
<head>
<title>�ֹ��ϱ�</title>
<meta charset="euc-kr">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script src="js/mobile.js" type="text/javascript"></script>
</head>

<h1>�ֹ����</h1>
<%
	DAO dao = DAO.getDao();
	PVO pvo = new PVO();
	ArrayList<PVO> product= dao.getProductList(uid);
	int oPrice = 0;
	
	try{
	for(int i=0; i<product.size();i++){
		pvo=product.get(i);

%>
<form action="ordersPro.jsp" onsubmit="return writeSave()">
<table border=1 width="500px" cellspacing=0>
	<tr>
		<td>ǰ��</td><td><%=pvo.getpProduct() %></td>
					<input type=hidden name=oProduct value="<%=pvo.getpProduct()%>">
	</tr>	
	<tr>
		<td>����</td><td><%=pvo.getpPrice() %></td>
				<input type=hidden name=pPrice value="<%=pvo.getpPrice()%>">
	</tr>
	<tr>
		<td>����</td><td><%=pvo.getpQuan() %></td>
					<input type=hidden name=oQuan value="<%=pvo.getpQuan()%>">
	</tr>
	<%
	oPrice += pvo.getpPrice()*pvo.getpQuan();
	System.out.println(oPrice);
	}
	%>
	<tr>
		<td>�� ��</td><td><%=oPrice %></td>
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
						<input type="text" name="oName" value="�̸�" onblur="this.value=!this.value?'�� ��':this.value;" onfocus="this.select()" onclick="this.value='';">
						<input type="text" name="oPhone" value="��ȭ��ȣ" onblur="this.value=!this.value?'��ȭ��ȣ':this.value;" onfocus="this.select()" onclick="this.value='';">
					
						<input type="text" name="oAdd" value="�ּ�" onblur="this.value=!this.value?'��ȭ��ȣ':this.value;" onfocus="this.select()" onclick="this.value='';">	
					<input type=hidden name=oId value="<%=uid%>">
					<input type=hidden name=oPrice value="<%=oPrice%>">
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
	
