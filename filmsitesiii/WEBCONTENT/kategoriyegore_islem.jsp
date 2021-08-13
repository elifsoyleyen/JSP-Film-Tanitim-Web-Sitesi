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
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
       
        </div>
    </div>

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
								
								%><li class="active"><a href="index.html"><%=rsu.getString("Uyeka")%></a></li>
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
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->


    <!-- ##### Vizew Post Area Start ##### -->
    <section class="vizew-post-area mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-7 col-lg-8">
                    <div class="all-posts-area">
                        <!-- Section Heading -->
 
                        <!-- Section Heading -->
                        <div class="section-heading style-2">
                            <h4>Filmler</h4>
                            <div class="line"></div>
                        </div>

                  

 <% 
 

  String Turadi=request.getParameter("tb");
 System.out.println(Turadi);
  ResultSet rs=sayiCrud.selectAllDatafilm();
  while(rs.next()) {
	  String filmid = rs.getString("idfilm");
	  System.out.println(filmid);

	  String filmtur=rs.getString("Turadi");
	  System.out.println(filmtur);
	  
	  if(Turadi.equals(filmtur))
	  
		 {
	   %>

		
                        <!-- Single Post Area -->
                        <div class="single-post-area mb-30">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6">
                                    <!-- Post Thumbnail -->
                                    <div class="post-thumbnail">
                                        <img src="<%=rs.getString("resimyol") %>" alt="">

                                       
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

                 
  <%} }%>
                    </div>
                </div>

                
            </div>
        </div>
    </section>
    <!-- ##### Vizew Psot Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">
         
          
            </div>
        </div>

        <!-- Copywrite Area -->
        <div class="copywrite-area">
            <div class="container">
               
            </div>
        </div>
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
