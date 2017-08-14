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
    <script src="js/Dynalight_400.font.js" type="text/javascript"></script>
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
<body id="page3">
	 	<%@ include file="header.jsp" %>
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
	<div class="row-top">
        	<div class="main">
            	<div class="wrapper">
                	<h1><a href="index.html">Catering<span>.com</span></a></h1>
                    <nav>
                        <ul class="menu">
                            <li><a href="index.html">About</a></li>
                            <li><a href="menu.html">Menu</a></li>
                            <li><a class="active" href="catalogue.html">Catalogue </a></li>
                            <li><a href="shipping.html">Shipping</a></li>
                            <li><a href="faq.html">FAQ </a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2> <span>Delicious Pizza</span></h2>
                </div>
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
		<div>
		<div class="p4">
		<figure><a class="lightbox-image" href="images/1.jpg" data-gal="prettyPhoto[prettyPhoto]">
		<img alt="" src="images/1.jpg"></a></figure>
		   <h5><%=pvo.getpProduct()%> </h5>
                            <!-- <p class="p1">Potato Pizza<br>Cheeze edge Line</p> -->
                            <p class="p2"><strong class="color-2"><%=pvo.getpPrice()%>원</strong></p>
                            <a class="button-1" href="viewGood.jsp?pNum=<%=pvo.getpNum()%>">Add to Cart</a>
        </div>
		</div>
        
		
		
		
	
		
		<!-- <tr>
			<th>제품 ID번호</th>
			<th>제품 이미지</th>
			<th>제품명</th>
			<th>가격</th>
		</tr>
		<tr>
			<td><%=pvo.getpNum()%></td>
			<td><a> <img src="images/1.jpg" width="120px" height="110px">
			</a></td>
			<td>


 		<a href="viewGood.jsp?pNum=<%=pvo.getpNum()%>">
 		<input type="button"  value="<%=pvo.getpProduct()%>"> </a>
 
 
			</td>
			<td><%=pvo.getpPrice()%>원</td>
		</tr> 		
		-->
		<%
			}
		%>
	</table>
	</div>
        </div>
    	    </div>
    </section>
		
</body>
</html>
