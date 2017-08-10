<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "data.DAO" %>
<jsp:useBean id="dao" class="data.DAO" scope="page" />
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr");%>

<%
 	dao.deleteProduct(Integer.parseInt(request.getParameter("pNum")));

  %>
	  <meta http-equiv="Refresh" content="0;url=GoodList.jsp" >
