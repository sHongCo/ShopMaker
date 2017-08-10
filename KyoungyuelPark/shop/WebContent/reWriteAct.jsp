<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="re.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="REVO" class="re.REVO" scope="page" />
<jsp:setProperty name="REVO" property="reContents" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		String uId = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		}
		if (uId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해주세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (REVO.getreContents() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력하지 않은 항목이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				DAO dao = new DAO();
				int result = dao.write(REVO.getreContents(), dao.getreName(), REVO.getreDate());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'reList.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>