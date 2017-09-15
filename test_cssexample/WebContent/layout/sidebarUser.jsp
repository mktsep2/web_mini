<%@page import="model.vo.CustomerVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	CustomerVo cvo=(CustomerVo) session.getAttribute("cvo");
	String id = (String) session.getAttribute("id");
	System.out.println("id" + id);
	String name=cvo.getName();
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>LIBRARY</title>
</head>
<body>
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-sky w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  		<a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hover-gray w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  		<div class="w3-container">
    		<h3 class="w3-padding-64"><b><%=name%>님 안녕하세요</b></h3>
  		</div>
  		<div class="w3-bar-block">
  		<div class="w3-dropdown-hover">
   				<button class="w3-button w3-hover-gray w3-dropdownn-click">USER</button>
   					<div class="w3-dropdown-content w3-bar-block w3-whitee">
   					
   						<form action="updateUser.jsp">
   							<input type="hidden" name="id" value="${session.id}">
   							<button class="w3-button" type="submit">정보수정</button>
   						</form>
   						<a href="index.html" class="w3-button">로그아웃</a>
   						<form action="cust" method="post">
   							<input type="hidden" name="id" value="${id}">
   							<input type="hidden" value="delete"  name="command">
   							<button class="w3-button" type="submit">탈퇴하기${session.id}</button>
   						</form>
     				</div>
				</div> 
			</div>
	</nav>

	<!-- Top menu on small screens -->
	<header class="w3-container w3-top w3-hide-large w3-sky w3-xlarge w3-padding">
  		<a href="javascript:void(0)" class="w3-button w3-sky w3-hover-gray w3-margin-right" onclick="w3_open()">&#9776;</a>
  		<span>MENU</span>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
</body>
</html>