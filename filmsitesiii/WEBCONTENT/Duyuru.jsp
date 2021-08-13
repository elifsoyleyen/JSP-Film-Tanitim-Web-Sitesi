<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<link href="deneme/cssdene.css" rel="stylesheet">
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

  <jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>


  	

</form>
 <div   id="pdfolustu">
 <table class="table table-bordered">
    <tr>
        <th>DUYURU BASLİK</th>
        <th>DUYURU İÇERİK</th>
        <th>GUNCELLE</th>
        <th>SIL</th>
        
   
  <% 
  ResultSet rs=sayiCrud.selectAllDataDuyuru();
  while(rs.next()) { %>
  <tr>
    <td><%=rs.getString("DuyuruBaslik") %></td>
    <td><%=rs.getString("Duyuruİcerik") %></td>

    <td><a href='guncelleduyuru.jsp?DuyuruID=<%=rs.getString("DuyuruID")%>'class="btn btn-success">Güncelle</a></td>
    <td><a href='sil_islem.jsp?DuyuruID=<%=rs.getString("DuyuruID")%>'class="btn btn-danger">Sil</a></td>
    
  </tr>
  <%} %>
</table>




</div>
<a href="duyuruekle.jsp" class="btn btn-primary">YENI DUYURU EKLE</a>
<a  class="btn btn-primary"  id=pdfcek onclick="pdfcek()">PDF</a>
 <script src="deneme/jsdene.js"></script>
 
 <script>
    function pdfcek() {
        var sTable = document.getElementById('pdfolustu').innerHTML;
        var style = "<style>";
        style = style + "table {width: 100%;font: 17px arial;}";
        style = style + "table, th, td {border: solid 1px #DDD; ";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=500,width=500');
        win.document.write('<html><head>');
        win.document.write('<title>Profile</title>'); 
        win.document.write(style);       
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);        
        win.document.close(); 	 
        win.print();    
    }
</script>

</body>
</html>