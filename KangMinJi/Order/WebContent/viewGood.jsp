<!-- 제품 상세포기 페이지 / Good -> Goods / 희망주문량 text -> Scroll -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="shop" class="shop.PVO" scope="page" /> --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
	 <body>
	 	<%@ include file="header.jsp" %>
<%
	int pNum = Integer.parseInt(request.getParameter("pNum"));

	System.out.println("int pNum Good.jsp pNum : " + pNum); // 1

	DAO dao = new DAO();
	PVO pvo = dao.getNum(pNum);
%>

<h1 class="bor_btm266 m_bottom20">상세보기</h1>
<br />
<form action="wishList2.jsp" method="post">





	<table border=1 width="700px" cellspacing=0>




		<tr>
			<td width="150">제품 ID번호</td>
			<td colspan="3"><%=pNum%></td>
		</tr>
		<tr>
			<td>제품명</td>
			<td colspan="3"><%=pvo.getpProduct()%></td>
		</tr>
		<tr>
			<td>가격</td>
			<td colspan="3"><%=pvo.getpPrice()%>원</td>
		</tr>
		<tr>
			<td>재고량</td>
			<td colspan="3"><%=pvo.getpQuan()%>개</td>
		</tr>

		<tr>

			<td>희망 주문량</td>
			<td colspan="3"><input type="text" name="oQuan">개</td>


		</tr>

		<tr>
			<td>사진</td>
			<td colspan="3"><img src="images/1.jpg" width="360px"
				height="360px"></td>
		</tr>
	</table>
	<br>

	<input type=hidden name=pProduct value="<%=pvo.getpProduct()%>">
	<input type=hidden name=pPrice value="<%=pvo.getpPrice()%>">

	<!-- 1수정 -->
	<input type="hidden" name=pNum value="<%=pNum%>">


	<input type=submit value="장바구니 확인" > <input type="button"
		value="상품목록으로 돌아가기" onClick="location.href='viewGoodList.jsp'">

</form>
</body>
