<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page import = "data.OVO" %>
<%@ page import = "data.DAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.ArrayList" %>


<%
		Object id;
		String uid="BBEBBE";
        /*if(session.getAttribute("uid") == null) // 로그인이 안되었을 때
        {  
			<script language="javascript">
			<!--
			 alert("로그인 하세요!");
			 history.go(-1);
			-->
			</script>



        }
        else // 로그인 했을 경우
        {
        	id=session.getValue("uid");
        	uid=id.toString();
        }
*/
%>
<head>
<title>주문하기</title>
<meta charset="euc-kr">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script src="js/mobile.js" type="text/javascript"></script>
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
	