<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="shop.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review</title>
</head>
<body>
	<!-- Tocplus 15.1 -->
	<script type="text/javascript">
		tocplusTop = 1150;
		tocplusLeft = 5;
		tocplusMinimizedImage = 'http://kr07.tocplus007.com/img/minimized_ko.gif';
		tocplusHAlign = 'right';
		tocplusWidth = 180;
		tocplusHeight = 220;
		tocplusUserName = '손님';
		tocplusFrameColor = '#e6e6e6';
		tocplusFloatingWindow = true;
		var tocplusHost = (("https:" == document.location.protocol) ? "https://"
				: "http://");
		document
				.write(unescape("%"
						+ "3Cscript src='"
						+ tocplusHost
						+ "kr07.tocplus007.com/chatLoader.do?userId=qkr4347' type='text/javascript'"
						+ "%" + "3E" + "%" + "3C/script" + "%" + "3E"));
	</script>
	<!-- End of Tocplus -->

	<%
		String uId = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		}
	%>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성시간</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody>
				<%
					DAO dao = new DAO();
					ArrayList<REVO> list = dao.getReList();
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getreNum()%></td>
					<td><%=list.get(i).getreContents()%></td>
					<td><%=list.get(i).getreId()%></td>
					<td><%=list.get(i).getreDate()%></td>
					<td><%=list.get(i).getrePoint()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<div>
		<form method="post" action="reWriteAct.jsp">
			<input type="text" class="form-control" placeholder="한 줄 리뷰"
				name="reContents" maxlength="128"> <input type="text"
				class="form-control" placeholder="평점" name="rePoint" maxlength="1">
			<input type="button" class="btn btn-primary" value="확인">
		</form>
	</div>
</body>
</html>