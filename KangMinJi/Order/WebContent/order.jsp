<!--  주문내역 페이지 / 회원가입 폼에서 DB입력한 값을 가져와 내용 출력해줘야 함
	Order_F/ordersForm.jsp에 붙여야 함
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

	String productName = request.getParameter("productNames");
	int productCount = Integer.parseInt(request.getParameter("productCount"));
	int productPrice = Integer.parseInt(request.getParameter("pPrice"));

	DAO dao = new DAO();
	OVO ovo = new OVO();
	dao.orderCheck(ovo, did, productName, productCount, productPrice);
	// wishList2 에서 주문확인 누르면 order테이블에 저장
	/* System.out.println("productName : " + productName);
	System.out.println("productPrice : " + productPrice);
	System.out.println("productCount : " + productCount); */
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>order.jsp</title>
</head>
<body>
	wishList2.jsp에서 값을 가져와 order 테이블에 값 저장완료
	<h1 class="bor_btm266 m_bottom20">주문 내역</h1>

	<!--  세번째 -->
	<form action="ordersForm.jsp" method="post">

		<table width="800" border="1">

			<%
				ArrayList<OVO> list = dao.orderOutputData(did);
				for (int i = 0; i < list.size(); i++) {

					OVO ovo2 = list.get(i);
			%>
			<tr>
				<td>고객이름</td>
				<td colspan="3"><%=ovo2.getoName()%>&nbsp;님</td>
			</tr>

			<tr>
				<td>고객ID</td>
				<td colspan="3"><%=ovo2.getoId()%></td>
			</tr>

			<tr>
				<td>고객 전화번호</td>
				<td colspan="3"><%=ovo2.getoPhone()%></td>
			</tr>

			<tr>
				<td>고객주소</td>
				<td colspan="3"><%=ovo2.getoAdd()%></td>
			</tr>

			<tr>
				<td>주문상품이름</td>
				<td colspan="3"><%=ovo2.getoProduct()%></td>
				<input type=hidden name=oProduct value="<%=ovo2.getoProduct()%>">
				
			</tr>
			<tr>
				<td>주문상품가격</td>
				<td colspan="3"><%=ovo2.getoPrice()%> 원</td>
					<input type=hidden name=oPrice value="<%=ovo2.getoPrice()%>">
			</tr>

			<tr>
				<td>주문수량</td>
				<td colspan="3"><%=ovo2.getoQuan()%> 개</td>
				<input type=hidden name=oQuan value="<%=ovo2.getoQuan()%>">
			</tr>


			<tr>
				<td>주문날짜</td>
				<td colspan="3"><%=ovo2.getoDate()%></td>
		</tr>

			<%
				}
			%>

		</table>
		<input type="submit" value="ordersForm.jsp">
	</form>

</body>
</html>