<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>


<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>


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
			<a href="AnaSayfa.jsp" ><%session.removeAttribute("idadmingiris"); %>Çıkış Yap</a>
			
			
			
	</div>
</div>

  <jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
<div id="content-wrapper">

  <div class="top-search-area">
   <form action="denesearch.jsp" method="post">
       <input type="text" name="arama" class="form-control" id="arama" placeholder="Search...">
       <%System.out.println(request.getParameter("arama")); %>
       
       	
       <button type="submit" value="Search" class="btn btn-info" >Search</button>
     
   </form>
 </div>

  <table class="table table-bordered">
    <tr>
        <th>FİLM ADI</th>
        <th>YÖNETMEN</th>
        <th>SENARYO</th>
        <th>YAPIM</th>
        <th>SÜRE</th>
        <th>OYUNCULAR</th>
        <th>FİLM KONUSU</th>
        <th>RESİM</th>
        <th>VİDEO</th>
        <th>TÜR</th>

    
  </tr>
  <% 
  
  ResultSet rss;
  String filmadi=request.getParameter("arama");
  if(filmadi==null)
  {
	  rss=sayiCrud.selectAllDatafilm();
	  
	  
  }
  else
  {
  
  rss=sayiCrud.aramayapmafilm(filmadi);
  }

	   while(rss.next()){
		   
		
		%>
		
		  <tr>
    <td><%=rss.getString("filmadi") %></td>
    <td><%=rss.getString("yönetmen") %></td>
    <td><%=rss.getString("senaryo") %></td>
     <td><%=rss.getString("yapim") %></td>
      <td><%=rss.getString("sure") %></td>
       <td><%=rss.getString("oyuncular") %></td>
        <td><%=rss.getString("filmkonusu") %></td>
     <td><img src="<%=rss.getString("resimyol") %>" alt="Resim" style="width:200px;height:200px;"></td>
      <td> <embed src="<%=rss.getString("videoyol") %>" style="width:500px;height:300px;"></td>
            
         <td><%=rss.getString("Turadi") %></td>
    
        <td><a href='guncellefilm.jsp?idfilm=<%=rss.getString("idfilm")%>'class="btn btn-success">Güncelle</a></td>
       <td><a href='silfilm.jsp?idfilm=<%=rss.getString("idfilm")%>'class="btn btn-danger">Sil</a></td>
    
  </tr>
	

<%} %>
	   
	 

	


</table>


</body>
</html>