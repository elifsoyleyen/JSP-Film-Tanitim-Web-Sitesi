<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding ("UTF-8"); %>
    <%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="en">

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

    <!-- Styvesheet -->
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
                                <p>Hoş geldiniz</p>
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
                            System.out.println("anasayfaid"+id);
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
							     <li class="active"><a href="cikisyap.jsp">Çıkış Yap</a></li>
							
			
								
								
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

                            <!-- Nav Start -->
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
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
                
            </div>
        </div>
    </header>
    
    

    <section class="vizew-post-area mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-7 col-lg-8">
                    <div class="all-posts-area">
                        <!-- Section Heading -->
 
                        <!-- Section Heading -->
                        <div class="section-heading style-2">
                            <h4>FİLMLER</h4>
                            <div class="line"></div>
                        </div>

                  

 <% 
  ResultSet rs=sayiCrud.selectAllDatafilm();
  while(rs.next()) {
	   String filmid = rs.getString("idfilm");%>

		
                        <!-- Single Post Area -->
                        <div class="single-post-area mb-30">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="<%=rs.getString("resimyol") %>" style="width:300px;height:300px;">

                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <!-- Post Content -->
                                    <div class="post-content mt-0">
                                        <a href="single-post.html" class="post-title mb-2">FİLM ADI:<%=rs.getString("filmadi") %></a>
                                        <div class="post-meta d-flex align-items-center mb-2">
                                            <a href="#" class="post-author">YÖNETMEN:<%=rs.getString("yönetmen") %></a>
                                            <i class="fa fa-circle" aria-hidden="true"></i>
                                            <a href="#" class="post-date"><%=rs.getString("sure") %></a>

							
                                        </div>
                                        <p class="mb-2"></p>
                                   
                                       <a href='Detay.jsp?idfilm=<%=rs.getString("idfilm")%>' class="post-cata cata-sm cata-success">DETAYI GÖR</a>
                                       <%session.setAttribute("idfilm",filmid); %>

  											
                                    </div>
                                </div>
                            </div>
                        </div>

  <%} %>
                    </div>
                </div>



                
            </div>
        </div>
    </section>
    <!-- ##### Vizew Psot Area End ##### -->
  <% 
  ResultSet rsd=sayiCrud.selectAllDataDuyuru();
  while(rsd.next()) {
	 %>
    <!-- ##### Footer Area Start ##### -->
   <footer class="footer-area">
 
        <div class="container">
            <div class="row">
                <!-- Footer Widget Area -->
           

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">DUYURULAR</h6>
                        <!-- Twitter Slides -->
                        <div class="twitter-slides owl-carousel">

                            <!-- Single Twitter Slide -->
                            <div class="single--twitter-slide">
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i> <span></span> <%=rsd.getString("Duyuruİcerik") %></p>
                                </div>
                             
                            </div>
     

                        </div>
                            <%} %>
                    </div>
                </div>

       
      <% 
  ResultSet rsi=sayiCrud.selectAllDatailetisim();
  while(rsi.next()) {
	 %>

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">  <%=rsi.getString("İletisimAdres") %></h6>
                        <!-- Contact Address -->
                        <div class="contact-address">
                          
                            <p>Phone:  <%=rsi.getString("İletisimTel") %></p>
                            <p>Email:  <%=rsi.getString("İletisimMail") %></p>
                        </div>
                        <!-- Footer Social Area -->
                        <div class="footer-social-area">
                            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                            <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  <%} %>
    </footer>
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
