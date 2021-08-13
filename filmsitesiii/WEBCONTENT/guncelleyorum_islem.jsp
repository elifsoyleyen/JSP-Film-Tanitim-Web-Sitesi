
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
String yorumicerik=request.getParameter("yorumicerik");
String durum=request.getParameter("tb");
System.out.println(durum);

sayiNesnesi.setyorumicerik(yorumicerik);
sayiNesnesi.setdurum(durum);



int id=Integer.parseInt(String.valueOf(session.getAttribute("idYorum")));
boolean islemSonucu=islemler.updateDatayorum(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Güncelleme İşlemi kaydedilmiştir...");
response.sendRedirect("yorumlistele.jsp");



%>
</body>
</html>