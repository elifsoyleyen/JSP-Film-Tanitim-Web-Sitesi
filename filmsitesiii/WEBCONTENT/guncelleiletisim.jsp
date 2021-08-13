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
int id=Integer.parseInt(request.getParameter("İletisimID"));
String İletisimMail;
String İletisimTel;
String İletisimAdres;


ResultSet rs=sayiCrud.selectDataDuyuru(id);
if (rs.next()){
	İletisimMail=rs.getString("İletisimMail");
	İletisimTel=rs.getString("İletisimTel");
	İletisimAdres=rs.getString("İletisimAdres");
	session.setAttribute("İletisimID",id);
}
%>
<body>

<div id="responsive-admin-menu">
	<div id="responsive-menu">
		<div class="menuicon">≡</div>
	</div>
	
	<div id="logo"></div>

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
  <form action="guncelleiletisim_islem.jsp" method="post">
   <div>
   <label>İletisim Mail </label>
	<div> 
        <input type="text" class="form-control" id="İletisimMail" name="İletisimMail" value="<%=rs.getString("İletisimMail")%>"/>    
    </div>
     <label>İletisim Telefon</label>
    <div> 
        <input type="text" class="form-control" id="İletisimTel" name="İletisimTel" value="<%=rs.getString("İletisimTel")%>"/>    
    </div>
    
    <label>İletisim Adres</label>
    <div> 
        <input type="text" class="form-control" id="İletisimAdres" name="İletisimAdres" value="<%=rs.getString("İletisimAdres")%>"/>    
    </div>
    <div style="margin-top:20px">
        <button class="btn btn-info" id="btn1">İletisim Güncelle</button>
    </div>
    </div>
  </form>
</div>
</div>
    <script>
        $('#btn1').click(function () {
            alert('İletisim Güncelleme Işlemi Yapıldı.');

        });
    </script>

 <script src="deneme/jsdene.js"></script>

</body>
</html>