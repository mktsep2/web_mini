<%@page import="model.vo.BookVo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>LIBRARY</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<style>
html {
	background: #e0f1fb;
}

body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}

#tblBackground {
	/*
                     *  화면에 보여야 할 Table의 가로크기를 잡아줍니다.
                     */
	width: 100%;
	table-layout: fixed;
}

#divHeadScroll {
	/*
                     *  안의 내용이 790보다 길게 적용이 되므로 overflow-x, overflow-y를 hidden을 걸어줘서 설정한 가로너비만큼만 화면에 보이도록 잡아줍니다.
                     */
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead {
	/*
                     *  Table의 필드명의 너비를 여기에서 지정합니다.
                     *  필드명을 보여줄 테이블은 body보다 하나의 td를 더 가지며 마지막 td는 아무것도 입력하지 않고 크기만 잡아줍니다.
                     *  이렇게 하는 이유는 데이터를 보여주는 테이블은 세로 스크롤의 가로두께만큼 더 이동하기 때문입니다.
                     */
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 100%;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll {
	/*
                     *  overflow-x, overflow-y는 scroll로 지정하고,
                     *  height는 테이블의 데이터가 나올 기본 크기를 잡아줍니다.
                     *  세로길이를 잡아주지 않으면 overflow-y가 걸리지 않습니다.
                     */
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody {
	/*
                     * tblBody의 데이터는 필요한 열의 수만큼만 만드시고 헤더와 col의 width는 동일해야 합니다.
                     */
	width: 100%;
	table-layout: fixed;
	height: 30px;
	text-align:left;
	border-collapse: collapse;
}

/* 테이블 스타일용 */
.title {
 	text-align: center;
	font-weight: bold;
}

.content {
	border-bottom: 1px solid #efefef;
	padding: 10px 10px 10px 10px;
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
.content:hover {
    text-overflow: inherit;
    overflow: visible;
     font-weight: bold;
     font-size: 150%;
     color: yellow;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
		$('#divBodyScroll').scroll(function() {
			// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
			var xPoint = $('#divBodyScroll').scrollLeft();

			// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
			$('#divHeadScroll').scrollLeft(xPoint);
		});

		// 처음에 divBodyScroll의 세로스크롤 너비를 알수 없기 때문에
		// 스크롤을 우측으로 최대한 움직인 후 버튼을 눌러 두 스크롤의 차이를 찾아서 그 크기 만큼 tblHead의 공백 Column의 width를 지정해줍니다.
		$('#btnCheck').click(function() {
			var headMaximum = $('#divHeadScroll').scrollLeft();
			var bodyMaximum = $('#divBodyScroll').scrollLeft();

			alert('head: ' + headMaximum + '\nbody: ' + bodyMaximum);
		});
	});
</script>
</head>
<body>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-sky w3-collapse w3-top w3-large w3-padding"
		style="z-index: 3; width: 300px; font-weight: bold;" id="mySidebar">
		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-button w3-hover-gray w3-hide-large w3-display-topleft"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div class="w3-container">
			<h3 class="w3-padding-64">
		<a href="admin.jsp"><b>Kosta_Media<br>Library<br>By_${requestScope.id}님</b></a>
			</h3>
		</div>
		<div class="w3-bar-block">
			<div class="w3-dropdown-hover">
				<button class="w3-button w3-hover-gray w3-dropdownn-click">ADMIN</button>
				<div class="w3-dropdown-content w3-bar-block w3-border w3-whitee">
					<a href="book" class="w3-bar-item w3-button">도서 목록</a> 
					 <button onclick="document.getElementById('id01').style.display='block'" class="w3-bar-item w3-button">도서 추가</button>
						 <a href="#" class="w3-bar-item w3-button">도서 수정</a> 
						 <a href="#" class="w3-bar-item w3-button">도서 삭제</a>
				</div>
			</div>
		</div>
	</nav>
	
		<div id="id01" class="w3-modal">
  <div class="w3-modal-content">

    <header class="w3-container w3-teal"> 
      <span onclick="document.getElementById('id01').style.display='none'" 
      class="w3-button w3-display-topright">&times;</span>
      <h2>도서 추가</h2>
    </header>
			<form class="w3-container" action="book?command=insert">
<div class="w3-row">
  <div class="w3-half">
 			 	<p>
					<label>도서 제목</label> <input class="w3-input" type="text" style="width:50%">
				</p>
  				<p>
					<label>부 제목</label> <input class="w3-input" type="text" style="width:50%">
				</p>
				<p>
					<label>대분류</label> <input class="w3-input" type="text"   style="width:50%">
				</p>
				<p>
					<label>소분류</label> <input class="w3-input" type="text" style="width:50%">
				</p>
  </div>
  <div class="w3-half">
  	<p>
					<label>도서 번호</label> <input class="w3-input" type="text"  style="width:50%">
				</p>
				<p>
					<label>저자</label> <input class="w3-input" type="text" style="width:50%">
				</p>
				<p>
					<label>출판사</label> <input class="w3-input" type="text"  style="width:50%">
				</p>
				<p>
					<label>출판년도</label> <input class="w3-input" type="text" style="width:50%">
				</p>
  </div>
				
</div>
			<div class="w3-center">
			<input class="w3-button w3-center-align" type="submit"  style="width:25%" value="전&nbsp&nbsp&nbsp송">
			</div>
			</form>
			



  </div>
</div>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-sky w3-xlarge w3-padding">
		<a href="javascript:void(0)"
			class="w3-button w3-sky w3-hover-gray w3-margin-right"
			onclick="w3_open()">&#9776;</a> <span>MENU</span>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-display-container" style="margin-left: 340px; margin-right: 40px">
	
		<div class="w3-container">
			<h3>도서 목록 보기</h3>
		</div>

		<table class="w3-table" border="1" width="70%">
			<tr>
			</tr>
		</table>
		<table id="tblBackground" cellspacing="0">
			<tr>
				<td>
					<div id="divHeadScroll">
						<table id="tblHead" border="0">
							<colgroup>
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 15px;" />
							</colgroup>
							<tr>
								<td class="title">bookno</td>
								<td class="title">title</td>
								<td class="title">bigclass</td>
								<td class="title">minclass</td>
								<td class="title">autor</tD>
								<td class="title">compay</td>
								<td class="title">pyear</td>
								<td></td>
							</tr>
						</table>
					</div>
					<div id="divBodyScroll">
						<table id="tblBody" border="0">
							<colgroup>
								<col style="width: 100px;" class="right_border" />
								<col style="width: 100px;" class="right_border" />
								<col style="width: 100px;" class="right_border" />
								<col style="width: 100px;" class="right_border" />
								<col style="width: 100px;" class="right_border" />
								<col style="width: 100px;" class="right_border" />
								<col style="width: 100px;" class="right_border" />
							</colgroup>
							<c:forEach var="cvo" items="${requestScope.allList}">
								<tr>
									<td class="content right_border">${cvo.bookno}</td>
									<td class="content right_border">${cvo.title}</td>
									<td class="content right_border">${cvo.bigclass}</td>
									<td class="content right_border">${cvo.minclass}</td>
									<td class="content right_border">${cvo.author}</td>
									<td class="content right_border">${cvo.company}</td>
									<td class="content right_border">${cvo.pyear}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<div class="w3-right">
		<div class="w3-bar">
		  <a href="#" class="w3-button w3-hover-black">&laquo;</a>
		  <a href="#" class="w3-button w3-hover-black">1</a>
		  <a href="#" class="w3-button w3-hover-black">2</a>
		  <a href="#" class="w3-button w3-hover-black">3</a>
		  <a href="#" class="w3-button w3-hover-black">4</a>
		  <a href="#" class="w3-button w3-hover-black">&raquo;</a>
		</div>
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