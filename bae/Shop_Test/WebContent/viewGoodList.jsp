<!-- 
상품리스트를 보여주는곳 / Good -> Goods / 이미지별로 사진 첨부 / Btn 이미지 수정
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="shop" class="shop.PVO" scope="page" />
<%@ page import="java.io.PrintWriter"%>
<%@ page import="shop.DAO"%>
<%@ page import="shop.PVO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 목록</title>

<link rel="stylesheet" type="text/css"
	href="resources/css/goods_basket.css">

</head>
<body>
	<%
	
	
	
	
	String userID = request.getParameter("uId");
	String password = request.getParameter("password");
	session.setAttribute("uId", userID);
	System.out.println("세션 로그 userID:" + userID);
	System.out.println("세션 로그 userPASSWORD:" + password);
	
	
	
	
		String pNum = null;
		if (session.getAttribute("pNum") != null) {
			pNum = (String) session.getAttribute("pNum");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
	%>
	<h1 class="bor_btm266 m_bottom20">판매목록</h1>
	<table border="1">
		<%
			DAO dao = new DAO();
			ArrayList<PVO> list = dao.getList(pageNumber);
			for (int i = 0; i < list.size(); i++) {
				PVO pvo = list.get(i);
		%>
		<tr>
			<th>제품 ID번호</th>
			<th>제품 이미지</th>
			<th>제품명</th>
			<th>가격</th>
		</tr>
		<tr>
			<td><%=pvo.getpNum()%></td>
			<td><a> <img src="images/1.jpg" width="120px" height="110px">
			</a></td>
			<td>


 		<a href="viewGood.jsp?pNum=<%=pvo.getpNum()%>">
 		<input type="button"  value="<%=pvo.getpProduct()%>"> </a>
 
 
			</td>
			<td><%=pvo.getpPrice()%>원</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
