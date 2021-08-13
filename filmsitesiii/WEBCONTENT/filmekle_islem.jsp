<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>


<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="page" ></jsp:useBean>
<%
boolean sonuc=false;

String filmadi=request.getParameter("filmadi");
String yönetmen=request.getParameter("yönetmen");
String senaryo=request.getParameter("senaryo");
String yapim=request.getParameter("yapim");
String sure=request.getParameter("sure");
String oyuncular=request.getParameter("oyuncular");
String filmkonusu=request.getParameter("filmkonusu");
int idtur=Integer.parseInt(request.getParameter("tb"));

String resimyolu=request.getParameter("resim");
String resimyol=resimyolu.replace("C:\\Users\\elif\\eclipse-workspace\\filmsitesiii\\WEBCONTENT\\resimler\\","");
String resimyoluu=resimyol.replace("\\","\\\\");
resimyoluu="resimler/"+resimyoluu;
System.out.println(resimyolu);


String videoyolu=request.getParameter("video");
String videoyol=videoyolu.replace("C:\\Users\\elif\\eclipse-workspace\\filmsitesiii\\WEBCONTENT\\","");
String videoyoluu=videoyol.replace("\\","\\\\");
videoyoluu="video/"+videoyoluu;
		
sayiNesnesi.setfilmadi(filmadi);
sayiNesnesi.setyönetmen(yönetmen);
sayiNesnesi.setsenaryo(senaryo);
sayiNesnesi.setyapim(yapim);
sayiNesnesi.setsure(sure);
sayiNesnesi.setoyuncular(oyuncular);
sayiNesnesi.setfilmkonusu(filmkonusu);
sayiNesnesi.setidtur(idtur);
sayiNesnesi.setresimyol(resimyoluu);
sayiNesnesi.setvideoyol(videoyoluu);

sonuc=sayiCrud.eklefilm(sayiNesnesi);
if(sonuc==true)
    response.sendRedirect("filmlistele.jsp");
	%>

</body>
</html>