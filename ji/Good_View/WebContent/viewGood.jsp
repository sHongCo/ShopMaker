<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="shop.DAO" %> 
<%@ page import="shop.PVO" %>   
<%@ page import="java.util.ArrayList" %>    
<% int pNum = Integer.parseInt(request.getParameter("pNum"));%>
<%
    		DAO dao = new DAO();
    		ArrayList<PVO> list = dao.getList(1);			
%>
<jsp:useBean id="shop" class="shop.PVO" scope="page" />    
<h1> 제품 정보</h1>
<br>
<table border=1 width="700" cellspacing=0>
 <tr>
  <td width="150">제품 ID번호</td>
  <td colspan="3"><%=list.get(pNum-1).getpNum() %></td>
 </tr>
 <tr>
  <td>제품명</td> 
   <td colspan="3"><%=list.get(pNum-1).getpProduct() %></td>
 </tr>
 <tr>
  <td>가격</td> 
  <td colspan="3"><%=list.get(pNum-1).getpPrice() %>원</td>
 </tr>
 <tr>
  <td>제고량</td>
  <td colspan="3"><%=list.get(pNum-1).getpQuan() %>개</td>
 </tr>
	
 <tr>
  <td>희망 주문량</td>
  <td colspan="3"><input type="text" name="oQuan">개</td>
 </tr>
 <tr>
  <td>사진</td>
  <td colspan="3"><img src="images/1.jpg" width="360ox" height="360px"></td>
 </tr> 
</table>

<br>
<form method=post action=Cart>
<input type=hidden name=pNum value="<%=list.get(pNum-1).getpNum() %>">
<input type=hidden name=pProduct value="<%=list.get(pNum-1).getpProduct() %>">
<input type=hidden name=pPrice value="<%=list.get(pNum-1).getpPrice() %>">
<input type=submit value="장바구니에 담기">
<input type ="button" value = "상품목록으로 돌아가기" onClick ="location.href='viewGoodList.jsp'">
</form>