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
	if (UVO.getuPass() == null || UVO.getuPass2() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��й�ȣ�� �Է����ּ���')");
		script.println("history.back()");
		script.println("</script>");
	} else if (!UVO.getuPass().equals(UVO.getuPass2())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (UVO.getuName() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�̸��� �Է����ּ���')");
		script.println("history.back()");
		script.println("</script>");
	} else if (UVO.getuPhone() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('����ó�� �Է����ּ���')");
		script.println("history.back()");
		script.println("</script>");
	} else if (UVO.getuMail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�̸����� �Է����ּ���')");
		script.println("history.back()");
		script.println("</script>");
	} else if (UVO.getuAdd() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�ּҸ� �Է����ּ���')");
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