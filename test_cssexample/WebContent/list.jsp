<%@ page language="java" 
contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모든 고객 보기</title>
</head>
<body>
<center>  
<h3>모든 고객 보기</h3>
<table border="1"  width="70%">
	<tr>
		<td width="20%">id</td>
	</tr>	
	<c:forEach var="cvo" items="${requestScope.allList}">
	<tr>
			<td>${cvo}</td>
	</tr>
	</c:forEach>
	
</table>
<p>
<a href="index.html">메인으로 이동</a>
</center>
</body>
</html>
