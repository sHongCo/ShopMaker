<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page import = "data.OVO" %>
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
<body>
<h1>�ֹ����</h1>
<table border=1 width="500px" cellspacing=0>
	<tr>
		<td>�ֹ���ȣ</td><td>�ֹ��� ���̵�</td>
		<td>�ֹ�ǰ��</td>	<td>����</td><td>����</td><td>�ֹ��ð�</td>
	</tr>	
<%
	DAO dao = DAO.getDao();
	OVO ovo = new OVO();
	ArrayList<OVO> order= dao.getOrderList();
	int oPrice = 0;
	
	try{
	for(int i=0; i<order.size();i++){
		ovo=order.get(i);

%>
	<tr>
		<td><%=ovo.getoNum() %></td>
		<td><%=ovo.getoId() %></td>
		<td><%=ovo.getoProduct() %></td>
		<td><%=ovo.getoQuan() %></td>
		<td><%=ovo.getoPrice() %></td>
		<td><%=ovo.getoDate() %></td>
	</tr>	
	
	<%
	oPrice += ovo.getoPrice();
	}
	%>
	<tr>
		<td>�� �����</td><td><%=oPrice %></td>
	</tr>
</table>

		

<%
  }catch(Exception e){}
%>
				</div>
					</center>
				
			</div>
		</div>
		
	</div>
</body>
</html>
	