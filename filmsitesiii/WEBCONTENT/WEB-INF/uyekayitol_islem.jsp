<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="page" ></jsp:useBean>
<body>

<%
boolean sonuc=false;


String UyeAdi=request.getParameter("UyeAdi");
String UyeSoyadi=request.getParameter("UyeSoyadi");
String Uyeka=request.getParameter("Uyeka");
String Uyesf=request.getParameter("Uyesf");
String Uyemail=request.getParameter("Uyemail");
String Uyeltel=request.getParameter("Uyeltel");





sayiNesnesi.setUyeAdi(UyeAdi);
sayiNesnesi.setUyeSoyadi(UyeSoyadi);
sayiNesnesi.setUyeka(Uyeka);
sayiNesnesi.setUyesf(Uyesf);
sayiNesnesi.setUyemail(Uyemail);
sayiNesnesi.setUyetel(Uyeltel);
sayiNesnesi.setUyesf(Uyesf);


sonuc=sayiCrud.ekle(sayiNesnesi);

if(sonuc==true)
	out.println("Veriler kaydedildi...");
    response.sendRedirect("Tur.jsp");
    
	%>

</body>
</html>

S