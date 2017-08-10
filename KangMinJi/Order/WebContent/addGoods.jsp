<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>+
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
	<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품추가</title>
</head>
<body>
<h1>제품 정보</h1>
<br />
<table border=1 width="700px" cellspacing=0>


<form method=post action="addGoodsPro.jsp">

	<tr>
		<td>제품명</td>
		<td colspan="3">
		<input type="text" name=pProduct value=>
		</td>
	</tr>
	<tr>
		<td>가격</td>
		<td colspan="3">
		<input type="text" name=pPrice value=> 원</td>
	</tr>
	<tr>
		<td>재고량</td>
		<td colspan="3">
		<input type="text" name=pQuan value=> 개</td>
	</tr>

</table>
	<input type=submit value="등 록">
	<input type="button" value="상품목록으로 돌아가기" onClick="location.href='GoodList.jsp'";>
</form>
<br>

</body>
</html>