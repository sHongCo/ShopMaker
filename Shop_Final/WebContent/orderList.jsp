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

</head>
<body>
<h1>주문목록</h1>
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
		<td>총 매출액</td><td><%=oPrice %></td>
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
</body>
</html>
	