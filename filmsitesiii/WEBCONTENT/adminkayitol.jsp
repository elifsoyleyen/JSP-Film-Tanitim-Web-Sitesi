<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<html>
<body>

<!DOCTYPE html>
<html>
<head>
<title>Creative Colorlib SignUp Form</title>
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
<body>

	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Creative SignUp Form</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="adminkayitol_islem.jsp" method="post">
					<input class="text" type="text" name="adminka" placeholder="adminka" required="">
					<br>
						<input class="text email" type="email" name="mail" placeholder="Email" required="">
					<br>
					
						<input class="text" type="password" id="adminsf" name="adminsf" placeholder="Şifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="" >
					
					
					<br>
				
					
					<input class="text w3lpass" type="password" name="sifretekrar" placeholder="Şifre Tekrar" >
					
				
					<div class="wthree-text">
							<div id="message">
  	
 			 
 				 <p id="capital" class="invalid"> <b>Büyük Harf</b> </p>
 			 <p id="number" class="invalid"> <b>Numara</b></p>
 			 <p id="length" class="invalid"> <b>5 characters</b></p>
  
					</div>	
					
						<div class="clear"> </div>
					</div>
					
					<input type="submit" value=KAYITOL>
				</form>
		</div>
</div>
</div>


	  <script>
var myInput = document.getElementById("adminsf");

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
  if(myInput.value.length >= 5) {
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





