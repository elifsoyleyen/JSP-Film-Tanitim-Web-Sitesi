<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
<%


String Uyemail=request.getParameter("uyemail");


ResultSet rs=sayiCrud.uyelerlistele();
while (rs.next()){
     String mail=rs.getString("Uyemail");

     if(mail.equals(Uyemail))
     {
    	 String id=String.valueOf(rs.getInt("UyeID"));
    	 session.setAttribute("UyeID",id);
    	 System.out.println(id);
    	 
    	 Cookie UyeId = new Cookie("UyeID",id);
		 System.out.println(UyeId);
		 UyeId.setMaxAge(300); 
		 response.addCookie(UyeId);

    	 
    //Creating a result for getting status that messsage is delivered or not!
    String result;
    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = Uyemail;
    
    final String subject = "Şifremi Unuttum";
    
    final String messg = "http://localhost:8080/filmsitesiii/sifremiunuttummail.jsp";
    
    
    // Sender's email ID and password needs to be mentioned
    final String from = "sunucuodev.mail@gmail.com";
    final String pass = "Cada177.";  
    
    Properties properties = new Properties();
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.auth", "true");
    
    Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });

    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        // Set Subject: header field
        message.setSubject(subject);
        // Now set the actual message
        message.setText(messg);
        // Send message
        Transport.send(message);
        result = "Your mail sent successfully....";

        
    	

    } catch (MessagingException mex) {

        mex.printStackTrace();
        result = "Error: unable to send mail....";
    }
    
	  response.sendRedirect("NewFile1.jsp"); 



%>



<%

     }}
%>
