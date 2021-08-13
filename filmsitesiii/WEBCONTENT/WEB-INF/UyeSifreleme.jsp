<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
<%

int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
String Uyeka;
String Uyesf;

ResultSet rs=sayiCrud.selectDatakullanicii(id);
if (rs.next()){
	Uyeka=rs.getString("Uyeka");
	Uyesf=rs.getString("Uyesf");
	session.setAttribute("UyeID",id);
	System.out.println(id);
}
%>

<link href="deneme/cssdene.css" rel="stylesheet">
<link href="vizew/kayitol.css" rel="stylesheet">
<body>

<div id="responsive-admin-menu">
	<div id="responsive-menu">
		<div class="menuicon">≡</div>
	</div>s
	<div id="logo"></div>

	<!--Menu-->
	<div id="menu">
			<a href="denemeanaa.jsp" > Ana Sayfaya Dön</a>
			<a href="Tur.jsp" >Tür</a>
			<a href="Duyuru.jsp" > Duyurular</a>
			<a href="filmlistele.jsp" >Filmler</a>
			<a href="iletisimanasayfa.jsp" >İletişim</a>
			<a href="yorumlistele.jsp" >Yorumlar</a>
			
			
	</div>
	
</div>

<div id="content-wrapper">

<div class="container">
  <form action="UyeSifreleme_islem.jsp">
    <label for="usrname"> Adi</label>
   
    <input type="text" id="Uyeka" value="<%=rs.getString("Uyeka")%> " name="Uyeka" required>
    
 <label for="usrname">Eski Sifre </label>
     <input type="password" id="euyesf" name="euyesf"  required>
  <%
    String eskisifre = request.getParameter("euyesf");
    %>
      <label for="psw">Yeni Sifre </label>
  <input type="password" id="yuyesf" name="yuyesf" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  required>
    
      <label for="psw">Yeni Sifre Tekrar  </label>
  <input type="password" id="yuyesft" name="yuyesft"  required>
    

    <input type="submit" value="Submit">
  </form>
  <div id="message">
  <h3>Password must contain the following:</h3>
  <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  <p id="number" class="invalid">A <b>number</b></p>
  <p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>
<a href="ekle.jsp" class="btn btn-primary"></a>
  
  
</div>


 <script src="deneme/jsdene.js"></script>

</div>
  <script>
var myInput = document.getElementById("yuyesf");
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