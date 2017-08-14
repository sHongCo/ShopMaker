<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shop</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/mobile.css">
<script src="js/mobile.js" type="text/javascript"></script>
</head>
<body>
	<%
		Object id;
		String uId;
		if (session.getAttribute("uId") == null) // 로그인이 안되었을 때
		{
			// 로그인 헤더
	%>
	<div id="page">
		<div id="header">
			<div>
				<ul id="login" class="login">
					<li class="login"><a href="login.jsp">로그인 &nbsp;&nbsp;|</a> <a
						href="join.jsp">회원가입</a>
						<hr></li>
				</ul>
			</div>
		</div>
	</div>
	<%
		} else // 로그인 했을 경우
		{
			id = session.getValue("uId");
			uId = id.toString();
	%>
	<div id="page">
		<div id="header">
			<div>
				<%
					if (uId.equals("master")) {
				%>
				관리자 페이지 &nbsp;&nbsp; | <a href="main.jsp">MAIN</a>&nbsp;&nbsp;|
				&nbsp; <a href="viewGoodList.jsp">GoodsList</a>&nbsp;&nbsp;| &nbsp;
				<a href="orderList.jsp">&nbsp; 주문상황 </a>&nbsp;&nbsp;| &nbsp; <a
					href="GoodList.jsp">&nbsp; 재고관리 </a>&nbsp;&nbsp;| &nbsp; <a
					href="logoutAction.jsp">&nbsp; LogOut</a>
				<%
					} else {
				%>
				<%=uId%>
				님 페이지 &nbsp;&nbsp;| <a href="main.jsp">MAIN</a>&nbsp;&nbsp;| &nbsp;
				<a href="viewGoodList.jsp">GoodsList</a>&nbsp;&nbsp;| &nbsp; <a
					href="wishList2.jsp"> &nbsp; 장바구니 | </a>&nbsp;&nbsp;| &nbsp; <a
					href=#>&nbsp; 주문내역 | </a>&nbsp;&nbsp;| &nbsp; <a href=#>&nbsp;
					회원정보 | </a>&nbsp;&nbsp;| &nbsp; <a href="logoutAction.jsp">&nbsp;
					LogOut</a>
				<%
					}
				%>
				<hr>
				</li>
				</ul>
			</div>
		</div>
	</div>
	<%
		} //반복문 끝.
	%>