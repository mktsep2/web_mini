<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="css/style.css">
<title>ERROR</title>
<style>
html {background:#e0f1fb;}
</style>
</head>
<body>
	<br>
	<%
		String message = (String) request.getAttribute("error");
	%>
	지금 발생된 error는
	<%=message%>입니다
   	<button onclick="history.back();" class="w3-bar-item w3-button w3-white w3-hover-gray">확인</button>
</body>
</html>