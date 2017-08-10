<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String did = null;
	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 deleteCheck.jsp userID:" + did);
	String didCheck = did;
	////////////////////////////////////////////////////////

	int pNum = Integer.parseInt(request.getParameter("productName")); // String -> Int
	int pPrice = Integer.parseInt(request.getParameter("pPrice"));
	int oQuan = Integer.parseInt(request.getParameter("productCount"));
	
	
	
	String pProduct = request.getParameter("pProduct");
	System.out.println("pNum : " + pNum);
	/* int wishListpNum = Integer.parseInt(productName); */
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////
	String []checksNum = request.getParameterValues("checks");
	
	 for(int i=0; i<checksNum.length; i++){
	
		// System.out.println("delete dnum : " + dnum[i]);
			
		System.out.println("checks i : " + checksNum[i]);
		DAO dao = new DAO();
		dao.deleteWishList(checksNum[i]);
	} 
	 
	 for(int i=0; i<checksNum.length; i++){
			System.out.println("Del checks i :" + checksNum[i]);	
		} 
	
%>

<%-- 
	<%
	DAO dao = new DAO();
	PVO pvo = dao.getNum(pNum);
	
	
	%> --%>
<%-- 	<input type="hidden" name="productName" value="<%=pvo.getpProduct()%>">

	<input type="hidden" name="pPrice" value="<%=pvo.getpPrice()%>">

	<input type="hidden" name="productCount" value="<%=pvo.getpQuan()%>">

	<input type="hidden" name="pProduct" value="<%=pvo.getpProduct()%>">

	<input type="hidden" name="test" value="18">	
 --%>
<script language=javascript>
   self.window.alert("삭제하였습니다.");
   location.replace('wishList2.jsp');
  </script>