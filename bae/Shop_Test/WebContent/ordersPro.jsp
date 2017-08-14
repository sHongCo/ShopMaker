<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "shop.*" %>
<%@ page import = "java.sql.Timestamp" %>

<%-- <% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="ovo" scope="page" class="shop.OVO">
   <jsp:setProperty name="ovo" property="*"/>
</jsp:useBean>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
  int oQuan = Integer.parseInt(request.getParameter("oQuan"));
  int oPrice = Integer.parseInt(request.getParameter("oPrice"));
	Timestamp date= new Timestamp(System.currentTimeMillis());

  ovo.setoId(request.getParameter("oId"));
  ovo.setoName(request.getParameter("oName"));
  ovo.setoPhone(request.getParameter("oPhone"));
  ovo.setoAdd(request.getParameter("oAdd"));
  ovo.setoDate(date);
  ovo.setoQuan(oQuan);
  ovo.setoPrice(oPrice);
  ovo.setoProduct(request.getParameter("oProduct"));
  
  DAO dbPro = DAO.getDao();
  dbPro.insertOrder(ovo);
  System.out.println("ordersPro ovo.getoNum() : " + ovo.getoNum());  //여기도 0
  %>
	  <meta http-equiv="Refresh" content="0;url=result.jsp?oNum=<%=ovo.getoNum()%>" >
 --%>	  
	  
<% request.setCharacterEncoding("euc-kr");%>

<%
	String oNum = (request.getParameter("oNum"));
  	int oPrice = Integer.parseInt(request.getParameter("oPrice"));
	String[] oProducts  = request.getParameterValues("oProduct");
	String[] oQuans = request.getParameterValues("oQuan");
 	String[] pPrices = request.getParameterValues("pPrice");
 	Timestamp date= new Timestamp(System.currentTimeMillis());

 		DAO dao = new DAO();
 		OVO ovo = new OVO();
 for(int i=0; i < oProducts.length; i++){
 	int oQuan=Integer.parseInt(oQuans[i]);
 	int pPrice=Integer.parseInt(pPrices[i]);
 	String oProduct=oProducts[i];
	System.out.println("ordersPro oProduct : " + oProduct);
	
  ovo.setoId(request.getParameter("oId"));
  ovo.setoName(request.getParameter("oName"));
  ovo.setoPhone(request.getParameter("oPhone"));
  ovo.setoAdd(request.getParameter("oAdd"));
  ovo.setoDate(date);
  ovo.setoQuan(oQuan);
  ovo.setoPrice(pPrice);
  ovo.setoProduct(oProduct);
  
  DAO dao2 = new DAO();
  dao2.insertOrder(ovo);
 }
  System.out.println("ordersPro ovo.getoNum() : " + ovo.getoNum());
  %>
 
	  <meta http-equiv="Refresh" content="0;url=result.jsp?oNum=<%=ovo.getoNum()%>&oPrice=<%=oPrice%>" >
	  