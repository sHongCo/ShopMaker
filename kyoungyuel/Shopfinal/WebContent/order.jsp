
<!-- 고객  주문내역 페이지 / 회원가입 폼에서 DB입력한 값을 가져와 내용 출력해줘야 함
	Order_F/ordersForm.jsp에 붙여야 함
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


<%
	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 order.jsp userID:" + did);
	String didCheck = did;

	
	DAO dao = new DAO();
	OVO ovo = new OVO();

	// wishList2 에서 주문확인 누르면 order테이블에 저장
	/* System.out.println("productName : " + productName);
	System.out.println("productPrice : " + productPrice);
	System.out.println("productCount : " + productCount); */
%>



<html>
<head>

<title>order.jsp</title>
</head>
<body id= "page1">
<%@ include file="header.jsp" %>
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
					<a href="main.jsp"><span>피자</span>사가라</a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a href="main.jsp">메인</a></li>
							<li><a href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
							<li><a class="active" href="order.jsp">주문내역</a></li>
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

	<!--  세번째 -->
	<section id="content">
<div class="main">	
<div class="container">

		<h3 class="prev-indent-bot">주문상황</h3>
		<table width="800" border="1">
		<tr>
		<td>주문번호</td><td>주문자 </td>	<td>주문품목</td><td>주문시간</td>
		</tr>
			<%
				int count = 1;
				ArrayList<OVO> list = 	dao.orderCheck(did); 
				for (int i = 0; i < list.size(); i++) {

					OVO ovo2 = list.get(i);
					if(i!=list.size()-1){
						if(list.get(i).getoDate().equals(list.get(i+1).getoDate())){
						System.out.println("같은 그룹의 주문!");
						++count;
						continue;
						}
					}
			%>
			
				<td><%=ovo2.getoNum()%></td>
				<td><%=ovo2.getoName()%> 님</td>
				<% if(count==1){%>
				<td ><a href="checkOrder.jsp?oDate=<%=ovo2.getoDate()%>"><%=ovo2.getoProduct()%></a></td>
				<% }else{	%>
				<td ><a href="checkOrder.jsp?oDate=<%=ovo2.getoDate()%>"><%=ovo2.getoProduct()%> 외 <%=count-1 %> 개</a></td>
				<% } %>
				<td ><%=ovo2.getoDate()%></td>
				
		</hr>
		</tr>

			<%
				count=1;
				}
			%>

		</table>
		</div>
		</div>
		</section>
		
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
</html>