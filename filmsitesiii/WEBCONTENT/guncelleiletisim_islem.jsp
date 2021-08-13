
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="filmsitesiii.veriislemler" scope="session"></jsp:useBean>
</head>
<body>

<%

String İletisimMail=request.getParameter("İletisimMail");
String İletisimTel=request.getParameter("İletisimTel");
String İletisimAdres=request.getParameter("İletisimAdres");
sayiNesnesi.setİletisimMail(İletisimMail);
sayiNesnesi.setİletisimTel(İletisimTel);
sayiNesnesi.setİletisimAdres(İletisimAdres);

int id=Integer.parseInt(String.valueOf(session.getAttribute("iletisimID")));
boolean islemSonucu=islemler.updateDatailetisim(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Güncelleme İşlemi kaydedilmiştir...");
response.sendRedirect("iletisimanasayfa.jsp");


%>
</body>
</html>