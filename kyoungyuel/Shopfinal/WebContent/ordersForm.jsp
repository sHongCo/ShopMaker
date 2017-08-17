<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


<%@ include file="header.jsp"%>
<%
	//String uid="BBEBBE";

	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 order.jsp userID:" + did);
	String didCheck = did;

	/* 	String oProduct = request.getParameter("oProduct");
		String somePrice = request.getParameter("oPrice");
		String oQuan = request.getParameter("oQuan"); */
%>
<head>
<title>주문하기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<h1>주문목록</h1>
<%
	String[] dnums = request.getParameterValues("dnum");
	DAO dao = new DAO();
	ArrayList<OVO> product = dao.getProductList(did);
	int oPrice = 0;

	try {
		for (int i = 0; i < product.size(); i++) {
			OVO ovo = product.get(i);
%>
<form action="ordersPro.jsp" method="post">
	<table border=1 width="500px" cellspacing=0>
		<tr>
			<td>품명</td>
			<td><%=ovo.getoProduct()%></td>
			<input type=hidden name=oProduct value="<%=ovo.getoProduct()%>">
		</tr>
		<tr>
			<td>가격</td>
			<td><%=ovo.getoPrice()%></td>
			<input type=hidden name=pPrice value="<%=ovo.getoPrice()%>">
		</tr>
		<tr>
			<td>수량</td>
			<td><%=ovo.getoQuan()%></td>
			<input type=hidden name=oQuan value="<%=ovo.getoQuan()%>">
			<input type="hidden" name="dnum" value=<%=dnums[i]%>>
		</tr>
		<%
			oPrice += ovo.getoPrice() * ovo.getoQuan();
					System.out.println("ordersForm oPriced : " + oPrice);
				}
		%>
		<tr>
			<td>총 액</td>
			<td><%=oPrice%></td>
		</tr>
	</table>
	<body>
		<div id="page">

			<div id="body" class="contact">
				<div class="header">
					<div>
						<h1>주문정보</h1>
					</div>
				</div>
				<div class="footer">
					<center>
						<div class="orderPro">
							<h1>INQUIRY FORM</h1>
							<input type="text" name="oName" value="이름"
								onblur="this.value=!this.value?'이 름':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type="text" name="oPhone" value="전화번호"
								onblur="this.value=!this.value?'전화번호':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type="text" name="oAdd" value="주소"
								onblur="this.value=!this.value?'전화번호':this.value;"
								onfocus="this.select()" onclick="this.value='';"> <input
								type=hidden name=oId value="<%=did%>"> <input
								type=hidden name=oPrice value="<%=oPrice%>"> <input
								type="submit" value="결제하기" id="submit">
							<%
								} catch (Exception e) {
								}
							%>
						
</form>
</div>
</center>

</div>
</div>

</div>
</body>
</html>

 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


<%@ include file="header.jsp"%>
<%
	//String uid="BBEBBE";

	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 order.jsp userID:" + did);
	String didCheck = did;

	/* 	String oProduct = request.getParameter("oProduct");
		String somePrice = request.getParameter("oPrice");
		String oQuan = request.getParameter("oQuan"); */
%>
<head>
<title>주문하기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
	<section id="content">
	  <div class="main">
            <div class="wrapper">
				 	<div class="indent-left">
				
			<div>
			<h3 class="p1">주문목록</h3>
			</div>
			<!--  주문목록(장바구니)  -->
	
		<form id="contact-form" method="post" enctype="application/x-www-form-urlencoded" action="ordersPro.jsp">                    
		
		<article class="col-2">
           <ul class = "price-list p2">
<%
	String[] dnums = request.getParameterValues("dnum");
	DAO dao = new DAO();
	ArrayList<OVO> product = dao.getProductList(did);
	int oPrice = 0;

	try {
		for (int i = 0; i < product.size(); i++) {
			OVO ovo = product.get(i);
%>


			
           <img src="images/<%=ovo.getoProduct() %>.jpg" alt="">
		
			<li>제품 이름<span><%=ovo.getoProduct()%></span></li>
			<input type=hidden name=oProduct value="<%=ovo.getoProduct()%>">
		
			<li>가격<span><%=ovo.getoPrice()%>원</span></li>
			<input type=hidden name=pPrice value="<%=ovo.getoPrice()%>">
			
			
			<li>수량<span><%=ovo.getoQuan()%>개</span></li>
			<input type=hidden name=oQuan value="<%=ovo.getoQuan()%>">
			<input type="hidden" name="dnum" value=<%=dnums[i]%>>
		
		
		
			<%
			oPrice += ovo.getoPrice() * ovo.getoQuan();
					System.out.println("ordersForm oPriced : " + oPrice);
				}
			%>
			<li><b>총액</b><span><b><%=oPrice%></b></span></li>
			</ul>
				
			<div>
			<h3 class="p1">주문정보</h3>
			</div>
                        <fieldset>
                              <label><span class="text-form">Name </span><input type="text" name="oName" ></label>
                              <label><span class="text-form">전화번호 </span><input type="text" name="oPhone" ></label>                             
                              <label><span class="text-form">주소 </span><input type="text" name="oAdd" size="40" ></label>   
                              <div class="wrapper">
                                  
                                    <div class="buttons">
                                    <input type=hidden name="oId" value="<%=did%>">
									<input type=hidden name="oPrice" value="<%=oPrice%>"> 
							<input type="submit" class="button-1" value="결제하기">
                                    </div> 
                              </div>                      
                        </fieldset>	
                        </article>					
                    </form>
								
								
								
							<%
								} catch (Exception e) {
								}
							%>
						
</div>

</div>
</div>


</section>
</body>
</html>

 

 