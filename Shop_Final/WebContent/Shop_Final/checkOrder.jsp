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

	String Date = request.getParameter("oDate");
	Timestamp oDate = Timestamp.valueOf(Date);
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
			<%
			System.out.println(oDate);
				ArrayList<OVO> list = dao.orderOutputData(did,oDate);
			%>
		
		
			<%
			System.out.println(list.size());
				for (int i = 0; i < list.size(); i++) {
					System.out.println("ff");

					OVO ovo2 = list.get(i);
			%>
			<%
			if(i==0){
			%>
			<tr>
			<table width="600" > 
			<tr>
				<td>주문날짜</td>
				<td colspan="3"><%=ovo2.getoDate()%></td>
			</tr>
				<tr>
				<td>고객이름</td>
				<td colspan="3"><%=ovo2.getoName()%>&nbsp;님</td>
			</tr>

			<tr>
				<td>고객 전화번호</td>
				<td colspan="3"><%=ovo2.getoPhone()%></td>
			</tr>

			<tr>
				<td>고객주소</td>
				<td colspan="3"><%=ovo2.getoAdd()%></td>
			</tr>
			<hr>
			</table>
			</tr>
			<%
			}
			System.out.println("gg");

			%>
			<table width="500" border="1">
			<tr>
				<td>주문번호</td>
				<td colspan="3"><%=ovo2.getoNum()%></td>
			</tr>
			<tr>
				<td>주문상품이름</td>
				<td colspan="3"><%=ovo2.getoProduct()%></td>
				
			</tr>
			<tr>
				<td>주문상품가격</td>
				<td colspan="3"><%=ovo2.getoPrice()%> 원</td>
			</tr>

			<tr>
				<td>주문수량</td>
				<td colspan="3"><%=ovo2.getoQuan()%> 개</td>
			</tr>
				
</table>
			<%
				}
			%>

		</table>



</body>
</html>