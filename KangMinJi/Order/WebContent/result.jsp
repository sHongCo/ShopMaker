<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="ovo" class="data.OVO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


 
<%
int oNum = Integer.parseInt(request.getParameter("oNum"));
System.out.println(oNum);
DAO dao = new DAO();
ovo = dao.getOrder(oNum);
int oPrice=0;
//������Ʈ �Ķ���� �� �޾ƿ���.
Enumeration<String> para = request.getParameterNames();
//para�迭�� �ִ� ������ŭ while!
while(para.hasMoreElements()){
	//name�� �Ķ����name����.
	String names=para.nextElement();
	//oPrice�Ķ���Ͱ� ������.
	if(names.equals("oPrice")){
		oPrice=Integer.parseInt(request.getParameter("oPrice"));	
	}else{//oPrice �Ķ���Ͱ� ������ ovo��ü���� ������
		oPrice=ovo.getoPrice();
	}
}
%>
	
	<script type="text/javascript">



</script>






<h1>��ǰ ����</h1>
<br />
<table border=1 width="700px" cellspacing=0>



	<tr>
	<td> �ֹ��� �Ϸ�Ǿ����ϴ�. </td>
	</tr>
	<tr>
		<td width="150">�ֹ���ȣ</td>
		<td colspan="3"><%=oNum%></td>
	</tr>
	<tr>
		<td>��ǰ��</td>
		<td colspan="3"><%=ovo.getoProduct()%></td>
	</tr>
	<tr>
		<td>�����ݾ�</td>
		<td colspan="3"><%=oPrice%>��</td>
	</tr>
	<tr>
		<td>�ֹ���</td>
		<td colspan="3"><%=ovo.getoName()%></td>
	</tr>

	<tr>
		<td>����� ����</td>
		<td colspan="3"><%=ovo.getoAdd() %></td>
	</tr>
	<tr>
		<td>��������</td>
		<td colspan="3">[����] 310-55-5555112 </td>
	</tr>
</table>
 <input type="button" value="��ǰ������� ���ư���" onClick="location.href='viewGoodList.jsp'";>

<br>
