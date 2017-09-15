<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ERROR</title>
<style>
html {background:#e0f1fb;}
</style>
</head>
<body>
	<%
		String message = (String) request.getAttribute("error");
	%>
	지금 발생된 error는
	<%=message%>입니다
</body>
</html>