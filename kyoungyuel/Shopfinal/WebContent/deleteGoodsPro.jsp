<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "data.DAO" %>
<jsp:useBean id="dao" class="data.DAO" scope="page" />
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
 	dao.deleteProduct(Integer.parseInt(request.getParameter("pNum")));

  %>
	  <meta http-equiv="Refresh" content="0;url=GoodList.jsp" >
