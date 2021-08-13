
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
<jsp:useBean id="sayiNesnesi" class="filmsitesiii.sayiBilgisi" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="filmsitesiii.veriislemler" scope="session"></jsp:useBean>
</head>
<body>

<%

String UyeAdi=request.getParameter("UyeAdi");
String UyeSoyadi=request.getParameter("UyeSoyadi");
String Uyeka=request.getParameter("Uyeka");
String Uyemail=request.getParameter("Uyemail");

sayiNesnesi.setUyeAdi(UyeAdi);
sayiNesnesi.setUyeSoyadi(UyeSoyadi);
sayiNesnesi.setUyeka(Uyeka);
sayiNesnesi.setUyemail(Uyemail);

int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
ResultSet rs=islemler.selectDatauyelerr(id);
if(rs.next()){
	
	String mail=rs.getString("Uyemail");



ResultSet rss=islemler.selectDatauyeler();
int arttir=0;
int sayi=0;
while(rss.next()){
	sayi+=1;

		if(!mail.equals(Uyemail) && rss.getString("Uyemail").equals(Uyemail))
		{	System.out.println("Mail Kullanımda");
		
		 request.setAttribute("alert", "Mail Kullanımda");
			RequestDispatcher rd1=request.getRequestDispatcher("uyebilgi.jsp");  
			rd1.include(request, response);
			
		%>	<%String message = (String)request.getAttribute("alert"); %> 	
			<script type="text/javascript">
		    var msg = "<%=message%>";
		    alert(msg);
		</script>

		  <%
		 break;
		
			
		
		}
		arttir+=1;
}



if(sayi==arttir){

boolean islemSonucu=islemler.updateDataUyee(sayiNesnesi,id);

if (islemSonucu==true)
{
	
		
	 session.setAttribute("UyeID",id);
	
	 request.setAttribute("alert", "Güncelleme İşlemi Başarıyla Gerçekleşmiştir.");
		RequestDispatcher rd1=request.getRequestDispatcher("AnaSayfa.jsp");  
		rd1.include(request, response);
		
	%>	<%String message = (String)request.getAttribute("alert"); %> 	
		<script type="text/javascript">
	    var msg = "<%=message%>";
	    alert(msg);
	</script>

	  <%
}

}

}





%>
</body>
</html>