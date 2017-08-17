<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String did = null;

	if (session.getAttribute("uId") != null) {
		did = (String) session.getAttribute("uId");
	}

	System.out.println("세션 로그 delete.jsp userID:" + did);
	String didCheck = did;
	
	//int dnum = Integer.parseInt(request.getParameter("dnum"));
	//System.out.println("dnum : " + dnum);
	String deleteName = request.getParameter("productName");
	String deletePrice = (request.getParameter("productPrice"));
	String deleteCount = (request.getParameter("productCount"));
	//String deleteNum = request.getParameter("dnum");
	String deleteNum = request.getParameter("dnum");
	
//	System.out.println("delete + dnum : " + deleteNum);
//	System.out.println("delete + dnum2 : " + deleteNum2);
	
	
	
	System.out.println("나와야해" + deleteName + deletePrice + deleteCount);
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>