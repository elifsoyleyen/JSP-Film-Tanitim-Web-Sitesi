
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

String UyeAdi=request.getParameter("UyeAdi");
String UyeSoyadi=request.getParameter("UyeSoyadi");
String Uyeka=request.getParameter("Uyeka");
String Uyemail=request.getParameter("Uyemail");

sayiNesnesi.setUyeAdi(UyeAdi);
sayiNesnesi.setUyeSoyadi(UyeSoyadi);
sayiNesnesi.setUyeka(Uyeka);
sayiNesnesi.setUyemail(Uyemail);

int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
boolean islemSonucu=islemler.updateDataUyee(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Güncelleme İşlemi kaydedilmiştir...");
response.sendRedirect("iletisimanasayfa.jsp");


%>
</body>
</html>