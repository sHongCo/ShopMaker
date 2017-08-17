<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>매장위치</title>
<link rel="stylesheet"
	href="http://www.59pizza.co.kr/theme/59pizza/skin/board/store_res/style.css">
<link rel="stylesheet" type="text/css" href="css/reset.css"
	media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/layout.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css"
	media="screen">
<script src="http://www.59pizza.co.kr/theme/59pizza/js/jquery.min.js"></script>
<script src="http://www.59pizza.co.kr/js/jquery.menu.js"></script>
<script src="http://www.59pizza.co.kr/js/common.js"></script>
<script src="http://www.59pizza.co.kr/js/wrest.js"></script>
<script src="http://www.59pizza.co.kr/theme/59pizza/js/basic.js"></script>
<script
	src="http://www.59pizza.co.kr/theme/59pizza/js/jquery.bxslider.js"></script>
<script
	src="http://www.59pizza.co.kr/theme/59pizza/js/bootstrap-hover-dropdown.min.js"></script>

</head>
<%@ include file="header.jsp"%>
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
							<li><a href="main.jsp">메인</a></li>
							<li><a href="viewGoodList.jsp">메뉴</a></li>
							<li><a href="wishList2.jsp">장바구니</a></li>
							<li><a href="order.jsp">주문내역</a></li>
							<li><a class="active" href="mapList.jsp">매장찾기</a></li>

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
<body id="page-top" class="index">
	<div>
		<form name="fboardlist" id="fboardlist"
			action="./board_list_update.php"
			onsubmit="return fboardlist_submit(this);" method="post">
			<input type="hidden" name="bo_table" value="store02"> <input
				type="hidden" name="sfl" value=""> <input type="hidden"
				name="stx" value=""> <input type="hidden" name="spt"
				value=""> <input type="hidden" name="sca" value="">
			<input type="hidden" name="page" value="1"> <input
				type="hidden" name="sw" value="">
			<ul class="gall_title">
				<li style="width: 18%;">매장사진</li>
				<li style="width: 14%;">매장명</li>
				<li style="width: 37%;">주소</li>
				<li style="width: 15%;">전화번호</li>
			</ul>
			<ul id="gall_ul">
				<li class="gall_li"><span class="sound_only"> 580 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1702/thumb-8e4b559bac677d106fb4fc9e50839116_1486347120_0267_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가능점</p>
						</li>

						<li class="w_address">
							<p>
								경기 의정부시 신흥로 365&nbsp;가능동 <a
									href="http://map.naver.com/?query=%EA%B2%BD%EA%B8%B0+%EC%9D%98%EC%A0%95%EB%B6%80%EC%8B%9C+%EC%8B%A0%ED%9D%A5%EB%A1%9C+365 %EA%B0%80%EB%8A%A5%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>031-871-0059</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 579 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1701/thumb-9231045249d6b96ddf1e26fc034bce0c_1485839167_1058_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가양보건대점</p>
						</li>

						<li class="w_address">
							<p>
								대전 동구 우암로 331&nbsp;가양동 <a
									href="http://map.naver.com/?query=%EB%8C%80%EC%A0%84+%EB%8F%99%EA%B5%AC+%EC%9A%B0%EC%95%94%EB%A1%9C+331 %EA%B0%80%EC%96%91%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>042-625-5982</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 578 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1702/thumb-40611df8cfa7c5134f2ad1a010c19c09_1486362874_2769_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가운지구점</p>
						</li>

						<li class="w_address">
							<p>
								경기 남양주시 가운로2길 &nbsp;51 <a
									href="http://map.naver.com/?query=%EA%B2%BD%EA%B8%B0+%EB%82%A8%EC%96%91%EC%A3%BC%EC%8B%9C+%EA%B0%80%EC%9A%B4%EB%A1%9C2%EA%B8%B8+ 51"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>031-568-5945</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 577 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1701/thumb-9231045249d6b96ddf1e26fc034bce0c_1485823863_6952_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가장점</p>
						</li>

						<li class="w_address">
							<p>
								대전 서구 갈마로261번길 48&nbsp;가장동 <a
									href="http://map.naver.com/?query=%EB%8C%80%EC%A0%84+%EC%84%9C%EA%B5%AC+%EA%B0%88%EB%A7%88%EB%A1%9C261%EB%B2%88%EA%B8%B8+48 %EA%B0%80%EC%9E%A5%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>042-535-6321</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 576 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1701/thumb-9231045249d6b96ddf1e26fc034bce0c_1485824234_8448_135x84.png"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가정점</p>
						</li>

						<li class="w_address">
							<p>
								인천 서구 가석로 324&nbsp;가정동 <a
									href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B0%80%EC%84%9D%EB%A1%9C+324 %EA%B0%80%EC%A0%95%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>032-574-8200</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 575 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1701/thumb-9231045249d6b96ddf1e26fc034bce0c_1485824307_1923_135x84.png"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가좌점</p>
						</li>

						<li class="w_address">
							<p>
								인천 서구 원적로 85&nbsp;가좌동 <a
									href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EC%9B%90%EC%A0%81%EB%A1%9C+85 %EA%B0%80%EC%A2%8C%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>032-582-0059</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 574 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1702/thumb-40611df8cfa7c5134f2ad1a010c19c09_1486363835_574_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가천대역점</p>
						</li>

						<li class="w_address">
							<p>
								경기 성남시 수정구 태평로 2&nbsp;태평동 <a
									href="http://map.naver.com/?query=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EC%88%98%EC%A0%95%EA%B5%AC+%ED%83%9C%ED%8F%89%EB%A1%9C+2 %ED%83%9C%ED%8F%89%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>031-722-5859</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 573 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1701/thumb-2b3e84f6a9edba09fde01beb0c05bf62_1485410818_1797_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">가촌점</p>
						</li>

						<li class="w_address">
							<p>
								경남 양산시 물금읍 가촌리 1269-3&nbsp;촌리 <a
									href="http://map.naver.com/?query=%EA%B2%BD%EB%82%A8+%EC%96%91%EC%82%B0%EC%8B%9C+%EB%AC%BC%EA%B8%88%EC%9D%8D+%EA%B0%80%EC%B4%8C%EB%A6%AC+1269-3 %EC%B4%8C%EB%A6%AC"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>055-381-0059</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 572 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1701/thumb-9231045249d6b96ddf1e26fc034bce0c_1485824868_3549_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">간석3동점</p>
						</li>

						<li class="w_address">
							<p>
								인천 남동구 용천로 183&nbsp;간석동 <a
									href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EB%8F%99%EA%B5%AC+%EC%9A%A9%EC%B2%9C%EB%A1%9C+183 %EA%B0%84%EC%84%9D%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>032-439-5969</p>
						</li>
					</ul></li>


				<li class="gall_li"><span class="sound_only"> 571 </span>
					<ul class="list_cn_box">
						<li class="w_photo">
							<p>
								<img
									src="http://www.59pizza.co.kr/data/editor/1701/thumb-9231045249d6b96ddf1e26fc034bce0c_1485826816_938_135x84.jpg"
									class="ph_img" alt="" width="135" height="84">
							</p>
						</li>
						<li class="w_subject">
							<p class="">간석역점</p>
						</li>

						<li class="w_address">
							<p>
								인천 남구 주안로 226&nbsp;주안동 <a
									href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EA%B5%AC+%EC%A3%BC%EC%95%88%EB%A1%9C+226 %EC%A3%BC%EC%95%88%EB%8F%99"
									target="_blank" class="naver_view">[위치보기]</a>
							</p>
						</li>

						<li class="w_phone">
							<p>032-434-5982</p>
						</li>
					</ul></li>
			</ul>

			<ul id="gall_ul_moblie">


				<li class="gall_li"><span class="sound_only"> 580 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가능점</p>
						<p class="w_address">
							경기 의정부시 신흥로 365&nbsp;가능동<a
								href="http://map.naver.com/?query=%EA%B2%BD%EA%B8%B0+%EC%9D%98%EC%A0%95%EB%B6%80%EC%8B%9C+%EC%8B%A0%ED%9D%A5%EB%A1%9C+365				%EA%B0%80%EB%8A%A5%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 579 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가양보건대점</p>
						<p class="w_address">
							대전 동구 우암로 331&nbsp;가양동<a
								href="http://map.naver.com/?query=%EB%8C%80%EC%A0%84+%EB%8F%99%EA%B5%AC+%EC%9A%B0%EC%95%94%EB%A1%9C+331				%EA%B0%80%EC%96%91%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 578 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가운지구점</p>
						<p class="w_address">
							경기 남양주시 가운로2길 &nbsp;51<a
								href="http://map.naver.com/?query=%EA%B2%BD%EA%B8%B0+%EB%82%A8%EC%96%91%EC%A3%BC%EC%8B%9C+%EA%B0%80%EC%9A%B4%EB%A1%9C2%EA%B8%B8+				51"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 577 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가장점</p>
						<p class="w_address">
							대전 서구 갈마로261번길 48&nbsp;가장동<a
								href="http://map.naver.com/?query=%EB%8C%80%EC%A0%84+%EC%84%9C%EA%B5%AC+%EA%B0%88%EB%A7%88%EB%A1%9C261%EB%B2%88%EA%B8%B8+48				%EA%B0%80%EC%9E%A5%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 576 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가정점</p>
						<p class="w_address">
							인천 서구 가석로 324&nbsp;가정동<a
								href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EA%B0%80%EC%84%9D%EB%A1%9C+324				%EA%B0%80%EC%A0%95%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 575 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가좌점</p>
						<p class="w_address">
							인천 서구 원적로 85&nbsp;가좌동<a
								href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EC%84%9C%EA%B5%AC+%EC%9B%90%EC%A0%81%EB%A1%9C+85				%EA%B0%80%EC%A2%8C%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 574 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가천대역점</p>
						<p class="w_address">
							경기 성남시 수정구 태평로 2&nbsp;태평동<a
								href="http://map.naver.com/?query=%EA%B2%BD%EA%B8%B0+%EC%84%B1%EB%82%A8%EC%8B%9C+%EC%88%98%EC%A0%95%EA%B5%AC+%ED%83%9C%ED%8F%89%EB%A1%9C+2				%ED%83%9C%ED%8F%89%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
						<p class="w_vie">
					</div></li>


				<li class="gall_li"><span class="sound_only"> 573 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">가촌점</p>
						<p class="w_address">
							경남 양산시 물금읍 가촌리 1269-3&nbsp;촌리<a
								href="http://map.naver.com/?query=%EA%B2%BD%EB%82%A8+%EC%96%91%EC%82%B0%EC%8B%9C+%EB%AC%BC%EA%B8%88%EC%9D%8D+%EA%B0%80%EC%B4%8C%EB%A6%AC+1269-3				%EC%B4%8C%EB%A6%AC"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 572 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">간석3동점</p>
						<p class="w_address">
							인천 남동구 용천로 183&nbsp;간석동<a
								href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EB%8F%99%EA%B5%AC+%EC%9A%A9%EC%B2%9C%EB%A1%9C+183				%EA%B0%84%EC%84%9D%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>


				<li class="gall_li"><span class="sound_only"> 571 </span>
					<div class="list_cn_box_mobile">
						<p class="w_subject">간석역점</p>
						<p class="w_address">
							인천 남구 주안로 226&nbsp;주안동<a
								href="http://map.naver.com/?query=%EC%9D%B8%EC%B2%9C+%EB%82%A8%EA%B5%AC+%EC%A3%BC%EC%95%88%EB%A1%9C+226				%EC%A3%BC%EC%95%88%EB%8F%99"
								target="_blank" class="naver_view">[위치보기]</a>
						</p>
						<div class="clear"></div>
					</div></li>
			</ul>
		</form>
	</div>
	
	  <!-- 채팅 -->
		<div>
		<%@ include file = "livechat.jsp" %>
		</div>
		
		<!--==============================footer=================================-->
  <footer>
        <div class="main">
        	<div class="aligncenter">
            	<span>#Maker</span>
                Website Template by <a class="link" href="http://www.templatemonster.com/" target="_blank" rel="nofollow">TemplateMonster.com</a>
		<div>
		<%@ include file = "sns.jsp" %>
		</div>	
            </div>
        </div>
    </footer>
</body>
</html>