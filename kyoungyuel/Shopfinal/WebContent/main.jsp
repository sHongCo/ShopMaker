<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<title>메인 페이지</title>
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
</head>

<%@ include file="header.jsp"%>
<body id="page3">

	<!--==============================header=================================-->
	<header>
		<%
			String userID = null;					
			if (session.getAttribute("uId") != null) {
				userID = (String) session.getAttribute("uId");
			if(userID.equals("master")){ %>

		<div class="row-top">
			<div class="main">
				<div class="wrapper">
					<h1>
						<a href="main.jsp"><span>피자</span>사가라</a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a class="active" href="main.jsp">메인</a></li>
							<li><a href="GoodList.jsp">재고관리</a></li>
							<li><a href="orderList.jsp">주문상황</a></li>
							<li><a href="viewGoodList.jsp">제품보기</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<%}else{%>

		<div class="row-top">
			<div class="main">
				<div class="wrapper">
					<h1>
							<a href="main.jsp"><span>피자</span>사가라</a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a class="active" href="main.jsp">메인</a></li>
							<li><a href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
							<li><a href="order.jsp">주문내역</a></li>
							<li><a href="mapList.jsp">매장찾기</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</div>
		<%}
			}else{%>

		<div class="row-top">
			<div class="main">
				<div class="wrapper">
					<h1>
			<a href="main.jsp"><span>피자</span>사가라</a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a class="active" href="main.jsp">메인</a></li>
							<li><a href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
							<li><a href="order.jsp">주문내역</a></li>
							<li><a href="mapList.jsp">매장찾기</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<%}%>

		<div class="row-bot">
			<div class="row-bot-bg">
				<div class="main">

					<div class="slider-wrapper">
						<div class="slider">
							<ul class="items">
								<li><img src="images/slider-img1.jpg" alt="" /></li>
								<li><img src="images/slider-img2.jpg" alt="" /></li>
								<li><img src="images/slider-img3.jpg" alt="" /></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!--==============================content================================-->
	<section id="content">
		<div class="ic"></div>
		<div class="main">
			<div class="wrapper img-indent-bot">
				<article class="col-1">
					<img class="img-border" src="images/banner-1.jpg" alt="">
				</article>
				<article class="col-1">
					<img class="img-border" src="images/banner-2.jpg" alt="">
				</article>
				<article class="col-2">
					<img class="img-border" src="images/banner-3.jpg" alt="">
				</article>
			</div>
		</div>

		<!-- 채팅 -->
		<div>
			<%@ include file="livechat.jsp"%>
		</div>
	</section>

	<!--==============================footer=================================-->
	<footer>
		<div class="main">
			<div class="aligncenter">
				<span>#Maker</span> Website Template by <a class="link"
					href="http://www.templatemonster.com/" target="_blank"
					rel="nofollow">TemplateMonster.com</a>
				<div>
					<%@ include file="sns.jsp"%>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		Cufon.now();
	</script>
	<script type="text/javascript">
		$(window).load(function() {
			$('.slider')._TMS({
				duration : 1000,
				easing : 'easeOutQuint',
				preset : 'slideDown',
				slideshow : 7000,
				banners : false,
				pauseOnHover : true,
				pagination : true,
				pagNums : false
			});
		});
	</script>
</body>
</html>