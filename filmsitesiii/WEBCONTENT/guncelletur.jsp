<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@page import="java.sql.ResultSet"%>
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
 <link href="deneme/cssdene.css" rel="stylesheet">
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
int id=Integer.parseInt(request.getParameter("idTur"));
String Turadi;

ResultSet rs=sayiCrud.selectData(id);
if (rs.next()){
	Turadi=rs.getString("Turadi");
	session.setAttribute("idTur",id);
	request.setCharacterEncoding("UTF-8");

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
			  <a href="cikisyapadmin.jsp" >Çıkış Yap</a>
			
			
	</div>
</div>
<div id="content-wrapper">

<div id="main">
<div class="container">
  <form action="guncelletur_islem.jsp" method="post">
   <div>
   <label>Tür Adi</label>
	<div> 
        <input type="text" class="form-control" id="Turadi" name="Turadi" value="<%=rs.getString("Turadi")%>"/>    
    </div>
    <div style="margin-top:20px">
        <button class="btn btn-info" id="btn1">Tür Guncelle</button>
    </div>
    </div>
  </form>
</div>
</div>
    <script>
        $('#btn1').click(function () {
            alert('Tür Güncelleme Işlemi Yapıldı.');

        });
    </script>

 <script src="deneme/jsdene.js"></script>

</div>
</body>
</html>