<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.*"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="javax.swing.JOptionPane"%>


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

String UyeAdi=request.getParameter("UyeAdi");
String UyeSoyadi=request.getParameter("UyeSoyadi");
String Uyeka=request.getParameter("Uyeka");
String Uyesf=request.getParameter("Uyesf");
String Uyemail=request.getParameter("Uyemail");
String Uyeltel=request.getParameter("Uyeltel");
String SifreTekrar=request.getParameter("sifretekrar");
System.out.println(SifreTekrar);
String tekrar=request.getParameter("sifretekrar");



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





ResultSet rs=sayiCrud.selectDatauyeler();
int sayi=0;
int sayi1=0;
while(rs.next()) 
{ sayi+=1;
	String Mail=rs.getString("Uyemail");
	
	if(!Uyemail.equals(Mail)){
		sayi1+=1;

	}
	
	}
if(sayi1==sayi){
	
   if(Uyesf.equals(tekrar)){

		 sayiNesnesi.setUyeAdi(UyeAdi);
		 sayiNesnesi.setUyeSoyadi(UyeSoyadi);
		 sayiNesnesi.setUyeka(Uyeka);
		 sayiNesnesi.setUyesf(hexString.toString());
		 sayiNesnesi.setUyemail(Uyemail);
		 sayiNesnesi.setUyetel(Uyeltel);
		 sonuc=sayiCrud.uyelerekle(sayiNesnesi);
		 if(sonuc==true){
			 request.setAttribute("alert1", "Kayıt Başarılı");
				RequestDispatcher rd1=request.getRequestDispatcher("uyegiris.jsp");  
				rd1.include(request, response);
				
			%>	<%String message2 = (String)request.getAttribute("alert1"); %> 	
				<script type="text/javascript">
			    var msg = "<%=message2%>";
			    alert(msg);
			</script>

			  <%
			 
			 Cookie yeniSifre = new Cookie("yeniSifreUye", request.getParameter("Uyesf"));
			
			 yeniSifre.setMaxAge(120); 
			 response.addCookie(yeniSifre);		
			
	}
  }
   else{
	   
	   
	
	   request.setAttribute("alert", "Şifre Uyuşmazlığı");
		RequestDispatcher rd1=request.getRequestDispatcher("uyekayitol.jsp");  
		rd1.include(request, response);
		
	%>	<%String message1 = (String)request.getAttribute("alert"); %> 	
		<script type="text/javascript">
	    var msg = "<%=message1%>";
	    alert(msg);
	</script>

	  <%
	
   }
   
   
}


else {
	
	request.setAttribute("alertMsg", "Mail Kullanımda");
	RequestDispatcher rd=request.getRequestDispatcher("uyekayitol.jsp");  
	rd.include(request, response);
	
	%><% String message = (String)request.getAttribute("alertMsg");%>
	 
	<script type="text/javascript">
	    var msg = "<%=message%>";
	    alert(msg);
	</script>
	
	<%
	
	}%>


	 
	 
	 




</body>
</html>

