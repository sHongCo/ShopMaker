<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹사이트</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>


<%
	

	int oQuan = Integer.parseInt(request.getParameter("oQuan"));
	int pQuan = Integer.parseInt(request.getParameter("pQuan"));
	int pNum = Integer.parseInt(request.getParameter("pNum"));
	System.out.println("quanCheck / 선택수량" + oQuan); //3 
	System.out.println("quanCheck / 상품수량" + pQuan); // 2
	System.out.println("quanCheck / 상품번호" + pNum); // 

	//데이터 옮기기//

	DAO dao = new DAO();
	PVO pvo = dao.getNum(pNum);
		%>
		<form action="wishList2" method="post">
		
		<input type=hidden name=pProduct value="<%=pvo.getpProduct()%>">
		<input type=hidden name=pPrice value="<%=pvo.getpPrice()%>">
		<input type=hidden name=pQuan value="<%=pvo.getpQuan()%>">
		<input type=hidden name=pNum value="<%=pvo.getpNum()%>">
		</form>
		<%

		System.out.println("quanCheck pvo.getpNum() 1 : " + pvo.getpNum()); //
	PrintWriter script = response.getWriter();
	if (oQuan > pQuan) {
		

		request.setAttribute("errMsg", "재고가 부족합니다");
		pageContext.forward("viewGood.jsp");
		System.out.println("quanCheck pvo.getpNum() 2 : " + pvo.getpNum()); //
		
	} else {
	
		script.println("<script>");
		script.println("alert('계속진행')");
		
		
	//	pageContext.forward("viewGood.jsp");
		
		pageContext.forward("wishList2.jsp");
		//script.println("location.href = 'wishList2.jsp'");
		script.println("</script>");
		
		System.out.println("quanCheck pvo.getpNum() 3 : " + pvo.getpNum()); //
	}
%>


</body>
</html>

