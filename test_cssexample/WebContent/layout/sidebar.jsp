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
    		
    		<div class="w3-dropdown-hover">
   				<button class="w3-button w3-hover-gray w3-dropdownn-click">ADMIN</button>
   					<div class="w3-dropdown-content w3-bar-block w3-border w3-whitee">
     					&nbsp;&nbsp; password<br>&nbsp;&nbsp; <input type = "password" name ="id"><h6></h6>
     					<button class = "w3-button" location-href='index.html' >로그인</button>
     				</div>
				</div> 
     
  			</div>
		<div class="w3-container">
  			<div id="id01" class="w3-modal">
    			 <div class="w3-modal-content w3-card-4 w3-animate-zoom w3-round-large" style="max-width:600px">

				<div class="w3-center">
					<br> <span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-button w3-xlarge w3-transparent w3-display-topright w3-round-large"
						title="Close Modal">×</span>
				</div>

				<form class="w3-container" action="book">
					<div class="w3-section">
						<label><b>Username</b></label> <input
							class="w3-input w3-border w3-margin-bottom" type="text"
							placeholder="Enter Username" name="usrname" required> <label><b>Password</b></label>
						<input class="w3-input w3-border" type="text"
							placeholder="Enter Password" name="psw" required>
						<button class="w3-button w3-block w3-sky w3-section w3-padding w3-round-large w3-hover-gray"
							type="submit">Login</button>
						<button class="w3-button w3-block w3-sky w3-section w3-padding w3-round-large w3-hover-gray"
							type="button" location-href='index.html' >Signup</button>
						<input class="w3-check w3-margin-top" type="checkbox"
							checked="checked"> Remember me
					</div>
				</form>

				<div class="w3-container w3-padding-16 w3-light-grey w3-round-large">
					<button
						onclick="document.getElementById('id01').style.display='none'"
						type="button" class="w3-button w3-gray w3-round-large w3-hover-whitee">Cancel</button>
				</div>

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