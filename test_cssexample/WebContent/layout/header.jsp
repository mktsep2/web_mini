<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>LIBRARY</title>
</head>
<body>
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-sky w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  		<a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hover-gray w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  		<div class="w3-container">
    		<h3 class="w3-padding-64"><b>Kosta_Media<br>Library</b></h3>
  		</div>
  		<div class="w3-bar-block">
  			<button onclick="document.getElementById('id01').style.display='block'" class="w3-bar-item w3-button w3-hover-gray">USER</button>
    		<a href="#showcase" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-gray">ADMIN</a> 
  		</div>
		<div class="w3-container">
  			<div id="id01" class="w3-modal">
    			<div class="w3-modal-content w3-card-4">
      				<header class="w3-container w3-teal"> 
        				<span onclick="document.getElementById('id01').style.display='none'" 
        					class="w3-button w3-display-topright">&times;
        				</span>
        				<h2>로그인</h2>
     				</header>
      				<div class="w3-container">
  						<form action="book">
  							<input type="submit" value="로그인">
  						</form>
        				<p>Some text..</p>
        				<p>Some text..</p>
      				</div>
      				<footer class="w3-container w3-teal">
        				<p>Modal Footer</p>
      				</footer>
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