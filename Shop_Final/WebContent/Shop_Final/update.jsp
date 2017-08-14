<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UVO"%>
<%@ page import="user.UserDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript">
	
</script>

</head>
<body>
	<%
		UserDAO dao = new UserDAO();
		String uId = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		}

		//UVO uvo = dao.getInfo(uId);
		UVO UVO = new UserDAO().getInfo(uId);
	%>
	<div class="container">
		<form name="userInfo" method="post" action="updateAction.jsp">
			<h3 style="text-align: center;">회원정보 수정</h3>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" placeholder="아이디" name="uId"
						maxlengh="20" value="<%=UVO.getuId()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" placeholder="비밀번호" name="uPass"
						maxlengh="20"></td>
				</tr>


				<tr>
					<td>비밀번호 확인</td>

					<td><input type="password" placeholder="비밀번호 확인" name="uPass2"
						maxlengh="20"></td>
				</tr>

				<tr>
					<td>이름</td>
					<td><input type="text" placeholder="이름" name="uName"
						maxlengh="20" value="<%=UVO.getuName()%>"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" placeholder="연락처" name="uPhone"
						maxlengh="20" value="<%=UVO.getuPhone()%>"></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input type="text" placeholder="이메일" name="uMail"
						maxlengh="20" value="<%=UVO.getuMail()%>">
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" placeholder="주소" name="uAdd"
						maxlengh="20" value="<%=UVO.getuAdd()%>"></td>
				</tr>
			</table>
			<input type="submit" value="변경"> <input type="reset"
				value="초기화"> <a href="main.jsp">취소</a>
		</form>
	</div>
</body>
</html>