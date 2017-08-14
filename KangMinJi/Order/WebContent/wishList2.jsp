<!-- 장바구니 내역 페이지 /  제품이름과 사진 같이 나오게 /    -->

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
if(session.getAttribute("uId")==null) // 로그인이 안되었을 때
        {  %>
        <!-- 
		document.write("들어옴!!");
			 alert("로그인 하세요!");
			 history.go(-1);
			 -->
<%	     }
        else // 로그인 했을 경우
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

	System.out.println("세션 로그 wishList2.jsp userID:" + did);
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
	<h1 class="bor_btm266 m_bottom20">장바구니 내역</h1>

	<!--  세번째 -->
<form name="myForm" action="order.jsp" method="post">


	<table border="1">
		<%
			ArrayList<DVO> list = dao.outputData(did);
			for (int i = 0; i < list.size(); i++) {
				 dvo = list.get(i);
		%>
		<tr>
			<td>제품 이름</td>
			<td colspan="3" ><%=dvo.getDname()%></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><%=dvo.getDprice()%>원</td>
		</tr>
		<tr>
			<td>희망주문량</td>
			<td><%=dvo.getDcount()%>개</td>
		</tr>
		<tr>
	<%-- 	<td colspan="3"><input type="checkbox" name = "checks" value="<%=i %>">삭제 <!-- onclick='mySubmit(2)' --></td> --%>
		<td colspan="3"><input type="checkbox" name = "checks" value="<%=dvo.getDnum() %>">삭제 <!-- onclick='mySubmit(2)' --></td>
		</tr>
		<!--값 전송을 위함  -->
	
		<input type="hidden" name="dnum" value="<%=dvo.getDnum() %>">
	
		<input type="hidden" name=pPrice value="<%=dvo.getDprice()%>"></td>
		
		
		<input type="hidden" name="productCount" value="<%=dvo.getDcount()%>"></td>
	
		<input type="hidden" name="productName" value="<%=dvo.getDnum()%>"></td>
		
		<input type="hidden" name="productNames" value="<%=dvo.getDname()%>"></td>
		
		<%
			}
		%>
		
	</table>
	  <input type="button" value="주문확인" onclick='mySubmit(1)'>
	   <input type="button" value="삭제" onclick='mySubmit(2)'>
	  </form>
	  
	
	  
	  
	  
	  
	  
	<input type="button" value="쇼핑 더하기" onClick="history.go(-2)">
</body>
</html>