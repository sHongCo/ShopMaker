<%
/**
 * @author 강민지
 * @date 17.08.10
 * @File viewGoodList.jsp
 * 
 * 판매목록 페이지(상품 고를 때 첫 화면)
 * -> viewGood(상세페이지)로 이동.
 */
 
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>

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
			ArrayList<PVO> list = dao.getGoodList();
			for (int i = 0; i < list.size(); i++) {
				pvo = list.get(i);
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
