<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="javax.swing.*"%>
<%@page import="java.security.MessageDigest"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="page" ></jsp:useBean>
</head>
<body>

 <% 
boolean sonuc=false;


    String ad = request.getParameter("kullaniciadi");
    String sifre = request.getParameter("sifre");
    MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
	mdAlgorithm.update(sifre.getBytes());

	byte[] digest = mdAlgorithm.digest();
	StringBuffer hexString = new StringBuffer();

	for (int i = 0; i < digest.length; i++) {
		sifre = Integer.toHexString(0xFF & digest[i]);

	    if (sifre.length() < 2) {
	    	sifre = "0" + sifre;
	    }

	    hexString.append(sifre);
	}

    int i=0;
    int sayi=0;
    System.out.println(ad);
    System.out.println(sifre);
    ResultSet rs=sayiCrud.selectDatakullanici();
    	while(rs.next())
    	{
    		sayi+=1;
    		String dbad=rs.getString("adminka");
    		String dbsf=rs.getString("adminsf");
        		
    	if(ad.equals(dbad)&& hexString.toString().equals(dbsf))
    	{   int idd=rs.getInt("idadmingiris");
    		session.setAttribute("idadmingiris",idd);
    		System.out.println("burdayım");
    		String sakladeger= "yeniSifre";
    		int j=0;

    		Cookie cookies [] = request.getCookies ();
    		System.out.println(cookies.length);
    		for (int c = 0; c < cookies.length; c++){
    			
    			System.out.println(cookies[c].getName());

    			
    			
        		if (cookies[c].getName().equals(sakladeger)){

        		String bulunan = cookies[c].getName();
            	System.out.println("hosgeldin");
            	response.sendRedirect("denemeana.jsp" );
        		break;
        		}
        		j+=1;
        		}
        		if(j==cookies.length){	
        			
        			
        	    int id=rs.getInt("idadmingiris");
            	System.out.println(cookies.length);
            	System.out.println(j);
            	response.sendRedirect("denemeana.jsp" );
            	session.setAttribute("idadmingiris",id);
            
            	}
        		
        		
        		
    	}
    	
    	else if(!ad.equals(dbad)|| !hexString.toString().equals(dbsf))
    	{
    		i+=1;	
    	}       
    	}
    	if (i==sayi){
    		  request.setAttribute("alert", "Hatalı Kullanıcı Adı veya Şifre");
    			RequestDispatcher rd1=request.getRequestDispatcher("AdminGiris.jsp");  
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