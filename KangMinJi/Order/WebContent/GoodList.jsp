<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<jsp:useBean id="dao" class="data.DAO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
<%@ page import="java.util.ArrayList"%>

<%
		Object id;
		String uid="BBEBBE";
        /*if(session.getAttribute("uid") == null) // 로그인이 안되었을 때
        {  
			<script language="javascript">
			<!--
			 alert("로그인 하세요!");
			 history.go(-1);
			-->
			</script>
        }
        else // 로그인 했을 경우
        {
        	id=session.getValue("uid");
        	uid=id.toString();
        }
*/
%>

<%

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 목록</title>

<link rel="stylesheet" type="text/css"
	href="resources/css/goods_basket.css">

</head>
<body>

	<h1 class="bor_btm266 m_bottom20">판매목록</h1>
	<table border="1">
		<tr>
			<th>제품 ID번호</th>
			<th>제품 이미지</th>
			<th>제품명</th>
			<th>제품수량</th>
			<th>가격</th>
		</tr>
		<%
			ArrayList<PVO> list = dao.getGoodList();
			for (int i = 0; i < list.size(); i++) {
				pvo = list.get(i);
		%>
		<tr>
			<form action="modify.jsp" onsubmit="return writeSave()">
			<td><input type= "hidden" name="pNum" value="<%=pvo.getpNum()%>"><%=pvo.getpNum()%></td>
			<td><a> <img src="images/1.jpg" width="120px" height="110px">
			</a></td>
			<td><%=pvo.getpProduct()%></td>
			<td><input type = "text" name="pQuan" value="<%=pvo.getpQuan()%>">개</td>
			<td><input type = "text" name="pPrice" value="<%=pvo.getpPrice()%>">원</td>
			<td><input type="submit" id="submit" value="수정" >
			</form>
			<input type="button" name="delete" value="삭 제" onClick="location.href='deleteGoodsPro.jsp?pNum=<%=pvo.getpNum()%>'"></td>
		</tr>
		<%
			}
		%>
		<tr>
		<input type="button" value="제품추가" onClick="location.href='addGoods.jsp'">
		</tr>
	</table>
</body>
</html>
