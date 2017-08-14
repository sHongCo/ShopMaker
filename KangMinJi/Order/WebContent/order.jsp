<!--  주문내역 페이지 / 회원가입 폼에서 DB입력한 값을 가져와 내용 출력해줘야 함
	Order_F/ordersForm.jsp에 붙여야 함
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 order.jsp userID:" + did);
	String didCheck = did;

	
	DAO dao = new DAO();
	OVO ovo = new OVO();

	// wishList2 에서 주문확인 누르면 order테이블에 저장
	/* System.out.println("productName : " + productName);
	System.out.println("productPrice : " + productPrice);
	System.out.println("productCount : " + productCount); */
%>



<html>
<head>

<title>order.jsp</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<h1 class="bor_btm266 m_bottom20">주문 내역</h1>

	<!--  세번째 -->

		<table width="800" border="1">
		<tr>
		<td>주문번호</td><td>주문자 </td>	<td>주문품목</td><td>주문시간</td>
		</tr>
			<%
				ArrayList<OVO> list = 	dao.orderCheck(did); 
				for (int i = 0; i < list.size(); i++) {

					OVO ovo2 = list.get(i);
					if(i!=list.size()-1){
						if(list.get(i).getoDate().equals(list.get(i+1).getoDate())){
						System.out.println("같은 그룹의 주문!");
						continue;
						}
					}
			%>
			
				<td colspan="3"><%=ovo2.getoNum()%>&nbsp;</td>
				<td colspan="3"><%=ovo2.getoName()%>&nbsp;님</td>
				<td colspan="3"><a href="checkOrder.jsp?oDate=<%=ovo2.getoDate()%>"><%=ovo2.getoProduct()%></a></td>
				<td colspan="3"><%=ovo2.getoDate()%></td>
				
		<tr><td>------------------------------------------------------------</td></tr>
		</tr>

			<%
				}
			%>

		</table>



</body>
</html>