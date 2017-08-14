<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "data.DAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="pvo" scope="page" class="data.PVO">
   <jsp:setProperty name="pvo" property="*"/>
</jsp:useBean>
<%
  String pProduct =  request.getParameter("pProduct");
  int pQuan = Integer.parseInt(request.getParameter("pQuan"));
  int pPrice = Integer.parseInt(request.getParameter("pPrice"));
	Timestamp date= new Timestamp(System.currentTimeMillis());

  
  pvo.setpQuan(pQuan);
  pvo.setpPrice(pPrice);
  pvo.setpProduct(pProduct);
  
  DAO dbPro = DAO.getDao();
  dbPro.insertProduct(pvo);

  %>
	  <meta http-equiv="Refresh" content="0;url=GoodList.jsp" >
