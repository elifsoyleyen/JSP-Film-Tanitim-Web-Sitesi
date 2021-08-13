<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
<body>
	<div id="menu">
				<a href="denemeanaa.jsp" > Ana Sayfaya Dön</a>
			<a href="Tur.jsp" >Tür</a>
			<a href="Duyuru.jsp" > Duyurular</a>
			<a href="filmlistele.jsp" >Filmler</a>
			<a href="iletisimanasayfa.jsp" >İletişim</a>
			<a href="yorumlistele.jsp" >Yorumlar</a>
			<a href="AdminSifreleme.jsp" >Şifre Güncelle</a>
		      <a href="cikisyapadmin.jsp" >Çıkış Yap</a>

	</div>

<body>

  </tr>
  <% 

  int id=Integer.parseInt(request.getParameter("İletisimID"));
  
  boolean sonuc=sayiCrud.deleteDatailetisim(id);
  if (sonuc)
	   {  
	  response.sendRedirect("iletisimanasayfa.jsp"); 
	   }
	 
  %>
	  

</body>
</html>