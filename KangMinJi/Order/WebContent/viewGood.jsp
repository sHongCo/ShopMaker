<%
/**
 * @author 강민지
 * @date 17.08.10
 * @File viewGood.jsp
 * 
 * viewGood(상세페이지)
 * -> 바로주문하기 탭으로 이동
 */
 
 %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


 
<%
int pNum = Integer.parseInt(request.getParameter("pNum"));
System.out.println(pNum);
DAO dao = new DAO();
pvo = dao.getProduct(pNum);
%>

<h1>제품 정보</h1>
<br />
<table border=1 width="700px" cellspacing=0>

<form method=post action="orderForm.jsp">
	<tr>
		<td width="150">제품 ID번호</td>
		<td colspan="3"><%=pvo.getpNum()%></td>
		<input type=hidden name=pNum value="<%=pvo.getpNum()%>"> 
	</tr>
	<tr>
		<td>제품명</td>
		<td colspan="3"><%=pvo.getpProduct()%></td>
		<input type=hidden name=pProduct value="<%=pvo.getpProduct()%>">
	</tr>
	<tr>
		<td>가격</td>
		<td colspan="3"><%=pvo.getpPrice()%>원</td>
		<input type=hidden name=pPrice value="<%=pvo.getpPrice()%>">
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
		<td colspan="3"><img src="images/1.jpg" width="360ox"
			height="360px"></td>
	</tr>
</table>
	 <input	type=submit value="주문하기">
 	 <input type="button" value="상품목록으로 돌아가기" onClick="location.href='viewGoodList.jsp'";>
</form>
<br>
