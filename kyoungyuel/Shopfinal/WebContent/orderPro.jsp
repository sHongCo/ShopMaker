<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "data.DAO" %>
<%@ page import = "data.PVO" %>
<%@ page import = "data.DVO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="ovo" scope="page" class="data.OVO">
   <jsp:setProperty name="ovo" property="*"/>
</jsp:useBean>
<%
  int oQuan = Integer.parseInt(request.getParameter("oQuan"));
  int oPrice = Integer.parseInt(request.getParameter("oPrice"));
  String dnum = request.getParameter("dnum");
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
  System.out.println("�ֹ��Ϸ�!"+ovo.getoNum());
  
  //�ֹ��� ��ŭ ��� ����!
  PVO pvo= dbPro.getProduct(ovo.getoProduct());
  int res_Quan= pvo.getpQuan();
  res_Quan -= ovo.getoQuan();
  pvo.setpQuan(res_Quan); 
 	
  dbPro.modifyProduct(pvo);
  
  //�ֹ��� ��ٱ��� ����!
  dbPro.deleteWishList(dnum); 
  
  %>
	  <meta http-equiv="Refresh" content="0;url=result.jsp?oNum=<%=ovo.getoNum()%>" >
