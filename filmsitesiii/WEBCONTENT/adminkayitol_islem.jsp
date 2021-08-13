<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.*"%>
<%@page import="java.security.MessageDigest"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="page" ></jsp:useBean>
<body>

<%
boolean sonuc=false;

String Adminka=request.getParameter("adminka");
String Adminsf=request.getParameter("adminsf");
String AdminMail=request.getParameter("mail");
String SifreTekrar=request.getParameter("sifretekrar");
String tekrar=request.getParameter("sifretekrar");
System.out.println(Adminsf);

System.out.println(SifreTekrar);




MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(SifreTekrar.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
	SifreTekrar = Integer.toHexString(0xFF & digest[i]);

    if (SifreTekrar.length() < 2) {
    	SifreTekrar = "0" + SifreTekrar;
    }

    hexString.append(SifreTekrar);
}

ResultSet rs=sayiCrud.selectDatakullanici();
int sayi=0;
int sayi1=0;
while(rs.next()) 
{ sayi+=1;
	String Mail=rs.getString("mail");
	System.out.println(Mail);
	System.out.println(AdminMail);
	
	if(!AdminMail.equals(Mail)){
		sayi1+=1;

	}
	}
if(sayi1==sayi ){
	
   if(Adminsf.equals(tekrar)){
	   System.out.println(Adminsf);

	   System.out.println(SifreTekrar);

	   

		 sayiNesnesi.setadminka(Adminka);
		 sayiNesnesi.setadminsf(hexString.toString());
		 sayiNesnesi.setmail(AdminMail);
		 
	
		 sonuc=sayiCrud.adminekle(sayiNesnesi);
		 if(sonuc==true){
		     response.sendRedirect("denemeana.jsp");
	}
  }
   else{
	   System.out.println("Şifre Uyuşmazlığı!!");
   }
}


else {
	
	 System.out.println("Mail Kullanımda");
	
}
	%>

</body>
</html>

