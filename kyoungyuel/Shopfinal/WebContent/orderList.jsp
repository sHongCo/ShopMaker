<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "data.OVO" %>
<%@ page import = "data.DAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.ArrayList" %>

<%@ include file = "header.jsp" %>

<head>
<title>주문하기</title>
<meta charset="UTF-8">

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


<body>


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
							<li><a href="GoodList.jsp">재고관리</a></li>
							<li><a class="active"  href="orderList.jsp">주문상황</a></li>
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
						<span></span>
					</h2>
				</div>
			</div>
		</div>
	</header>

<section id="content">
		<div class="main">
	<div class="container">	











<h3 class="prev-indent-bot">주문목록</h3>


<table border=1 width="500px" cellspacing=0>
	<tr>
		<td>주문번호</td><td>주문자 아이디</td>
		<td>주문품목</td>	<td>수량</td><td>가격</td><td>주문시간</td>
	</tr>	
<%
	DAO dao = DAO.getDao();
	OVO ovo = new OVO();
	ArrayList<OVO> order= dao.getOrderList();
	int oPrice = 0;
	
	try{
	for(int i=0; i<order.size();i++){
		ovo=order.get(i);
%>
	<tr>
		<td><%=ovo.getoNum() %></td>
		<td><%=ovo.getoId() %></td>
		<td><%=ovo.getoProduct() %></td>
		<td><%=ovo.getoQuan() %></td>
		<td><%=ovo.getoPrice() %></td>
		<td><%=ovo.getoDate() %></td>
	</tr>	
	
	<%
	oPrice += ovo.getoPrice();
	}
	%>
	<tr>
		<td><b>총 매출액</b></td><td><b><%=oPrice %></b></td>
	</tr>
</table>

		

<%
  }catch(Exception e){}
%>
					</div>
					</center>
				
			</div>
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
