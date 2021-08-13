<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-9">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="page" ></jsp:useBean>
<%
boolean sonuc=false;

String Turadi=request.getParameter("Turadi");
out.println(Turadi);
sayiNesnesi.setTuradi(Turadi);
sonuc=sayiCrud.ekle(sayiNesnesi);

if(sonuc==true)
	out.println("Veriler kaydedildi...");
    response.sendRedirect("Tur.jsp");
	%>
</body>
</html>