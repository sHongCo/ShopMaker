<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="ovo" class="data.OVO" scope="page" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="data.*"%>


 
<%
int oNum = Integer.parseInt(request.getParameter("oNum"));
System.out.println(oNum);
DAO dao = new DAO();
ovo = dao.getOrder(oNum);
int oPrice=0;
//리퀘스트 파라미터 다 받아오기.
Enumeration<String> para = request.getParameterNames();
//para배열에 있는 갯수많큼 while!
while(para.hasMoreElements()){
	//name에 파라미터name저장.
	String names=para.nextElement();
	//oPrice파라미터가 있으면.
	if(names.equals("oPrice")){
		oPrice=Integer.parseInt(request.getParameter("oPrice"));	
	}else{//oPrice 파라미터가 없으면 ovo객체에서 가져옴
		oPrice=ovo.getoPrice();
	}
}
%>
	
	<script type="text/javascript">



</script>






<h1>제품 정보</h1>
<br />
<table border=1 width="700px" cellspacing=0>



	<tr>
	<td> 주문이 완료되었습니다. </td>
	</tr>
	<tr>
		<td width="150">주문번호</td>
		<td colspan="3"><%=oNum%></td>
	</tr>
	<tr>
		<td>제품명</td>
		<td colspan="3"><%=ovo.getoProduct()%></td>
	</tr>
	<tr>
		<td>결제금액</td>
		<td colspan="3"><%=oPrice%>원</td>
	</tr>
	<tr>
		<td>주문자</td>
		<td colspan="3"><%=ovo.getoName()%></td>
	</tr>

	<tr>
		<td>배달지 정보</td>
		<td colspan="3"><%=ovo.getoAdd() %></td>
	</tr>
	<tr>
		<td>계좌정보</td>
		<td colspan="3">[국민] 310-55-5555112 </td>
	</tr>
</table>
 <input type="button" value="상품목록으로 돌아가기" onClick="location.href='viewGoodList.jsp'";>

<br>
