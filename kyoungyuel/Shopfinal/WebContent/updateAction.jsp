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
<title>회원정보 변경</title>
</head>
<body>
	<%
		String uId = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		} //세션에 있는 유저아이디를 저장
		if (uId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해야 쓸 수 있는 기능입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} //세션에 id 값이 없을경우 = 로그인이 안되어있을경우

		if (request.getParameter("uId") == null || request.getParameter("uPass") == null
				|| request.getParameter("uName").equals("") || request.getParameter("uMail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO UserDAO = new UserDAO();
			int result = UserDAO.update(UVO);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 변경에 실패하였습니다.')");
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