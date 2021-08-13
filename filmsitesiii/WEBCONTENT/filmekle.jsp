<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
<form action="filmekle_islem.jsp" method="post">
<label>Film Adı </label>
<div> 
        <input type="text" class="form-control" id="filmadi" name="filmadi" required="" />
    </div>
    <label>Yönetmen </label>
    <div> 
      <input type="text" class="form-control" id="yönetmen" name="yönetmen" required="" />
       </div>
       
       <label>Senaryo </label>
    <div> 
      <input type="text" class="form-control" id="senaryo" name="senaryo" required="" />
       </div>
       
           <label>Yapım </label>
    <div> 
      <input type="text" class="form-control" id="yapim" name="yapim" required="" />
       </div>


    <label>Süre  </label>
    <div> 
      <input type="text" class="form-control" id="sure" name="sure" required="" />
       </div>
       
           <label>Oyuncular </label>
    <div> 
      <input type="text" class="form-control" id="oyuncular" name="oyuncular" required="" />
       </div>
       
           <label>Film Konusu </label>
    <div> 
      <input type="text" class="form-control" id="filmkonusu" name="filmkonusu" required="" />
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
    
   
    
         <label>Tür </label>
         	<select id="idTur" >
         	    
    <jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
   	<% 

	ResultSet rs=sayiCrud.selectAllData();
  	while(rs.next()) 
  	{ %> 
  <option  value="<%=rs.getInt("idTur")%>"  ><%=rs.getString("Turadi")%></option>
  	<% } %></select>
  	

  	 <input type="button" id="btn" value="TIKLA">
    <div id="kutu"></div>
	<script>
	$(document).ready(function() {
 
//Seçim yapılıp butona tıklandığında çalışacak kodlar

$("#btn").on("click",function(){
//var sonuc;
alert($("#idTur").val()+ " isimli film seçili");
});
 
//Seçim değiştiğinde çalışacak kodlar
 
$("#idTur").on("change",function(){
$("#kutu").html($("#idTur").val());
})
 
});
	
	</script>
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


	 <div> 
      <input type="text" class="form-control" id="tb" name="tb"  />
       </div>
	 <div> 
      <input type="hidden" class="form-control" id="tbres" name="tbres"  />
       </div>
       
        <div> 
      <input type="hidden" class="form-control" id="tbvideo" name="tbvideo"  />
       </div>
   
 <div style="margin-top:20px">
        <button class="btn btn-info" id="btn1">Film Ekle</button>
    </div>
  <script>
        $('#btn1').click(function () {
            alert('Ekleme İşlemi Başarı İle Gerçekleşti')
        });
    </script>

 <script src="deneme/jsdene.js"></script>

</div>
</body>
</html>