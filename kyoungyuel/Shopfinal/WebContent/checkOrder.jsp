<!--  주문내역 페이지 / 회원가입 폼에서 DB입력한 값을 가져와 내용 출력해줘야 함
	Order_F/ordersForm.jsp에 붙여야 함
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%
	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 order.jsp userID:" + did);
	String didCheck = did;

	
	DAO dao = new DAO();
	OVO ovo = new OVO();

	String Date = request.getParameter("oDate");
	Timestamp oDate = Timestamp.valueOf(Date);
%>



<html>
<head>

<title>order.jsp</title>
</head>
<%@ include file="header.jsp" %> 
 <body id="page1">
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

	<section id="content">
		<div class="main">
			<div class="container">	
				<h3 class="prev-indent-bot">주문 내역</h3>

			<div class="wrapper">			
				<article class="col-2" >
				<div class="maxheight indent-bot" >
	<!--  세번째 -->

			<%
			System.out.println(oDate);
				ArrayList<OVO> list = dao.orderOutputData(did,oDate);
			%>
		
		
			<%
			System.out.println(list.size());
				for (int i = 0; i < list.size(); i++) {
					System.out.println("ff");

					OVO ovo2 = list.get(i);
			%>
			<%
			if(i==0){
			%>
			
			<ul class="price-list p2">
			<li><b>주문날짜</b><span><%=ovo2.getoDate()%></span></li>
			<li><b>고객이름</b><span><%=ovo2.getoName()%>&nbsp;님</span></li>
			<li><b>고객 전화번호</b><span><%=ovo2.getoPhone()%></span></li>
			<li><b>고객 주소</b><span><%=ovo2.getoAdd()%></span></li></ul>
			<hr>
		
			<%
			}
			System.out.println("gg");

			%>
			<table width="300" border="1">
			<tr>
				<td><b>* &nbsp;주문번호</b></td>
				<td colspan="3" align="right"><%=ovo2.getoNum()%></td>
			</tr>
			<tr>
				<td><b>* &nbsp;주문상품 이름</b></td>
				<td colspan="3" align="right"><%=ovo2.getoProduct()%></td>
				
			</tr>
			<tr>
				<td><b>* &nbsp;주문상품 가격</b></td>
				<td colspan="3" align="right"><%=ovo2.getoPrice()%> 원</td>
			</tr>

			<tr>
				<td><b>* &nbsp;주문수량</b></td>
				<td colspan="3" align="right"><%=ovo2.getoQuan()%> 개</td>
			</tr>
			</table>
			<hr>
				
			<%
				}
			%>

		</div>
		</article>
		</div>
		</div>
		<!-- 채팅 -->
		<div>
		<%@ include file = "livechat.jsp" %>
		</div>
			</div>
				</section>
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
