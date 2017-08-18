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

	<section id="content">
		<div class="main">
			<div class="container">	
	<h3 class="prev-indent-bot">주문 내역</h3>

	<!--  세번째 -->

		<table width="800" border="1">
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
			<tr>
			<table width="600" > 
			<tr>
				<td>주문날짜</td>
				<td colspan="3"><%=ovo2.getoDate()%></td>
			</tr>
				<tr>
				<td>고객이름</td>
				<td colspan="3"><%=ovo2.getoName()%>&nbsp;님</td>
			</tr>

			<tr>
				<td>고객 전화번호</td>
				<td colspan="3"><%=ovo2.getoPhone()%></td>
			</tr>

			<tr>
				<td>고객주소</td>
				<td colspan="3"><%=ovo2.getoAdd()%></td>
			</tr>
			<hr>
			</table>
			</tr>
			<%
			}
			System.out.println("gg");

			%>
			<table width="500" border="1">
			<tr>
				<td>주문번호</td>
				<td colspan="3"><%=ovo2.getoNum()%></td>
			</tr>
			<tr>
				<td>주문상품이름</td>
				<td colspan="3"><%=ovo2.getoProduct()%></td>
				
			</tr>
			<tr>
				<td>주문상품가격</td>
				<td colspan="3"><%=ovo2.getoPrice()%> 원</td>
			</tr>

			<tr>
				<td>주문수량</td>
				<td colspan="3"><%=ovo2.getoQuan()%> 개</td>
			</tr>
				
</table>
			<%
				}
			%>

		</table>
		</div>
		<!-- 채팅 -->
		<div>
		<%@ include file = "livechat.jsp" %>
		</div>
			</div>
				</section>
</html>
