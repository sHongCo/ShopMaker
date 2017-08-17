<!-- 장바구니 내역 페이지 /  제품이름과 사진 같이 나오게 /    -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>



<%
	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 wishList2.jsp userID:" + did);
	String didCheck = did;

	/////////////////////////////////////////////////////////////
	//	int pPrice = Integer.parseInt(request.getParameter("pPrice"));
	int pPrice;
	//	int productCount = Integer.parseInt(request.getParameter("oQuan"));
	int productCount;
	Enumeration<String> para = request.getParameterNames();

	String productName = (String) (request.getParameter("pNum"));
	String pProduct = request.getParameter("pProduct");

	System.out.println("wishList2 pNum : " + productName);
	System.out.println("wishList2 pProduct : " + pProduct);

	//	int wishListpNum = Integer.parseInt(productName);
	int wishListpNum;

	DAO dao = new DAO();
	PVO pvo = new PVO();
	DVO dvo = new DVO();

	while (para.hasMoreElements()) {
		String names = para.nextElement();

		if (names.equals("pPrice")) {
			pPrice = Integer.parseInt(request.getParameter("pPrice"));
			productCount = Integer.parseInt(request.getParameter("oQuan"));
			wishListpNum = Integer.parseInt(productName);
			dao.inputData(pvo, pProduct, productCount, pPrice, did);

		} else {
			pPrice = dvo.getDprice();
			productCount = dvo.getDcount();
			wishListpNum = dvo.getDnum();
		}

	}

	//dao.inputData(pvo, pProduct, productCount, pPrice, did);

	/* 	DAO dao = new DAO();
		PVO pvo = new PVO();
	 */
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wishList.jsp</title>



<script type="text/javascript">
	function mySubmit(index) {
		if (index == 1) {
			//  document.myForm.action='order.jsp';
			document.myForm.action = 'ordersForm.jsp';
		}
		if (index == 2) {
			document.myForm.action = 'deleteCheck.jsp';
		}
		document.myForm.submit();
	}
</script>

<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/layout.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css"
	media="screen">






</head>
<body id="page3">
<%@ include file="header.jsp"%>
	<header>
	<div class="row-top">
		<div class="main">
			<div class="wrapper">
				<h1>
			<a href="main.jsp"><span>피자</span>사가라</a>
				</h1>
			<nav>
						<ul class="menu">
							<li><a href="main.jsp">메인</a></li>
							<li><a href="viewGoodList.jsp">메뉴</a></li>
							<li><a class="active" href="wishList2.jsp">장바구니</a></li>
							<li><a href="order.jsp">주문내역</a>
							<li><a href="mapList.jsp">매장찾기</a></li>
							
						</ul>
					</nav>
			</div>
		</div>
	</div>
	<div class="row-bot">
		<div class="row-bot-bg">
			<div class="main">
				<h2>
					<span></span>
				</h2>
			</div>
		</div>
	</div>

	</header>

	<!-- //////////////////////////////////////////////////////////////////////////// -->

	<section id="content">
	<div class="main">
		<div class="container">

			<h3 class="prev-indent-bot">장바구니</h3>


			<div class="wrapper">
				<article class="col-1">
				<div class="img-indent-bot"></div>
				</article>
				<article class="col-2">
				<div class="maxheight indent-bot">

					<!--  세번째 -->
					<form name="myForm" action="order.jsp" method="post">
						<ul class="price-list p2">


							<%
								ArrayList<DVO> list = dao.outputData(did);
								for (int i = 0; i < list.size(); i++) {
									dvo = list.get(i);
							%>

							<img src="images/<%=dvo.getDname()%>.jpg" alt="">
							<input type="checkbox"
								style="outline-style: text-decoration:none" class="button-1"
								name="checks" value="<%=dvo.getDnum()%>">삭제

							<li>제품 이름<span><%=dvo.getDname()%></span></li>

							<li>가격<span><%=dvo.getDprice()%>원</span></li>


							<li>희망주문량<span><%=dvo.getDcount()%>개</span></li>






							<!-- onclick='mySubmit(2)' -->
							<!--값 전송을 위함  -->

							<input type="hidden" name="dnum" value="<%=dvo.getDnum()%>">

							<input type="hidden" name=pPrice value="<%=dvo.getDprice()%>">


							<input type="hidden" name="productCount"
								value="<%=dvo.getDcount()%>">

							<input type="hidden" name="productName"
								value="<%=dvo.getDnum()%>">

							<input type="hidden" name="productNames"
								value="<%=dvo.getDname()%>">

							<%
								}
							%>
							<br>
							<input type="button" style="outline-style: text-decoration:none"
								class="button-1" value="주문하기" onclick='mySubmit(1)'>
							<input type="button" class="button-1" value="삭제"
								onclick='mySubmit(2)'>
					</form>

					<input type="button" class="button-1" value="쇼핑 더하기"
						onClick="history.go(-2)">





					<div>
						<%@ include file="livechat.jsp"%>
									</section>

					<!--==============================footer=================================-->
					<footer>
					<div class="main">
						<div class="aligncenter">
							<span>#Maker</span> Website Template by <a
								class="link" href="http://www.templatemonster.com/"
								target="_blank" rel="nofollow">TemplateMonster.com</a>
							<div>
								<%@ include file="sns.jsp"%>
							</div>
						</div>
					</div>
					</footer>
</body>
</html>