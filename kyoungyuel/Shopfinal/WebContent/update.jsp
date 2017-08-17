<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="data.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/layout.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css"
	media="screen">
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/FF-cash.js" type="text/javascript"></script>
<script src="js/tms-0.3.js" type="text/javascript"></script>
<script src="js/tms_presets.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/jquery.equalheights.js" type="text/javascript"></script>
<title>로그인화면</title>
<script type="text/javascript">
	
</script>

</head>
<body>


	<%@ include file="header.jsp" %>
	<header>
		<%
			String userID = null;
			if (session.getAttribute("uId") != null) {
				userID = (String) session.getAttribute("uId");
			}
		%>
		<div class="row-top">
			<div class="main">
				<div class="wrapper">
					<h1>
				<a href="main.jsp"><span>피자</span>사가라</a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a class="active" href="main.jsp">메인</a></li>
							<li><a href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
							<li><a href="order.jsp">주문내역</a></li>
							<li><a href="mapList.jsp">매장찾기</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="row-bot">
			<div class="row-bot-bg">
				<div class="main">
					<h2>
						<span></span>
					</h2>
				</div>
			</div>
		</div>
	</header>
	

	

	<%
		UserDAO dao = new UserDAO();
	//	String uId = null;
		if (session.getAttribute("uId") != null) {
			uId = (String) session.getAttribute("uId");
		UVO UVO = new UserDAO().getInfo(uId);
		

		//UVO uvo = dao.getInfo(uId);
	%>
	<section id="content">
		<div class="main">
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
			<%
			}
			%>
			<input type="submit" value="변경"> <input type="reset"
				value="초기화"> <a href="main.jsp">취소</a>
		</form>
	</div>
	</div>
	</section>
		<div>
			<%@ include file="livechat.jsp"%>
		</div>


	<!--==============================footer=================================-->
	<footer>
		<div class="main">
			<div class="aligncenter">
				<span>#Maker</span> Website Template by <a class="link"
					href="http://www.templatemonster.com/" target="_blank"
					rel="nofollow">TemplateMonster.com</a>
				<div>
					<%@ include file="sns.jsp"%>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>