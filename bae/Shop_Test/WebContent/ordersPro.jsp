<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "shop.DAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr");%>
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
  System.out.println(ovo.getoNum());
  %>
	  <meta http-equiv="Refresh" content="0;url=result.jsp?oNum=<%=ovo.getoNum()%>" >
	  