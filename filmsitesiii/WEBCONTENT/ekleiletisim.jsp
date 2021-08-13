<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<form action="iletisimekle_islem.jsp" method="post">
<label>İletisim Mail </label>
<div> 
        <input type="text" class="form-control" id="İletisimMail" name="İletisimMail" required="" />

    </div>
    <label>İletisim Telefon </label>
    <div> 
      <input type="text" class="form-control" id="İletisimTel" name="İletisimTel" required="" />
       </div>
       
        <label>İletisim Adres </label>
    <div> 
      <input type="text" class="form-control" id="İletisimAdres" name="İletisimAdres" required="" />
       </div>
 <div style="margin-top:20px">
        <button class="btn btn-info" id="btn1">İletişim Ekle</button>
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