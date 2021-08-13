<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding ("UTF-8"); %>
 <%@page import="java.sql.ResultSet"%>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="page" ></jsp:useBean>


<%



boolean sonuc=false;
DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm");
Date dateobj = new Date();
String yorumicerik=request.getParameter("yorumicerik");
int filmid=Integer.parseInt(String.valueOf(session.getAttribute("idfilm")));
String yorumtarih=df.format(dateobj);
String durum="False";

try{
int uyeid=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
System.out.println(uyeid);
String dene=Integer.toString(uyeid);
								
if(dene!=null){


	sayiNesnesi.setyorumicerik(yorumicerik);
	sayiNesnesi.setuyeid(uyeid);
	sayiNesnesi.setfilmid(filmid);
	sayiNesnesi.setyorumtarih(yorumtarih);
	sayiNesnesi.setdurum(durum);
	
	
	sonuc=sayiCrud.ekleyorum(sayiNesnesi);
	if(sonuc==true){
		 request.setAttribute("alert", "Yorumunuz Onaylandıktan Sonra Göreceksiniz...");
 			RequestDispatcher rd1=request.getRequestDispatcher("AnaSayfa.jsp");  
 			rd1.include(request, response);
 			
 		%>	<%String message1 = (String)request.getAttribute("alert"); %> 	
 			<script type="text/javascript">
 		    var msg = "<%=message1%>";
 		    alert(msg);
 		</script>

 		  <%
	
	}

  }
}

catch(Exception e) {
	System.out.println("aa");
	
	 request.setAttribute("alert", "Yorum yapmanız için üye olmanız gerekli...");
		RequestDispatcher rd1=request.getRequestDispatcher("uyegiris.jsp");  
		rd1.include(request, response);
		
	%>	<%String message1 = (String)request.getAttribute("alert"); %> 	
		<script type="text/javascript">
	    var msg = "<%=message1%>";
	    alert(msg);
	</script>

	  <%
		
		
	}

%>


</body>
</html>