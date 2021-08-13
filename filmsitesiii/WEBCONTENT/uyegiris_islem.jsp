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

    String ad = request.getParameter("Uyeka");
    String sifre = request.getParameter("Uyesf");
    
    
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
    
    ResultSet rs=sayiCrud.selectDatauyeler();
    	while(rs.next())
    	{ 
    		sayi+=1;
    		String dbad=rs.getString("Uyeka");
    		String dbsf=rs.getString("Uyesf");
        		
    	if(ad.equals(dbad)&& hexString.toString().equals(dbsf))
    	{
    		int idd=rs.getInt("UyeID");
     		session.setAttribute("UyeID",idd);
     		System.out.println("burdayım");
     		String sakladeger= "yeniSifreUye";
     		int j=0;

     		Cookie cookies [] = request.getCookies ();
     		System.out.println(cookies.length);
     		for (int c = 0; c < cookies.length; c++){
     			System.out.println(cookies[c].getName());
     			int id=rs.getInt("UyeID");
         		if (cookies[c].getName().equals(sakladeger)){
         		String bulunan = cookies[c].getName();
             	System.out.println("hosgeldin");
             	System.out.println("burdayım111");
             	System.out.println(id);
             	session.setAttribute("UyeID",id);
             	response.sendRedirect("AnaSayfa.jsp");
             	System.out.println("burdayım222");
           
         		break;
        		}
         		j+=1;
    		}
     		System.out.println(j);
     		System.out.println(cookies.length);
        		 if(j==cookies.length){
        			
        	    int id=rs.getInt("UyeID");
            	System.out.println(id);
            	System.out.println("hosgeldin");
            	response.sendRedirect("UyeSifreleme.jsp" );
            	session.setAttribute("UyeID",id);
          
            	}
        	}
    	
    	else if(!ad.equals(dbad)|| !hexString.equals(dbsf))
    	{
    		i+=1;	
    	}       
    	}
    	if (i==sayi){
    		 request.setAttribute("alert", "Hatalı Kullanıcı Adı veya Şifre");
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