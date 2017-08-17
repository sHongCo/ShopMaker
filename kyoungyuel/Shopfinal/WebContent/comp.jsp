<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script src="js/hover-image.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/jquery.bxSlider.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#slider-2').bxSlider({
			pager : true,
			controls : false,
			moveSlideQty : 1,
			displaySlideQty : 4
		});
		$("a[data-gal^='prettyPhoto']").prettyPhoto({
			theme : 'facebook'
		});
	});
</script>


</head>
<%@ include file="header.jsp"%>
<body id="page3">
		<header>
	<div class="row-top">
		<div class="main">
			<div class="wrapper">
				<h1>
					<a href="index.html"><span>이름</span>이름</a>
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
	<div class="aligncenter">
	

			<h3 class="bor_btm266 m_bottom20">회원가입이 완료되었습니다</h3>

		<div class = "wrapper"> 
			
				<article class="col-1">
				<div class="img-indent-bot"></div>
				</article>
				<article class="col-2">
				<div class="maxheight indent-bot">


			<script type='text/javascript'>
				setTimeout("location.href='main.jsp'", 3000);
			</script>
				3초후에 메인으로 이동합니다<br><br>
			<center><a href="main.jsp">홈으로</a></center>


					<div>
						<%@ include file="livechat.jsp"%>
						</div>
						</div>
						</article></div></div>
						
									</section>

					<!--==============================footer=================================-->
					<footer>
					<div class="main">
						<div class="aligncenter">
							<span>Catering.com &copy; 2012</span> Website Template by <a
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








<!-- </head>
<body>

	<table>
		<tr>
			<h1>축하합니다</h1>
		<tr>
		<tr>
			<h3>회원가입이 완료되었습니다</h3>
		</tr>
		<tr>

			<script type='text/javascript'>
				setTimeout("location.href='main.jsp'", 3000);
			</script>

				3초후에 메인으로 이동합니다
			<li><a href="main.jsp">홈으로</a></li>




		</tr>
	</table>

</body>
</html> -->