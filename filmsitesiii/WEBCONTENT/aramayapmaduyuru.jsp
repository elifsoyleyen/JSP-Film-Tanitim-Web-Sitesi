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
			<a href="denemeanaa.jsp" > Ana Sayfaya Dön</a>
			<a href="Tur.jsp" >Tür</a>
			<a href="Duyuru.jsp" > Duyurular</a>
			<a href="filmlistele.jsp" >Filmler</a>
			<a href="iletisimanasayfa.jsp" >İletişim</a>
			<a href="yorumlistele.jsp" >Yorumlar</a>
			<a href="AdminSifreleme.jsp" >Şifre Güncelle</a>
			
			
	</div>
	
</div>

<div id="content-wrapper">
  <jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>


  
 <table class="table table-bordered">
    <tr>
        <th>Duyuru İcerik</th>
       
        
        	    
   	<% 
   	try{
	String DuyuruBaslik=request.getParameter("tb");
   	System.out.println(DuyuruBaslik);
	ResultSet rs=sayiCrud.selectAllDataDuyuru();
	
	while(rs.next()){
		String DuyuruBaslikk=rs.getString("DuyuruBaslik");
	 	System.out.println(DuyuruBaslikk);
		
  	if(DuyuruBaslik.equals(DuyuruBaslikk)) 
  	{
  		%>
  		 <tr>
  		 <td><%=rs.getString("Duyuruİcerik")%></td>
  		
  		
          </tr>

    <%}}}  catch (Exception e) {
    	e.printStackTrace();
    } %>
    
  
 
</table>
<a href="ekle.jsp" class="btn btn-primary">YENI KATEGORI EKLE</a>

 <script src="deneme/jsdene.js"></script>

</div>

</body>
</html>