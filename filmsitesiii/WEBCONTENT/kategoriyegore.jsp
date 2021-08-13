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
                                <p>Hoşgeldiniz:</p>
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


<div>
    <div align="center"><img src="resimler/s-0db3d9eb61251a70ee16c4f987b51893e6b40170.jpg" align="top"></div>

</div>
<div style="margin-left:800px">
    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#Modal1" ;> TÜRE GÖRE ARAMA </button>

</div>
<div>
</div>

<body>
<form class="form-inline" method="post" action="kategoriyegore_islem.jsp">
    <div class="modal" id="Modal1" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                   
                    <div>
                        <label> FİLM KATEGORİSİ:</label>
                        <br />
                        <form class="form-group" method="post">
                            <div style="margin-left:15px">
                             

                            </div>
                            <div style="margin-left:15px">
                             
                            </div>
						
						<select id="idTur" >
						         	    
						   	<% 
						
							ResultSet rs=sayiCrud.selectAllData();
						  	while(rs.next()) 
						  	{ %> 
						  	
						  <option  value="<%=rs.getString("Turadi")%>"  ><%=rs.getString("Turadi")%></option>
						  	<% } %></select>
						  	      <input type="hidden" class="form-control" id="tb" name="tb"  />
						<button type="submit" name="save" class="btn btn-danger">ARA</button>
						
						</form>
                            <br />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">
                <!-- Footer Widget Area -->
             

                <!-- Footer Widget Area -->
        

                <!-- Footer Widget Area -->
              

                <!-- Footer Widget Area -->
          
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
    
           <script>
$(function(){
$("#idTur").change(function() {
var deger = $(this).val();
$("#tb").val(deger);
});
})

</script>
</body>

</html>
