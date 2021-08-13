<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@page import="java.sql.ResultSet"%>
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
 <link href="deneme/cssdene.css" rel="stylesheet">
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
</head>
<%
int id=Integer.parseInt(request.getParameter("DuyuruID"));
String DuyuruBaslik;
String Duyuruİcerik;

ResultSet rs=sayiCrud.selectDataDuyuru(id);
if (rs.next()){
	DuyuruBaslik=rs.getString("DuyuruBaslik");
	Duyuruİcerik=rs.getString("Duyuruİcerik");
	session.setAttribute("DuyuruID",id);
}
%>
<body>

<div id="responsive-admin-menu">
	<div id="responsive-menu">
		<div class="menuicon">≡</div>
	</div>
	
	<div id="logo"></div>

	<!--Menu-->
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
</div>
<div id="content-wrapper">

<div id="main">
<div class="container">
  <form action="guncelleduyuruislem.jsp" method="post">
   <div>
   <label>Duyuru Başlık </label>
	<div> 
        <input type="text" class="form-control" id="DuyuruBaslik" name="DuyuruBaslik" value="<%=rs.getString("DuyuruBaslik")%>"/>    
    </div>
     <label>Duyuru İçerik</label>
    <div> 
        <input type="text" class="form-control" id="Duyuruİcerik" name="Duyuruİcerik" value="<%=rs.getString("Duyuruİcerik")%>"/>    
    </div>
    <div style="margin-top:20px">
        <button class="btn btn-info" id="btn1">Duyuru Guncelle</button>
    </div>
    </div>
  </form>
</div>
</div>
    <script>
        $('#btn1').click(function () {
            alert('Duyuru Güncelleme Işlemi Yapıldı.');

        });
    </script>

 <script src="deneme/jsdene.js"></script>

</body>
</html>