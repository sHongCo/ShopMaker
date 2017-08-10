<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="shop.DAO"%>
<%@ page import="shop.REVO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판</title>
</head>
<body>
	<%
		String reName = null;
		if (session.getAttribute("reName") != null) {
			reName = (String) session.getAttribute("reName");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					DAO dao = new DAO();
					ArrayList<REVO> list = dao.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getreNum()%></td>
					<td><a href="view.jsp?reNum=<%=list.get(i).getreNum()%>"><%=list.get(i).getreTitle()%></a></td>
					<td><%=list.get(i).getreName()%></td>
					<td><%=list.get(i).getreDate().substring(0, 11) + list.get(i).getreDate().substring(11, 13) + "시"
						+ list.get(i).getreDate().substring(14, 16) + "분"%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<form method="post" action="reWriteAct.jsp">
		<div>
			<input type="text" placeholder="한 줄 리뷰" maxlength="50"> <input
				type="submit" value="글 쓰기">
		</div>
	</form>
</body>
</html>