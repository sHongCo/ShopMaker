<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<script type="text/javascript">
	
</script>
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropbown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="botton" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<form name="userInfo" method="post" action="joinAction.jsp">
			<h3 style="text-align: center;">회원가입 화면</h3>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" placeholder="아이디" name="uId"
						maxlengh="20"></td>>
				<tr>
					<td>비밀번호</td>
				<td><input type="password" placeholder="비밀번호" name="uPass"
						maxlengh="20"></td>>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
			
			<td><input type="password" placeholder="비밀번호 확인" name="uPass2"
					maxlengh="20"></td>
			</tr>
				
			<tr>
				<td>이름</td>
				<td><input type="text" placeholder="이름" name="uName"
						maxlengh="20"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" placeholder="연락처" name="uPhone"
						maxlengh="20"></td>
			</tr>
			>
			<tr>
				<td>이메일</td>
				<td><input type="text" placeholder="이메일" name="uMail"
						maxlengh="20">
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" placeholder="주소" name="uAdd"
						maxlengh="20"></td>
			</tr>
			</table>
			<input type="submit" value="회원가입">
		</form>
	</div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>