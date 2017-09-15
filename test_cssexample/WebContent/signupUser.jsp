<%@page import="model.vo.BookVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<%@ include file = "layout/head.jsp" %>
<body>
	<%@ include file = "layout/sidebar.jsp" %>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left:340px;margin-right:40px">

  		<!-- Header -->
  		<div class="w3-container  w3-center" style="margin-top:80px;" id="showcase">
    		<h1 class="w3-jumbo"><img src = "bok.png"><b>LIBRARY</b></h1>
    		<h1 class="w3-xxxlarge w3-text-gray"><b>&nbsp;&nbsp;회원가입</b>
    		</h1>
   
    		<hr style="width:100%; border:5px solid lightgray" class="w3-round">
 	 	</div>
		
	  <div class="w3-container w3-display-container w3-center" style="margin-top:80px;" id="showcase">
	  	</div> 
	  	<form action="cust" method="post">
	  <!-- update Form  -->	
	 <div class="w3-container w3-display-container"> 
	  <table class="w3-display-middle"  border="1" cellspacing="1" width="60%">
		  <tr>
			<td width=30%>아이디</td>
			<td width=70%>	
				<input type="text" name="id" placeholder="id">			
			</td>
		  </tr>
		  <tr>
			<td width="30%">이름</td>
			<td width="70%">	
				<input type="text" name="name" placeholder="name">			
			</td>
		  </tr>
		  <tr>
			<td width="30%">비밀번호</td>
			<td width="70%">
				<input type="password" name="password" placeholder="password">
			</td>
		  </tr>			  
		
		  <tr>
		
			<td width="30%">이메일</td>
			<td width="70%">
				<input type="email" name="email" placeholder="email">
			</td>		  
		  <tr>				  
	</table>
</div>
	<%--? hidden tag완성 하세요
			 value값으로 설정해야 하는 값은? 
	--%>
	
	
	<div class="w3-container w3-display-container w3-center" style="margin-top:150px;margin-right:300px;" id="showcase">
	<div class="w3-display-bottomright">
	<button class="w3-button w3-hover-gray w3-white"" type="reset">취소</button>
	<input type="hidden" value="insert"  name="command">
	<button class="w3-button w3-hover-gray w3-white" type="submit">가입</button>
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