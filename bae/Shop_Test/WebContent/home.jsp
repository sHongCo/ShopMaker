<!-- 
로그인 페이지 / 쓸모없음
 -->


<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.*" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Home.jsp</title>
</head>
<body>

	<form action="viewGoodList.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uId"></td>

				<td>비밀번호</td>
				<td><input type="text" name="password"></td>
			</tr>
		
			<tr>
				<td><input type="submit" value="Confirm"></td>
		</table>




	</form>
<div>


</div>

</body>
</html>