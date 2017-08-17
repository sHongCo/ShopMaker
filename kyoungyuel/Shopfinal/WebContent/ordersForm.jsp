
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


<%@ include file="header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/reset.css" media="screen">
 <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"> 
    <link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen">
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
				pager: true,
				controls: false,
				moveSlideQty: 1,
				displaySlideQty: 4
			});
			$("a[data-gal^='prettyPhoto']").prettyPhoto({theme:'facebook'});
		}); 
	</script>












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
			   <div class="row-bot">
        	<div class="row-bot-bg">
            
          
                	
              
          </div>
        </div>
	
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





	<div>
		<%@ include file = "livechat.jsp" %>
		</div>
		
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
</html>

 

 