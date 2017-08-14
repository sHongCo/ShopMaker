<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="UVO" class="user.UVO" scope="page" />
<jsp:setProperty property="*" name="UVO" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
		String userID = null;

		if (session.getAttribute("uId") != null) {
			userID = (String) session.getAttribute("uId");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		if (UVO.getuId() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('ID를 입력해 주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		if (UVO.getuPass() == null || UVO.getuPass2() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else if (!UVO.getuPass().equals(UVO.getuPass2()) ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
		if (UVO.getuName() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		if (UVO.getuPhone() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('연락처를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		if (UVO.getuMail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		if (UVO.getuAdd() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('주소를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(UVO);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
			
		} else {
			
			session.setAttribute("uId", UVO.getuId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href ='comp.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>