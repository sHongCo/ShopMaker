<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "data.DAO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.util.*" %>


<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="ovo" scope="page" class="data.OVO">
   <jsp:setProperty name="ovo" property="*"/>
</jsp:useBean>
<%
  	int oPrice = Integer.parseInt(request.getParameter("oPrice"));
	String[] oProducts  = request.getParameterValues("oProduct");
	String[] oQuans = request.getParameterValues("oQuan");
 	String[] pPrices = request.getParameterValues("pPrice");
 	Timestamp date= new Timestamp(System.currentTimeMillis());

 for(int i=0; i < oProducts.length; i++){
 	int oQuan=Integer.parseInt(oQuans[i]);
 	int pPrice=Integer.parseInt(pPrices[i]);
 	String oProduct=oProducts[i];
	System.out.println(oProduct);
	
  ovo.setoId(request.getParameter("oId"));
  ovo.setoName(request.getParameter("oName"));
  ovo.setoPhone(request.getParameter("oPhone"));
  ovo.setoAdd(request.getParameter("oAdd"));
  ovo.setoDate(date);
  ovo.setoQuan(oQuan);
  ovo.setoPrice(pPrice);
  ovo.setoProduct(oProduct);
  
  DAO dbPro = DAO.getDao();
  dbPro.insertOrder(ovo);
 }
  System.out.println(ovo.getoNum());
  %>
 
	  <meta http-equiv="Refresh" content="0;url=result.jsp?oNum=<%=ovo.getoNum()%>&oPrice=<%=oPrice%>" >
