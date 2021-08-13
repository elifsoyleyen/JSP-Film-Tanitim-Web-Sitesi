<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String Turadi=request.getParameter("Turadi");
sayiNesnesi.setTuradi(Turadi);

int id=Integer.parseInt(String.valueOf(session.getAttribute("idTur")));
boolean islemSonucu=islemler.updateData(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Başarıyla kaydedilmiştir...");
    response.sendRedirect("Tur.jsp");
%>
else
	out.println("İşlem iptal edildi");

</body>
</html>