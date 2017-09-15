<%@page import="model.vo.BookVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<title>LIBRARY</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<style>
		html{background:#e0f1fb;}
		body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
		body {font-size:16px;}
		.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
		.w3-half img:hover{opacity:1}
	</style>
<body>

<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-sky w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  		<a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hover-gray w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  		<div class="w3-container">
    		<h3 class="w3-padding-64"><b>Kosta_Media<br>Library<br>By_${requestScope.id}님</b></h3>
  		</div>
  		<div class="w3-bar-block">
    		<div class="w3-dropdown-hover">
   				<button class="w3-button w3-hover-gray w3-dropdownn-click">ADMIN</button>
   					<div class="w3-dropdown-content w3-bar-block w3-border w3-whitee">
      					<a href="book" class="w3-bar-item w3-button">도서 목록</a>
      					<a href="#" class="w3-bar-item w3-button">도서 추가</a>
      					<a href="#" class="w3-bar-item w3-button">도서 수정</a>
      					<a href="#" class="w3-bar-item w3-button">도서 삭제</a>
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

<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<div class="w3-container w3-display-container w3-center" style="margin-top: 80px;" id="showcase">
			<div class="w3-panel">
				<h3>모든 고객 보기</h3>
			</div>
	</div>
		<div class="w3-container w3-display-container w3-center" style="margin-top: 80px;" id="showcase">
			<table class="w3-display-middle" border="1" width="70%">
				<tr>
					<td width="20%">id</td>
				</tr>
				<c:forEach var="cvo" items="${requestScope.allList}">
					<tr>
						<td>${cvo}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- W3.CSS Container -->

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>

</body>
</html>