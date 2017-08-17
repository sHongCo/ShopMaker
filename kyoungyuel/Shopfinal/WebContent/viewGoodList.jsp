<!-- 
상품리스트를 보여주는곳 / Good -> Goods / 이미지별로 사진 첨부 / Btn 이미지 수정
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="shop" class="data.PVO" scope="page" />
<%@ page import="java.io.PrintWriter"%>
<%@ page import="data.DAO"%>
<%@ page import="data.PVO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 목록</title>

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


</head>
<%@ include file="header.jsp"%>
<body id="page3">
	<%
		String pNum = null;
		if (session.getAttribute("pNum") != null) {
			pNum = (String) session.getAttribute("pNum");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
	%>
<!-- /////////////////////////////////////////////// -->	
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
						<a href="main.jsp">이름<span>이름</span></a>
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
						<a href="main.jsp">이름<span>이름</span></a>
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
										<a href="main.jsp">이름<span>이름</span></a>
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
	<section id="content">
		<div class="main">
			<div class="container">
			
	
	<h3 class="prev-indent-bot">판매목록</h3>
	<div id="slider-2">
	<table border="1">
		<%
			DAO dao = new DAO();
			ArrayList<PVO> list = dao.getList(pageNumber);
			for (int i = 0; i < list.size(); i++) {
				PVO pvo = list.get(i);
		%> 
		<div class="p4">
		<figure><a class="lightbox-image" href="viewGood.jsp?pNum=<%=pvo.getpNum()%>">
		<img alt="" src="images/<%=pvo.getpProduct() %>.jpg"></a></figure>
		   <h5><%=pvo.getpProduct()%> </h5>
                            <!-- <p class="p1">Potato Pizza<br>Cheeze edge Line</p> -->
                            <p class="p2"><strong class="color-2"><%=pvo.getpPrice()%>원</strong></p>
                            <a class="button-1" href="viewGood.jsp?pNum=<%=pvo.getpNum()%>">Add to Cart</a>
        </div>
		
        
		
		
		
	
	
		<%
			}
		%>
	</table>
	</div>
        </div>
    	    </div>
    </section>
    <!-- 채팅 -->
		<div>
		<%@ include file = "livechat.jsp" %>
		</div>
		
		<!--==============================footer=================================-->
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
 <script type="text/javascript"> Cufon.now(); </script> 
		
</body>
</html>
