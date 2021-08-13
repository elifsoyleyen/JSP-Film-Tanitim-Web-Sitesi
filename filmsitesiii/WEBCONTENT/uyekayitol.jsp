<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.security.MessageDigest"%>

<body>

<!DOCTYPE html>
<html>
<head>
<title>Üye Kayıt Ol</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="kayitoldeneme/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">

<link href="deneme/kayitol.css" rel="stylesheet">
<!-- //web font -->
</head>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler" scope="page"></jsp:useBean>
<body>



<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="page" ></jsp:useBean>
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Üye Kayıt Ol</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="uyekayitol_islem.jsp" method="post" name="form"  >
					<input class="text" type="text" name="UyeAdi" placeholder="Adı" required="" >
					<br>
					<input class="text" type="text" name="UyeSoyadi" placeholder="Soyad" required="">
					<br>
					<input class="text" type="text" name="Uyeka" placeholder="Kullanici Adi" required="">
					
					<input class="text email" id="Uyemail" type="email" name="Uyemail" placeholder="Email" required=""  >
					
					<input class="text" type="text" name="Uyeltel" placeholder="Telefon" required="">
					<br>
					<input class="text" type="password" id="Uyesf" name="Uyesf" placeholder="Şifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="" >
					
					<input class="text w3lpass" type="password" name="sifretekrar" placeholder="Şifre Tekrar"  required="">
					
		
					
				
					<div class="wthree-text">
							<div id="message">
  	
 			 <p id="letter" class="invalid"><b>Küçük Harf</b></p>
 			 <p id="capital" class="invalid"><b>Büyük Harf</b></p>
 			 <p id="number" class="invalid"><b>Numara</b></p>
 			 <p id="length" class="invalid">Minimum <b> karakter</b></p>
  
					</div>	
					
						<div class="clear"> </div>
					</div>
					
					<input type="submit" value=KAYITOL>
				</form>
		</div>
</div>
</div>

	  <script>
	 
var myInput = document.getElementById("Uyesf");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
}

  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }

  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>

       		
  
</body>
</html>





