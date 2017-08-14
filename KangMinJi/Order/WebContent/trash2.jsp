<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<a href="#"
		onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20'
+encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog',
 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
		target="_blank" alt="Share on Twitter"><img
		src="images/Twitter.png"></a>


	<a href="#"
		onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u='
+encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog',
 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
		target="_blank" alt="Share on Facebook"><img
		src="images/Facebook.png"></a>
		




	<a href="#"
		onclick="javascript:window.open('https://plus.google.com/share?url='+encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=350,width=600');return false;"
		target="_blank" alt="Share on Google+"> <img
		src="./images/Google_Plus.png"></a>



	<a href="#"
		onclick="javascript:window.open('https://story.kakao.com/s/share?url='+encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;"
		target="_blank" alt="Share on kakaostory"> <img
		src="images/Kakao_Story.png"></a>



	<a href="#"
		onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url='
+encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title),
 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
		target="_blank" alt="Share on Naver"><img src="images/Naver.png"></a>
</body>
</html>