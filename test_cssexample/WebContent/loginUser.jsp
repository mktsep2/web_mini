<%@page import="model.vo.BookVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<%@ include file = "layout/head.jsp" %>
<body>
	<%@ include file = "layout/sidebarUser.jsp" %>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left:340px;margin-right:40px">

  		<!-- Header -->
  		<div class="w3-container  w3-center" style="margin-top:80px;" id="showcase">
    		<h1 class="w3-jumbo"><img src = "bok.png"><b>LIBRARY</b></h1>
    		<h1 class="w3-xxxlarge w3-text-gray"><b>도서정보</b>
    		</h1>
   
    		<hr style="width:100%; border:5px solid lightgray" class="w3-round">
   
  			<!-- Photo grid (modal) -->
    		
    		<c:forEach items="${sessionScope.allList}" var="bvo" varStatus="status">	
      				<img src="${bvo.imgsource}"  style="width:30%; padding:30px; text-align: center;" onclick="onClick(this,'${status.index}')" >
      				<input type="hidden" id="title_${status.index}" name="title_${status.index}" value="${bvo.title}">
      				<input type="hidden" id="author_${status.index}" name="author_${status.index}" value="${bvo.author}">
      				<input type="hidden" id="company_${status.index}" name="company_${status.index}" value="${bvo.company}">
    		</c:forEach>
<!--     			<div  class="w3-third"> -->
<!--       				<img src="images/book3.jpg" style="width:49%; padding:10px" onclick="onClick(this)" > -->
<!--       				<img src="images/book4.jpg" style="width:49%; padding:10px" onclick="onClick(this)" > -->
<!--     			</div> -->
<!--       			<div class="w3-third" > -->
<!--       				<img src="images/book5.jpg" style="width:49%; padding:10px" onclick="onClick(this)" > -->
<!--       				<img src="images/book6.jpg" style="width:49%; padding:10px" onclick="onClick(this)" > -->
<!--  				</div> -->
  			</div>
 	 	</div>
		
		<!-- Modal for full size images on click-->
  		<div id="modal01" class="w3-modal" style="padding-top:0" onclick="this.style.display='none'">
    		<span class="w3-button w3-black w3-xxlarge w3-display-topright">&times;</span>
    		<div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      			<img id="img01" class="w3-image" style="width:25%">
			<table class="w3-table-all w3-card-4 w3-centered w3-border" >
				<tr>
						<td>제목</td>				
						<td id="content1"></td>				
				</tr>
				<tr>
						<td>저자</td>				
						<td id="content2"></td>				
				</tr>
				<tr>
						<td>출판사</td>				
						<td id="content3"></td>				
				</tr>
			
			</table>
			</div>
  		</div>
  		
  		<!-- Services -->
  		<div class="w3-container" id="services" style="margin-top:10px">
  		</div>
  
  		<!-- Designers -->
  		<div class="w3-container" id="designers" style="margin-top:75px">
  		</div>

		<!-- End page content -->
	</div>

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
		function onClick(element, index) {
		  document.getElementById("img01").src = element.src;
		  document.getElementById("content1").innerHTML=document.getElementById("title_"+index).value;
		  document.getElementById("content2").innerHTML=document.getElementById("author_"+index).value;
		  document.getElementById("content3").innerHTML=document.getElementById("company_"+index).value;
		  document.getElementById("modal01").style.display = "block";
		  var captionText = document.getElementById("caption");
		  captionText.innerHTML = element.alt;
		}
	</script>
</body>
</html>