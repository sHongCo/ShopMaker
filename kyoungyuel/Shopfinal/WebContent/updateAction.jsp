<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="data.*"%>

<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="UVO" class="data.UVO" scope="page" />
<jsp:setProperty property="*" name="UVO" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
</head>
<body>
	<%
		String uId = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		} //���ǿ� �ִ� �������̵� ����
		if (uId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ؾ� �� �� �ִ� ����Դϴ�.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} //���ǿ� id ���� ������� = �α����� �ȵǾ��������

		if (request.getParameter("uId") == null || request.getParameter("uPass") == null
				|| request.getParameter("uName").equals("") || request.getParameter("uMail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO UserDAO = new UserDAO();
			int result = UserDAO.update(UVO);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('ȸ������ ���濡 �����Ͽ����ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>