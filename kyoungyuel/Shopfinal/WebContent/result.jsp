<%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ovo" class="data.OVO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>

<%@ include file="header.jsp" %>
 
<%
int oNum = Integer.parseInt(request.getParameter("oNum"));
System.out.println(oNum);
DAO dao = new DAO();
ovo = dao.getOrder(oNum);
int oPrice=0;
//리퀘스트 파라미터 다 받아오기.
Enumeration<String> para = request.getParameterNames();
//para배열에 있는 갯수많큼 while!
while(para.hasMoreElements()){
	//name에 파라미터name저장.
	String names=para.nextElement();
	//oPrice파라미터가 있으면.
	if(names.equals("oPrice")){
		oPrice=Integer.parseInt(request.getParameter("oPrice"));	
	}else{//oPrice 파라미터가 없으면 ovo객체에서 가져옴
		oPrice=ovo.getoPrice();
	}
}
%>
	
	<script type="text/javascript">



</script>






<h1>제품 정보</h1>
<br />
<table border=1 width="700px" cellspacing=0>



	<tr>
	<td> 주문이 완료되었습니다. </td>
	</tr>
	<tr>
		<td width="150">주문번호</td>
		<td colspan="3"><%=oNum%></td>
	</tr>
	<tr>
		<td>제품명</td>
		<td colspan="3"><%=ovo.getoProduct()%></td>
	</tr>
	<tr>
		<td>결제금액</td>
		<td colspan="3"><%=oPrice%>원</td>
	</tr>
	<tr>
		<td>주문자</td>
		<td colspan="3"><%=ovo.getoName()%></td>
	</tr>

	<tr>
		<td>배달지 정보</td>
		<td colspan="3"><%=ovo.getoAdd() %></td>
	</tr>
	<tr>
		<td>계좌정보</td>
		<td colspan="3">[국민] 310-55-5555112 </td>
	</tr>
</table>
 <input type="button" value="상품목록으로 돌아가기" onClick="location.href='viewGoodList.jsp'";>

<br>
  --%>
  
  
  
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ovo" class="data.OVO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>

<%@ include file="header.jsp" %>

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
int oNum = Integer.parseInt(request.getParameter("oNum"));
System.out.println(oNum);
DAO dao = new DAO();
ovo = dao.getOrder(oNum);
int oPrice=0;
//리퀘스트 파라미터 다 받아오기.
Enumeration<String> para = request.getParameterNames();
//para배열에 있는 갯수많큼 while!
while(para.hasMoreElements()){
	//name에 파라미터name저장.
	String names=para.nextElement();
	//oPrice파라미터가 있으면.
	if(names.equals("oPrice")){
		oPrice=Integer.parseInt(request.getParameter("oPrice"));	
	}else{//oPrice 파라미터가 없으면 ovo객체에서 가져옴
		oPrice=ovo.getoPrice();
	}
}
%>
	
	<script type="text/javascript">



</script>






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
							<li><a href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
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
						<span>이름</span>
					</h2>
				</div>
			</div>
		</div>
	</header>
	
	

<br />
<section id="content">
		<div class="main">
	<div class="container">	
<table border=1 width="700px" cellspacing=0>



	<tr>
	<td> 주문이 완료되었습니다. </td>
	</tr>
	<tr>
		<td width="150">주문번호</td>
		<td colspan="3"><%=oNum%></td>
	</tr>
	<tr>
		<td>제품명</td>
		<td colspan="3"><%=ovo.getoProduct()%></td>
	</tr>
	<tr>
		<td>결제금액</td>
		<td colspan="3"><%=oPrice%>원</td>
	</tr>
	<tr>
		<td>주문자</td>
		<td colspan="3"><%=ovo.getoName()%></td>
	</tr>

	<tr>
		<td>배달지 정보</td>
		<td colspan="3"><%=ovo.getoAdd() %></td>
	</tr>
	<tr>
		<td>계좌정보</td>
		<td colspan="3">[국민] 310-55-5555112 </td>
	</tr>
</table>
 <input type="button" value="상품목록으로 돌아가기" onClick="location.href='viewGoodList.jsp'";>
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
<br>


 