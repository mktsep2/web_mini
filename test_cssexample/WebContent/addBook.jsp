<%@page import="model.vo.BookVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<%@ include file = "layout/head.jsp" %>
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
   						<form action="book">
	   						<input type="hidden" name="command" value="bookList">
	   						<button class="w3-button" type="submit">도서 목록</button>
	   					</form>
	   					<a href="addBook.jsp" class="w3-bar-item w3-button">도서 추가</a>
	   					<form action="book">
	   						<input type="hidden" name="command" value="bookUpdate">
	   						<button class="w3-button" type="submit">도서 수정</button>
	   					</form>
	   					<form action="book">
	   						<input type="hidden" name="command" value="bookDelete">
	   						<button class="w3-button" type="submit">도서 삭제</button>
	   					</form>
      					<!-- <a href="book" class="w3-bar-item w3-button">도서 목록</a>
      					<a href="#" class="w3-bar-item w3-button">도서 추가</a>
      					<a href="#" class="w3-bar-item w3-button">도서 수정</a>
      					<a href="#" class="w3-bar-item w3-button">도서 삭제</a> -->
     				</div>
				</div> 
  			</div>
	</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-sky w3-xlarge w3-padding">
  		<a href="javascript:void(0)" class="w3-button w3-sky w3-hover-gray w3-margin-right" onclick="w3_open()">&#9776;</a>
  		<span>MENU</span>
	</header>
	
	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left:340px;margin-right:40px">

  		<!-- Header -->
  		<div class="w3-container  w3-center" style="margin-top:80px;" id="showcase">
    		<h1 class="w3-jumbo"><img src = "bok.png"><b>LIBRARY</b></h1>
    		<h1 class="w3-xxxlarge w3-text-gray"><b>&nbsp;&nbsp;도서수정</b>
    		</h1>
   
    		<hr style="width:100%; border:5px solid lightgray" class="w3-round">
 	 	</div>
		
	  <div class="w3-container w3-display-container w3-center" style="margin-top:80px;" id="showcase">
	  	</div> 
	  	<form action="book" >
	  <!-- update Form  -->	
	 <div class="w3-container w3-display-container"  style="margin-top:100px;"> 
	  <table class="w3-display-middle"  border="1" cellspacing="1" width="60%">
		  <tr>
			<td width=30%>도서 번호</td>
			<td width=70%>	
				<input type="text" name="bookno" placeholder="수정할 번호">			
			</td>
		  </tr>
		  <tr>
			<td width="30%">도서 제목</td>
			<td width="70%">	
				<input type="text" name="title" placeholder="title">			
			</td>
		  </tr>
		  <tr>
			<td width="30%">부제목</td>
			<td width="70%">
				<input type="text" name="subtitle" placeholder="subtitle">
			</td>
		  </tr>			  
		  <tr>
			<td width="30%">대분류</td>
			<td width="70%">
				<input type="text" name="bigclass" placeholder="1">
			</td>		  
		  <tr>	
		  <tr>
			<td width="30%">소분류</td>
			<td width="70%">	
				<input type="text" name="minclass" placeholder="2">			
			</td>
		  </tr>	
		  <tr>
			<td width="30%">저자</td>
			<td width="70%">	
				<input type="text" name="author" placeholder="author">			
			</td>
		  </tr>	
		  <tr>
			<td width="30%">출판사</td>
			<td width="70%">	
				<input type="text" name="company" placeholder="company">			
			</td>
		  </tr>	
		  <tr>
			<td width="30%">출판년도</td>
			<td width="70%">	
				<input type="text" name="pyear" placeholder="year">			
			</td>
		  </tr>		  

	</table>
</div>
	<%--? hidden tag완성 하세요
			 value값으로 설정해야 하는 값은? 
	--%>
	
	
	<div class="w3-container w3-display-container w3-center" style="margin-top:250px;margin-right:300px;" id="showcase">
	<div class="w3-display-bottomright">
	<button class="w3-button w3-hover-gray w3-white"" type="reset">취소</button>
	<input type="hidden" value="bookUpdate"  name="command">
	<button class="w3-button w3-hover-gray w3-white" type="submit">수정</button>
	</div>
	</div>
</form>
 	</div>
 	
 	
 	
		<!-- End page content -->
		<!-- W3.CSS Container -->
	<div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:58px"><p class="w3-right">Copyright &copy; 170915cskljs</p></div>

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