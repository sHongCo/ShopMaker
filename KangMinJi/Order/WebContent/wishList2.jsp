<!-- ��ٱ��� ���� ������ /  ��ǰ�̸��� ���� ���� ������ /    -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>wishList.jsp</title>


<script type="text/javascript">
  function mySubmit(index) {
    if (index == 1) {
    //  document.myForm.action='order.jsp';
    	  document.myForm.action='ordersForm.jsp';
    }
    if (index == 2) {
      document.myForm.action='deleteCheck.jsp';
    }
    document.myForm.submit();
  }
  </script>
</head>
<script type="text/javascript">
<%
if(session.getAttribute("uId")==null) // �α����� �ȵǾ��� ��
        {  %>
        <!-- 
		document.write("����!!");
			 alert("�α��� �ϼ���!");
			 history.go(-1);
			 -->
<%	     }
        else // �α��� ���� ���
        {%>
        	<!--
        	id=session.getValue("uId");
        	uid=id.toString();
        	-->
 <%       }
%>
</script>
<body>
	 	<%@ include file="header.jsp" %>

<%
	//int totalPrice =0;
	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("���� �α� wishList2.jsp userID:" + did);
	String didCheck = did;

	int pPrice ;
	int productCount;
	Enumeration<String> para = request.getParameterNames();
	
	
	String productName = request.getParameter("pNum");

	
	String pProduct = request.getParameter("pProduct");
	
	int wishListpNum;
	
	DAO dao = new DAO();
	PVO pvo = new PVO();
		DVO dvo = new DVO();
	
	while(para.hasMoreElements()){
		String names = para.nextElement();
		
		if(names.equals("pPrice")){
			pPrice = Integer.parseInt(request.getParameter("pPrice"));
			productCount = Integer.parseInt(request.getParameter("oQuan"));
			wishListpNum = Integer.parseInt(productName);
			dao.inputData(pvo, pProduct, productCount, pPrice, did);
			
		}else{
			pPrice = dvo.getDprice();
			productCount =dvo.getDcount();
			wishListpNum = dvo.getDnum();
		}
		
	}
	
%>
	<h1 class="bor_btm266 m_bottom20">��ٱ��� ����</h1>

	<!--  ����° -->
<form name="myForm" action="order.jsp" method="post">


	<table border="1">
		<%
			ArrayList<DVO> list = dao.outputData(did);
			for (int i = 0; i < list.size(); i++) {
				 dvo = list.get(i);
		%>
		<tr>
			<td>��ǰ �̸�</td>
			<td colspan="3" ><%=dvo.getDname()%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=dvo.getDprice()%>��</td>
		</tr>
		<tr>
			<td>����ֹ���</td>
			<td><%=dvo.getDcount()%>��</td>
		</tr>
		<tr>
	<%-- 	<td colspan="3"><input type="checkbox" name = "checks" value="<%=i %>">���� <!-- onclick='mySubmit(2)' --></td> --%>
		<td colspan="3"><input type="checkbox" name = "checks" value="<%=dvo.getDnum() %>">���� <!-- onclick='mySubmit(2)' --></td>
		</tr>
		<!--�� ������ ����  -->
	
		<input type="hidden" name="dnum" value="<%=dvo.getDnum() %>">
	
		<input type="hidden" name=pPrice value="<%=dvo.getDprice()%>"></td>
		
		
		<input type="hidden" name="productCount" value="<%=dvo.getDcount()%>"></td>
	
		<input type="hidden" name="productName" value="<%=dvo.getDnum()%>"></td>
		
		<input type="hidden" name="productNames" value="<%=dvo.getDname()%>"></td>
		
		<%
			}
		%>
		
	</table>
	  <input type="button" value="�ֹ�Ȯ��" onclick='mySubmit(1)'>
	   <input type="button" value="����" onclick='mySubmit(2)'>
	  </form>
	  
	
	  
	  
	  
	  
	  
	<input type="button" value="���� ���ϱ�" onClick="history.go(-2)">
</body>
</html>