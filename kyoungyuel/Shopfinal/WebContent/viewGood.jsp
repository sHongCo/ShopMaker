<!-- 제품 상세포기 페이지 / Good -> Goods / 희망주문량 text -> Scroll -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="data" class="data.PVO" scope="page" /> --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>

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
<%
	int pNum;
	Enumeration<String> para = request.getParameterNames();

	String errMsg = (String) request.getAttribute("errMsg");
	if (errMsg == null) {
		errMsg = "";
	}
%>

<style type="text/css">
#error {
	color: red;
	font-size: 10pt;
}
</style>
<br>
<!-- <form action="wishList2.jsp" method="post">
 -->
<!-- /////////////////////////////////////////////// -->	
	 	<%@ include file="header.jsp" %> 
 <body id="page3">
	<header>
	
	
		<%
			String userID = null;
			if (session.getAttribute("uId") != null) {
				userID = (String) session.getAttribute("uId");
			
			
if(userID.equals("master")){%>
			
			<div class="row-top">
			<div class="main">
				<div class="wrapper">
					<h1>
						<a href="main.jsp"><span>피자</span>사가라</a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a href="main.jsp">메인</a></li>
							<li><a href="GoodList.jsp">재고관리</a></li>
							<li><a href="orderList.jsp">주문상황</a></li>
							<li><a class="active" href="viewGoodList.jsp">제품보기</a></li>	
						</ul>
					</nav>
				</div>
			</div>
		</div>
			
			<%
			}else{
		%>
		<div class="row-top">
			<div class="main">
				<div class="wrapper">
					<h1>
				<a href="main.jsp"><span>피자</span>사가라</a>
					</h1>
					<nav>
						<nav>
						<ul class="menu">
							<li><a href="main.jsp">메인</a></li>
							<li><a class="active" href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
							<li><a href="order.jsp">주문내역</a>
							<li><a href="mapList.jsp">매장찾기</a></li>
							
						</ul>
					</nav>
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
							<li><a href="main.jsp">메인</a></li>
							<li><a class="active" href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
							<li><a href="order.jsp">주문내역</a></li>
							<li><a href="mapList.jsp">매장찾기</a></li>
							
						</ul>
					</nav>
								</div>
							</div>
						</div>

			<%}
					%>
	
	
	     <div class="row-bot">
        	<div class="row-bot-bg">
            
          
                	
              
          </div>
        </div>
	

	
	</header> 
<!-- /////////////////////////////////////////////// -->	
<%
	while (para.hasMoreElements()) {
		String names = para.nextElement();

		if (names.equals("pNum")) {

			pNum = Integer.parseInt(request.getParameter("pNum"));

			DAO dao3 = new DAO();
			PVO pvo = dao3.getNum(pNum);

			System.out.println("viewGood pvo.getpNum() : " + pvo.getpNum()); //

			//int pNum = Integer.parseInt(request.getParameter("pNum"));

			/* DAO dao3 = new DAO();
			PVO pvo = dao3.getNum(pNum);
			 */
%>
<section id="content">
		<div class="main">
			<div class="container">
			
	
	<!-- <h3 class="prev-indent-bot">상세보기</h3> -->
	<h3 class="prev-indent-bot">상세보기</h3>

                                <div class="wrapper">
									<article class="col-1">
									<div class="img-indent-bot">
									<img src="images/<%=pvo.getpProduct() %>.jpg" alt="">
									</div>
									</article>
                                    <article class="col-2">
                                    <div class="maxheight indent-bot">
   									<form name="myForm" action="quanCheck.jsp" method="post">
                                    <ul class = "price-list p2">
                                    
                                    <li>제품 번호<span><%=pNum%></span></li>
                                    <li>제품명<span><%=pvo.getpProduct()%></span></li>
                                    <li>가격<span><%=pvo.getpPrice()%>원</span></li>
                                    <div id="error"><%=errMsg%></div> 
                                    <li>재고량<span><%=pvo.getpQuan()%>개</span></li>
                                    <li>희망 주문량<span>	
                                    <select name="oQuan">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select></li>
                                 
                                 	</ul>
                               		<input type=hidden name=pProduct value="<%=pvo.getpProduct()%>">
									<input type=hidden name=pPrice value="<%=pvo.getpPrice()%>">
									<input type=hidden name=pQuan value="<%=pvo.getpQuan()%>">

	<!-- 1수정 -->
									<input type="hidden" name=pNum value="<%=pNum%>">
 								  
 								  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 								  	<input type=submit style= "outline-style: text-decoration:none" class="button-1" value="장바구니 확인" >
 									<input type="button" class="button-1" onClick="location.href='viewGoodList.jsp'" value="상품목록으로!">
									</form>
									</div>
									</article>
									</div>
									</div>
  
<%
		} else {

			}
		}
	%>

	<!--  SNS  -->
<div>
	<%@ include file="reView.jsp"%>
	</div>
		<!-- 채팅 -->
		<div>
		<%@ include file = "livechat.jsp" %>
		</div>
									</div>
									</section>
		
		<!--==============================footer=================================-->
    <footer>
        <div class="main">
        	<div class="aligncenter">
            	<span>#Maker</span>
                Website Template by <a class="link" href="http://www.templatemonster.com/" target="_blank" rel="nofollow">TemplateMonster.com</a>
		<div>
		<%@ include file = "sns.jsp" %>
		</div>	
            </div>
        </div>
    </footer>
		
	
</body>
<!--<form action="quanCheck.jsp" method="post">
	<table border=1 width="700px" cellspacing=0>




		<tr>
			<td width="150">제품 ID번호</td>
			
</div>
-->