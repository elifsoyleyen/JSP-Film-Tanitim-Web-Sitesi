<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.MessageDigest"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="filmsitesiii.veriislemler" ></jsp:useBean>

<body>


<%
String yenisifre=request.getParameter("yuyesf");
String yenisifretekrar =request.getParameter("yuyesft");
System.out.println(yenisifre);
System.out.println(yenisifretekrar);
String sakladeger= "UyeID";

Cookie cookies [] = request.getCookies ();
System.out.println(cookies.length);
System.out.println("Burdayım");

for (int c = 0; c < cookies.length; c++){
	if (cookies[c].getName().equals(sakladeger)){
		
		System.out.println(cookies[c].getValue());
		int id=Integer.parseInt(cookies[c].getValue());
		ResultSet rs=islemler.selectDatauyeler(id);
		if(rs.next()){			
			if(yenisifre.equals(yenisifretekrar)){
				
				MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
				mdAlgorithm.update(yenisifretekrar.getBytes());

				byte[] digest = mdAlgorithm.digest();
				StringBuffer hexString = new StringBuffer();

				for (int i = 0; i < digest.length; i++) {
					yenisifretekrar = Integer.toHexString(0xFF & digest[i]);

				    if (yenisifretekrar.length() < 2) {
				    	yenisifretekrar = "0" + yenisifretekrar;
				    }

				    hexString.append(yenisifretekrar);
				}
			
			sayiNesnesi.setUyesf(hexString.toString());
			
			boolean islemSonucu=islemler.updateDataUye(sayiNesnesi,id);
				if (islemSonucu==true){
					out.println("Güncelleme İşlemi kaydedilmiştir...");	
				
					 Cookie yeniSifre = new Cookie("yeniSifreUye", request.getParameter("yuyesf"));
					 session.removeAttribute("UyeID");	
					 yeniSifre.setMaxAge(120); 
					 response.addCookie(yeniSifre);		
					 response.sendRedirect("AnaSayfa.jsp"); 
					  

		           }
			}
		}
	}
	
}	



%>
</body>
</html>