
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Vizew - Blog &amp; Magazine HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="vizew/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="vizew/style.css">
</head>
<body>

<!-- Preloader -->


    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Top Header Area -->
       <div class="top-header-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12 col-md-6">
                        <!-- Breaking News Widget -->
                        <div class="breaking-news-area d-flex align-items-center">
                            <div class="news-title">
                                <p>Hoşgeldiniz</p>
                            </div>
                            <div id="breakingNewsTicker" class="ticker">
                                <ul>
                                    <li><a href="single-post.html">En sevdiğiniz Film Nedir?</a></li>
                                    <li><a href="single-post.html">Acaba Hangi Filmi İzlesem ?.</a></li>
                                    <li><a href="single-post.html"></a>Film Şeridi..</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="top-meta-data d-flex align-items-center justify-content-end">
                            <!-- Top Social Info -->
                       
                         
                            <!-- Login -->
                            <jsp:useBean id="sayiCrud" class="filmsitesiii.veriislemler"></jsp:useBean>
                            
                            <%
							try{
							int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
                            System.out.println(id);
                            String dene=Integer.toString(id);
                            
							String Uyeka;
							String Uyesf;		
							if(dene!=null){
							ResultSet rsu=sayiCrud.selectDatauyelerr(id);
							if (rsu.next()){
								Uyeka=rsu.getString("Uyeka");
								Uyesf=rsu.getString("Uyesf");
								session.setAttribute("UyeID",id);
								System.out.println(id);
								
								%><li class="active"><a><%=rsu.getString("Uyeka")%></a></li>
							    <li class="active"><a href="uyebilgi.jsp">Üye Bilgilerim</a></li>
							    <li class="active"><a href="UyeSifreleme.jsp">Şifremi Değiştir</a></li>
						
							       
								
								
							<%}}%>
							
							<%
							}
							
                            catch(Exception e) {
                            	
                            	%>
                            	
                            	  <a href="uyegiris.jsp" class="login-btn"><i class="fa fa-users" aria-hidden="true"></i></a>
                            	   <a href="AdminGiris.jsp" class="login-btn"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
						
                            <%	}	%>
                          

                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar Area -->
        <div class="vizew-main-menu" id="sticker">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">

                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="vizewNav">

                        <!-- Nav brand -->
                        <a href="index.html" class="nav-brand"><img src="vizew/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                       <div class="classynav">
                                <ul>
                                    <li class="active"><a href="AnaSayfa.jsp">AnaSayfa</a></li>
                                    <li><a href="kategoriyegore.jsp">Kategoriye Göre Film Arama</a></li>
                                    
                               
                                      
                                    </li>
                                    <li>
                                        <div class="megamenu"> 
                                           
                                        </div>
                                    </li>
                                  
                                </ul>
                            </div>
                                       
    </header>

 
    <!-- ##### Login Area Start ##### -->
    <div class="vizew-login-area section-padding-80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                     <div class="login-content">
                        <!-- Section Title -->
                        <div class="section-heading">
                            <h4>Şifrenizi Mi Unuttunuz?</h4>
                            <div class="line"></div>
                        </div>
      
                      <form action="mail.jsp" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="uyemail" name="uyemail" placeholder="Mailinizi Giriniz..!" required="" >
                            </div>
                            
                          
                           
                           
                            <div class="form-group">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                   
                                </div>
                            </div>
                            <button type="submit" class="btn vizew-btn w-100 mt-30" id="btn1">Gönder</button>
                      
                             
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Login Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
 
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="vizew/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="vizew/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="vizew/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="vizew/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="vizew/js/active.js"></script>
    
   
    
</body>
</html>