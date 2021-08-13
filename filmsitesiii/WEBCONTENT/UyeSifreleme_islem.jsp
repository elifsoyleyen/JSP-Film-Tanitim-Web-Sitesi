<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.MessageDigest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="filmsitesiii.veriislemler" ></jsp:useBean>

<body>
<%

String eski=request.getParameter("euyesf");
String yenisifre=request.getParameter("yuyesf");
String yenisifretekrar =request.getParameter("yuyesft");
int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));

MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(eski.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
	eski = Integer.toHexString(0xFF & digest[i]);

    if (eski.length() < 2) {
    	eski = "0" + eski;
    }

    hexString.append(eski);
}


ResultSet rs=islemler.selectDatauyelerr(id);
if(rs.next()){
	
	
	String sifre=rs.getString("Uyesf");
	if(hexString.toString().equals(sifre)){
		System.out.println("Eski şifre uyumlu");
		if(yenisifre.equals(yenisifretekrar)){
			
			System.out.println("Yeni şifreler uyumlu");

			
			MessageDigest mdAlgorithm1 = MessageDigest.getInstance("MD5");
			mdAlgorithm1.update(yenisifretekrar.getBytes());

			byte[] digest1 = mdAlgorithm1.digest();
			StringBuffer hexString1 = new StringBuffer();

			for (int i = 0; i < digest1.length; i++) {
				yenisifretekrar = Integer.toHexString(0xFF & digest1[i]);

			    if (yenisifretekrar.length() < 2) {
			    	yenisifretekrar = "0" + yenisifretekrar;
			    }

			    hexString1.append(yenisifretekrar);
			}
			
			System.out.println(hexString1.toString());

			sayiNesnesi.setUyesf(hexString1.toString());
			boolean islemSonucu=islemler.updateDataUye(sayiNesnesi,id);
			
			if (islemSonucu==true){
				 Cookie yeniSifre = new Cookie("yeniSifreUye", request.getParameter("yuyesf"));
				 yeniSifre.setMaxAge(120); 
				 response.addCookie(yeniSifre);		
				 request.setAttribute("alert", "Kayıt Başarılı");
				 request.setAttribute("UyeID", id);
	    			response.sendRedirect("AnaSayfa.jsp" );
	    			
	    			
	    			
	    		%>	<%String message1 = (String)request.getAttribute("alert"); %> 	
	    			<script type="text/javascript">
	    		    var msg = "<%=message1%>";
	    		    alert(msg);
	    		</script>

	    		  <%
		
			}

		}
		else
		{
			 request.setAttribute("alert", "Yeni Şifreler Aynı Değil");
				RequestDispatcher rd1=request.getRequestDispatcher("UyeSifreleme.jsp");  
				rd1.include(request, response);
				
			%>	<%String message = (String)request.getAttribute("alert"); %> 	
				<script type="text/javascript">
			    var msg = "<%=message%>";
			    alert(msg);
			</script>

			  <%
		
		}}
	
		
		
	else
	{
		 request.setAttribute("alert", "Eski Şifre ile Aynı Değil");
			RequestDispatcher rd1=request.getRequestDispatcher("UyeSifreleme.jsp");  
			rd1.include(request, response);
			
		%>	<%String message = (String)request.getAttribute("alert"); %> 	
			<script type="text/javascript">
		    var msg = "<%=message%>";
		    alert(msg);
		</script>

		  <%
		
		
	}
		
}


%>


</body>
</html>