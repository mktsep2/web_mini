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
    		<h1 class="w3-jumbo"><b>LIBRARY</b></h1>
    		<h1 class="w3-xxxlarge w3-text-gray"><b>도서정보</b>
    		</h1>
   
    		<hr style="width:100%; border:5px solid lightgray" class="w3-round">
   
  			<!-- Photo grid (modal) -->
  			<div class="w3-row">
    			<div class="w3-half" >
      				<img src="images/book758.jpg"  style="width:30%; padding:10px" onclick="onClick(this)" alt="asdasd3<br>짜증난다">
      				<img src="images/book757.jpg"  style="width:30%; padding:10px" onclick="onClick(this)" alt="Light, white and tight scandinavian design">
      				<img src="images/book756.jpg" style="width:30%; padding:10px" onclick="onClick(this)" alt="White walls with designer chairs">
    			</div>
      			<div class="w3-half" >
      				<img src="images/book755.jpg" style="width:30%; padding:10px" onclick="onClick(this)" alt="Windows for the atrium">
      				<img src="images/book754.jpg" style="width:30%; padding:10px" onclick="onClick(this)" alt="Bedroom and office in one space">
      				<img src="images/book753.jpg" style="width:30%; padding:10px" onclick="onClick(this)" alt="Scandinavian design">
 				</div>
  			</div>
 	 	</div>
		
		<!-- Modal for full size images on click-->
  		<div id="modal01" class="w3-modal" style="padding-top:0" onclick="this.style.display='none'">
    		<span class="w3-button w3-black w3-xxlarge w3-display-topright">&times;</span>
    		<div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    			<div class="w3-padding w3-display-topmiddle">Top Mid</div>
      			<img id="img01" class="w3-image" style="width:25%">
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
		function onClick(element) {
		  document.getElementById("img01").src = element.src;
		  document.getElementById("modal01").style.display = "block";
		  var captionText = document.getElementById("caption");
		  captionText.innerHTML = element.alt;
		}
	</script>
</body>
</html>