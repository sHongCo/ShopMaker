<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="shop" class="shop.PVO" scope="page" />    
<%@ page import="java.io.PrintWriter" %>   
<%@ page import="shop.DAO" %> 
<%@ page import="shop.PVO" %> 
<%@ page import="java.util.ArrayList" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 목록</title>
</head>
<body>
	<%
		
		String pNum = null;
		if(session.getAttribute("pNum") != null){
			pNum = (String) session.getAttribute("pNum");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
    <h2>판매 목록</h2>
    <table border="1">
    	<%
    		DAO dao = new DAO();
    		ArrayList<PVO> list = dao.getList(pageNumber);
			for(int i = 0; i < list.size(); i++){				
		%>
        <tr>
            <th>제품 ID번호</th>
            <th>제품 이미지</th>
            <th>제품명</th>
            <th>가격</th>
        </tr>
        <tr>
            <td>
                <%= list.get(i).getpNum() %>
            </td>
            <td>
                <a>
                    <img src="images/1.jpg" width="120ox" height="110px">
                </a>
            </td>
            <td>
              	<a href="viewGood.jsp?pNum=<%=list.get(i).getpNum() %>"><%=list.get(i).getpProduct() %></a>
            </td>
            <td>
                <%= list.get(i).getpPrice() %>원
            </td>
        </tr>
        <%
			}
        %>
       		
    </table>
</body>
</html>
