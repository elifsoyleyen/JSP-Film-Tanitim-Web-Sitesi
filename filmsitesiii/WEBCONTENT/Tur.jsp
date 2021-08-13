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
	</div>s
	<div id="logo"></div>
	<!--Menu-->
<div id="menu">
				<a href="AnaSayfa.jsp" > Ana Sayfaya Dön</a>
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
<form class="form-inline" method="post" action="aramayapma.jsp">
<select id="idTur" >
         	    
   	<% 

	ResultSet rs=sayiCrud.selectAllData();
  	while(rs.next()) 
  	{ %> 
  <option  value="<%=rs.getString("Turadi")%>"  ><%=rs.getString("Turadi")%></option>
  	<% } %></select>
  	      <input type="hidden" class="form-control" id="tb" name="tb"  />
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>
 <table class="table table-bordered">
    <tr>
        <th>TUR ADI</th>
        <th>GUNCELLE</th>
        <th>SIL</th>
        
  

    
  <% 
  ResultSet rst=sayiCrud.selectAllData();
  

  while(rst.next()) { %>
  <tr>
    <td><%=rst.getString("Turadi") %></td>

    <td><a href='guncelletur.jsp?idTur=<%=rst.getString("idTur")%>' class="btn btn-success">Güncelle</a></td>
    <td><a href='sil_islem.jsp?idTur=<%=rst.getString("idTur")%>' class="btn btn-danger">Sıl</a></td>
    
  </tr>
  <%} %>
</table>
<a href="ekle.jsp" class="btn btn-primary">YENI TÜR EKLE</a>


 <script src="deneme/jsdene.js"></script>

</div>

   <script>
$(function(){
$("#idTur").change(function() {
var deger = $(this).val();
$("#tb").val(deger);
});
})

</script>
</body>
</html>