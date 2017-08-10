<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page import = "data.DAO" %>
<%@ page import =  "data.PVO"%>
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
<%
	List articleList = null;
	ArrayList<Integer> product= new ArrayList<Integer>();
	DAO dao = DAO.getDao();
	int count ;//

	int pPrice = Integer.valueOf(request.getParameter("pPrice"));
	int pNum = Integer.valueOf(request.getParameter("pNum"));
	String oProduct= request.getParameter("pProduct");
	int oQuan = Integer.valueOf(request.getParameter("oQuan"));
%>
<head>
<title>주문하기</title>
<meta charset="euc-kr">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 주문하기</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script src="js/mobile.js" type="text/javascript"></script>
</head>

<% 
  try{     
%>
<table border=1 width="500px" cellspacing=0>
	<tr>
		<td>제품번호</td><td><%=pNum %></td>
	</tr>
	<tr>
		<td>품명</td><td><%=oProduct %></td>
	</tr>	
	<tr>
		<td>가격</td><td><%=pPrice %></td>
	</tr>
	<tr>
		<td>수량</td><td><%=oQuan %></td>
	</tr>
	<tr>
		<td>총 액</td><td><%=oQuan*pPrice %></td>
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
					<form action="orderPro.jsp" onsubmit="return writeSave()">
						<input type="text" name="oName" value="이름" onblur="this.value=!this.value?'이 름':this.value;" onfocus="this.select()" onclick="this.value='';">
						<input type="text" name="oPhone" value="전화번호" onblur="this.value=!this.value?'전화번호':this.value;" onfocus="this.select()" onclick="this.value='';">
					
						<input type="text" name="oAdd" value="주소" onblur="this.value=!this.value?'전화번호':this.value;" onfocus="this.select()" onclick="this.value='';">	
					<input type=hidden name=oProduct value="<%=oProduct%>">
					<input type=hidden name=oQuan value="<%=oQuan%>">
					<input type=hidden name=oId value="<%=uid%>">
					<input type=hidden name=oPrice value="<%=oQuan*pPrice%>">
					<input type="submit" value="결제하기" id="submit">
<%
  }catch(Exception e){}
%>
					</form>
				</div>
					</center>
				
			</div>
		</div>
		
	</div>
</body>
</html>
	
