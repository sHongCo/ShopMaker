

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>JSP 게시판 웹사이트</title>

<script type="text/javascript">
	// 이메일 종류 선택 
	function emailChoice(obj, str) {
		if (obj == '') {
			str.readonly = false;
			str.value = '';
			str.focus();
		} else {
			str.readonly = true;
			str.value = obj;
		}
	}
</script> 

<%@ include file="header.jsp"%>
</head>
<body>
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
						<a href="main.jsp">이름<span></span></a>
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
						<span>이름</span>
					</h2>
				</div>
			</div>
		</div>
	</header>
	<section id="content">
		<div class="main">
			<div class="container">
				<form name="userInfo" method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<table
						style="width: 60%; height: 100px; margin: auto; text-align: left:;">
						<tr>
							<td>아이디</td>
							<td><input type="text" placeholder="아이디" name="uId"
								maxlengh="20"></td>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" placeholder="비밀번호" name="uPass"
								maxlengh="20"></td>

						</tr>
						<tr>
							<td>비밀번호 확인</td>

							<td><input type="password" placeholder="비밀번호 확인"
								name="uPass2" maxlengh="20"></td>
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

					<tr>
					<td>이메일</td>
					<td><input type="text" placeholder="이메일" name="uMail1"
						maxlengh="20">@<input type="text" name="uMail2"
						id="email_domain" class="" style="" /> <select name="email_kind"
						id="email_kind"
						onChange="emailChoice(this.value, this.form.email_domain);"
						style="height: 20px; border: 1px solid #cfcfcf;">
							<option value="">직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
					</select></td>
				</tr>
				
				
						<tr>
							<td>주소</td>
							<td><input type="text" placeholder="주소" name="uAdd"
								maxlengh="20"></td>
						</tr>
					</table>
					<center>
						<input type="submit" value="회원가입">
					</center>
				</form>
			</div>
		</div>
	</section>
	<footer>
		<div class="main">
			<div class="aligncenter">
				<span>Catering.com &copy; 2012</span> Website Template by <a
					class="link" href="http://www.templatemonster.com/" target="_blank"
					rel="nofollow">TemplateMonster.com</a>
				<div>
					<%@ include file="sns.jsp"%>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		Cufon.now();
	</script>
	<script type="text/javascript">
		$(window).load(function() {
			$('.slider')._TMS({
				duration : 1000,
				easing : 'easeOutQuint',
				preset : 'slideDown',
				slideshow : 7000,
				banners : false,
				pauseOnHover : true,
				pagination : true,
				pagNums : false
			});
		});
	</script>



	<!-- 채팅 -->
	<div>
		<%@ include file="livechat.jsp"%>
	</div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>