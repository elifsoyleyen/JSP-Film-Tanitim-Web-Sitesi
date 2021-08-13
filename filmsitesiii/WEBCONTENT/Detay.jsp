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

    <!-- Stylesheet -->
    <link rel="stylesheet" href="vizew/style.css">
</head>
<body>
   

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
							
							     <li class="active"><a href="cikisyap.jsp">Çıkış Yap</a></li>
							   
							<%}}%>
							
							<%
							}
							
                            catch(Exception e) {
                            	System.out.println("aa");
                            	%>
                            	
                            	  <a href="uyegiris.jsp" class="login-btn"><i class="fa fa-users" aria-hidden="true"></i></a>
                            	   <a href="AdminGiris.jsp" class="login-btn"><i class="fa fa-user" aria-hidden="true"></i></a>
                            	

                    
							
							
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
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcrumb Area Start ##### -->
 
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Pager Area Start ##### -->
   



<% 
  
int idd=Integer.parseInt(request.getParameter("idfilm"));


ResultSet rs=sayiCrud.selectDatafilm(idd);
if (rs.next()){

	session.setAttribute("idfilm",idd);

	  %>
    <!-- ##### Post Details Area Start ##### -->
    <section class="post-details-area mb-80">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="post-details-thumb mb-50">
                        <img src="img/bg-img/34.jpg" alt="">
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <!-- Post Details Content Area -->
                <div class="col-12 col-lg-8 col-xl-7">
                    <div class="post-details-content">
                        <!-- Blog Content -->
                        <div class="blog-content">
                        
                          <div class="post-content mt-0">
                                <a href="#" class="post-cata cata-sm cata-danger">DETAY KISMINA HOŞGELDİNİZ..</a>
                                <a href="single-post.html" class="post-title mb-2"></a>
                                <embed src="<%=rs.getString("videoyol") %>"  style="width:700px;height:500px;">

                            </div>

                            <!-- Post Content -->
                            <div class="post-content mt-0">
                              
                                <a href="single-post.html" class="post-title mb-2">FİLM ADI: <%=rs.getString("filmadi") %></a>

                                <div class="d-flex justify-content-between mb-30">
                                    <div class="post-meta d-flex align-items-center">
                                        <a href="#" class="post-author">YÖNETMEN: <%=rs.getString("yönetmen") %></a>
                                        <i class="fa fa-circle" aria-hidden="true"></i>
                                        <a href="#" class="post-date">SÜRE: <%=rs.getString("sure") %></a>
                                    </div>
                                   
                                </div>
                            </div>
                            <p>SENARYO: <%=rs.getString("senaryo") %></p>

                            <p>YAPIM: <%=rs.getString("yapim") %></p>
                            <blockquote class="vizew-blockquote mb-15">
                                <h5 class="blockquote-text">Oyuncular</h5>
                                <h6><%=rs.getString("oyuncular") %></h6>
                            </blockquote>

									
                            <h4>Film Konu</h4>

                            <ul class="unordered-list mb-0">
                                <li><%=rs.getString("filmkonusu") %></li>
                             
                            </ul>
                            <!-- Comment Area Start -->
                            <br>
                            <br>
                            
                                <%}%>
                            

   <h4>Yorumlar</h4>

 <!-- Comment Area Start -->
  <% 
  
 
  String id=request.getParameter("idfilm");
  
  ResultSet rsy=sayiCrud.selectAllDatayorum();
  while(rsy.next()) {

	  String durum=rsy.getString("durum");
	  String gelenfilm=String.valueOf(rsy.getInt("idfilm"));
	  System.out.println(durum);
	 
	  System.out.println(id+" "+gelenfilm);
	  if(id.equals(gelenfilm))
	  {
		  System.out.println("girdim");
	  if(durum.equals("True"))
	  { 
		  
	  %>            
        
                            <div class="comment_area clearfix mb-50">
                                <!-- Section Title -->
                                <div class="section-heading style-2">
                                 
                                    <div class="line"></div>
                                </div>

                                <ul>
                                    <!-- Single Comment Area -->
                                    <li class="single_comment_area">
                                        <!-- Comment Content -->
                                        <div class="comment-content d-flex">
    
                                          

							  <!-- Comment Meta -->
                                            <div class="comment-meta">
                                                <a href="#" class="comment-date"></a>
                                                
                                                 <p><%=rsy.getString("UyeAdi") %></p>
                                              
                                                <p><%=rsy.getString("yorumicerik") %></p>
                                                  
                                              
                                            </div>
					
                                       
                                        </div>

                                       
                                    </li>

                                 
                                </ul>
                                 <%}}} %>
                            </div>
                            <!-- Post A Comment Area -->
                            <div class="post-a-comment-area">

                         
                                <!-- Reply Form -->
                                <div class="contact-form-area">
                                    <form action="yorumekle.jsp" method="post">
                                        <div class="row">

                                            <div class="col-12">
                                                <textarea class="form-control" id="yorumicerik" name="yorumicerik"  placeholder="Message*"></textarea>
                                            </div>
                                           
                                            <div class="col-12">
                                                <button class="btn vizew-btn mt-30" id="btn1" type="submit">Yorum Yap</button>
                                            </div>
                                            

                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Sidebar Widget -->
             
            </div>
        </div>
    </section>
    <!-- ##### Post Details Area End ##### -->

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



