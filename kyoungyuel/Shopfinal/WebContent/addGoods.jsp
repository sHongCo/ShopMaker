<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
	<jsp:useBean id="pvo" class="data.PVO" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/layout.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css"
	media="screen">
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/FF-cash.js" type="text/javascript"></script>
<script src="js/tms-0.3.js" type="text/javascript"></script>
<script src="js/tms_presets.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/jquery.equalheights.js" type="text/javascript"></script>
<title>상품추가</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>제품 정보</h1>
<header>
		<%
			String userID = null;
			if (session.getAttribute("uId") != null) {
				userID = (String) session.getAttribute("uId");
			}
		%>
		<div class="row-top">
			<div class="main">
				<div class="wrapper">
					<h1>
						<a href="main.jsp">이름<span>이름</span></a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a href="main.jsp">메인</a></li>
							<li><a class="active"  href="GoodList.jsp">재고관리</a></li>
							<li><a href="orderList.jsp">주문상황</a></li>
							<li><a href="viewGoodList.jsp">제품보기</a></li>	
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="row-bot">
			<div class="row-bot-bg">
				<div class="main">
					<h2>
						<span>이름</span>
					</h2>
				</div>
			</div>
		</div>
	</header>
<section id="content">
		<div class="main">
			<div class="container">

<br />
<table border=1 width="700px" cellspacing=0 style="margin-left: 330px; text-align: left;">
<center>
	<h3 class="prev-indent-bot">제품추가</h3>
</center>
<form method=post action="addGoodsPro.jsp">
	<tr>
		<td style="margin-left: 120px;">제품명</td>
		<td colspan="3">
		<input type="text" name=pProduct value=>
		</td>
	</tr>
	<tr>
		<td >가격</td>
		<td colspan="3">
		<input type="text" name=pPrice value=> 원</td>
	</tr>
	<tr>
		<td>재고량</td>
		<td colspan="3">
		<input type="text" name=pQuan  value=> 개</td>
	</tr>

</table>
<br>
<center>
	<input type=submit class="button-1" value="등 록">
	<input type="button" class="button-1" value="상품목록으로 돌아가기" onClick="location.href='GoodList.jsp'";>
</center>
</form>

</div>
</div>
</section>

<footer>
        <div class="main">
        	<div class="aligncenter">
            	<span>Catering.com &copy; 2012</span>
                Website Template by <a class="link" href="http://www.templatemonster.com/" target="_blank" rel="nofollow">TemplateMonster.com</a>
		<div>
		<%@ include file = "sns.jsp" %>
		</div>	
            </div>
        </div>
    </footer>


</body>
</html>