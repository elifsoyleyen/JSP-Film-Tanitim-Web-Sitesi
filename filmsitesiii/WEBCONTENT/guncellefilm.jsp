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
int id=Integer.parseInt(request.getParameter("idfilm"));
String filmadi;
String yönetmen;
String senaryo;
String yapim;
String sure;
String oyuncular;
String filmkonusu;
String videoyol;
String resimyol;
int idtur;


ResultSet rs=sayiCrud.selectDatafilm(id);
if (rs.next()){
	filmadi=rs.getString("filmadi");
	yönetmen=rs.getString("yönetmen");
	senaryo=rs.getString("senaryo");
	yapim=rs.getString("yapim");
	sure=rs.getString("sure");
	oyuncular=rs.getString("oyuncular");
	filmkonusu=rs.getString("filmkonusu");
    resimyol=rs.getString("resimyol");
    videoyol=rs.getString("videoyol");
	idtur=rs.getInt("idtur");
	session.setAttribute("idfilm",id);

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
  <form action="guncellefilm_islem.jsp" method="post">
   <div>
   <label>Film Adı </label>
	<div> 
        <input type="text" class="form-control" id="filmadi" name="filmadi" value="<%=rs.getString("filmadi")%>"/>    
    </div>
     <label>Yönetmen</label>
    <div> 
        <input type="text" class="form-control" id="yönetmen" name="yönetmen" value="<%=rs.getString("yönetmen")%>"/>    
    </div>
      <label>Senaryo</label>
    <div> 
        <input type="text" class="form-control" id="senaryo" name="senaryo" value="<%=rs.getString("senaryo")%>"/>    
    </div>
      <label>Yapım</label>
    <div> 
        <input type="text" class="form-control" id="yapim" name="yapim" value="<%=rs.getString("yapim")%>"/>    
    </div>
      <label>Süre</label>
    <div> 
        <input type="text" class="form-control" id="sure" name="sure" value="<%=rs.getString("sure")%>"/>    
    </div>
      <label>Oyuncular</label>
    <div> 
        <input type="text" class="form-control" id="oyuncular" name="oyuncular" value="<%=rs.getString("oyuncular")%>"/>    
    </div>
      <label>Film Konusu</label>
    <div> 
        <input type="text" class="form-control" id="filmkonusu" name="filmkonusu" value="<%=rs.getString("filmkonusu")%>"/>    
    </div>
      <div> 
        <input type="text" class="form-control" id="tb" name="tb" value="<%=rs.getInt("idtur")%>"/>    
    </div>
     
       <div>
        <label>RESİM</label>
        <input type="file"  id="resim"  name="resim" class="btn"/>

    </div>
    
    <div> 
      <input type="hidden" class="form-control" id="resimdene" name="resimdene"  />
       </div>
     <div>
        <label>VİDEO</label>
        <input type="file"  id="video"  name="video" class="btn"/>

    </div>
    
      <div> 
      <input type="hidden" class="form-control" id="videodene" name="videodene"  />
       </div>
    

     	<select id="idTur" >
     	<%
     	
    	ResultSet rss=sayiCrud.selectAllData();     	
      	while(rss.next()) 
      	{       	
		%>
		
		<%if (rss.getInt("idTur")==idtur){ %>
      	<option value="<%=rss.getInt("idTur")%>" selected="selected"><%=rss.getString("Turadi")%></option>
      		
      	<%} else{%>
      	<option value="<%=rss.getInt("idTur")%>"><%=rss.getString("Turadi")%></option>
      	<%}} }%></select>
  

<script>
$(function(){
$("#idTur").change(function() {
var deger = $(this).val();
$("#tb").val(deger);
});
})

</script>

<script>
$(function(){
$("#resim").change(function()
{
	var files = $("#resim").get(0).files;
	document.getElementById("resimdene").files[0].name; 
	
});
})
</script>
<script>
$(function(){
$("#video").change(function()
{
	var files = $("#video").get(0).files;
	document.getElementById("videodene").files[0].name; 
	
});
})
</script>



    <div style="margin-top:20px">
        <button class="btn btn-info" id="btn1">Film Güncelle</button>
    </div>
    </div>
  </form>
</div>
</div>
    <script>
        $('#btn1').click(function () {
            alert('Film Güncelleme Işlemi Yapıldı.');

        });
    </script>

 <script src="deneme/jsdene.js"></script>

</body>
</html>