<%-- 
    Document   : About
    Created on : Nov 20, 2022, 3:34:10 AM
    Author     : BLC
--%>

<%@page import="entity.Genre"%>
<%@page import="entity.Author"%>
<%@page import="dao.AuthorDAO"%>
<%@page import="dao.GenreDAO"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>About</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">

        <link rel="stylesheet" type="text/css" href="css/normalize.css">
        <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
        <link rel="stylesheet" type="text/css" href="css/vendor.css">
        <link rel="stylesheet" type="text/css" href="style.css">

        <!-- script
        ================================================== -->
        <script src="js/modernizr.js"></script>

    </head>
    <%
        int cartCount = 0;
        ArrayList<Cart> listCart = (ArrayList<Cart>) session.getAttribute("listCart");
        if (listCart != null) {
            cartCount = listCart.size();
        }

        AuthorDAO myAuthorDAO = new AuthorDAO();
        ArrayList<Author> list = myAuthorDAO.getListAuthor();
        ArrayList<Author> listAuthor = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getAuthor_status() == 1) {
                listAuthor.add(list.get(i));
            }
        }
        GenreDAO myGenreDAO = new GenreDAO();
        ArrayList<Genre> list_genre = myGenreDAO.getListGenre();
        ArrayList<Genre> listGenre = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list_genre.get(i).getGenre_status() == 1) {
                listGenre.add(list_genre.get(i));
            }
        }


    %>
    <body>

        <div id="header-wrap">
            <div class="top-content" style="padding: 10px 0 0 0">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="social-links">
                                <ul>
                                    <li>
                                        <a href="#"><i class="icon icon-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon icon-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon icon-youtube-play"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon icon-behance-square"></i></a>
                                    </li>
                                </ul>
                            </div><!--social-links-->
                        </div>
                        <div class="col-md-6">
                            <div class="right-element">
                                <% Customer customer;
                                    String txtAccount = "Login";
                                    String link = "UserLogin.jsp";
                                    String ss = (String) session.getAttribute("UserLogin");

                                    if (ss != null) {
                                        customer = (Customer) session.getAttribute("tempCustomer");
                                        txtAccount = ss;
                                        link = "ManageUserLoginServlet?mode=viewProfile&customerID=";
                                        link += customer.getCustomer_id();
                                    }%>
                                <a href=<%=link%> class="user-account for-buy" ><i class="icon icon-user"></i><span> <%=txtAccount%></span></a>

                                <a href="Cart.jsp" class="cart for-buy"><i class="icon icon-clipboard"></i><span>Cart(<%=cartCount%>)</span></a>

                                <div class="action-menu">

                                    <div class="search-bar">
                                        <a href="#" class="search-button search-toggle" data-selector="#header-wrap">
                                            <i class="icon icon-search"></i>
                                        </a>
                                        <form role="search" method="get" class="search-box">
                                            <input class="search-field text search-input" placeholder="Search" type="search">
                                        </form>
                                    </div>
                                </div>

                            </div><!--top-right-->
                        </div>

                    </div>
                </div>
            </div><!--top-content-->

            <header id="header">
                <div class="container">
                    <div class="row">

                        <div class="col-md-2">
                            <div class="main-logo">
                                <a href="UserActivityServlet?mode=userViewBook"><img src="images/main-logo.png" alt="logo"></a>
                            </div>
                        </div>

                        <div class="col-md-10">
                            <nav id="navbar">
                                <div class="main-menu stellarnav">
                                    <ul class="menu-list">
                                        <li class="menu-item active"><a href="UserActivityServlet?mode=userViewBook" data-effect="Home">Home</a></li>

                                        <li class="menu-item has-sub">
                                            <a href="Genre.jsp" class="nav-link" data-effect="Pages">Genre</a>

                                            <ul>
                                                <%for (int i = 0; i < listGenre.size(); i++) {
                                                %>
                                                <li><a href="index.html"><%=listGenre.get(i).getGenre()%></a></li>

                                                <% } %>
                                            </ul>

                                        </li>


                                        <li class="menu-item has-sub">
                                            <a href="Author.jsp" class="nav-link" data-effect="Pages">Authors</a>

                                            <ul>
                                                <%for (int i = 0; i < listAuthor.size(); i++) {
                                                %>
                                                <li><a href="index.html"><%=listAuthor.get(i).getAuthor_name()%></a></li>

                                                <% }%>
                                            </ul>

                                        </li>
                                        <li class="menu-item"><a href="Shop.jsp" class="nav-link" data-effect="Shop">Shop</a></li>
                                        <li class="menu-item"><a href="Contact.jsp" class="nav-link" data-effect="Contact">Contact</a></li>
                                    </ul>
                                    <div class="hamburger">
                                        <span class="bar"></span>
                                        <span class="bar"></span>
                                        <span class="bar"></span>
                                    </div>

                                </div>
                            </nav>

                        </div>

                    </div>
                </div>
            </header>

        </div><!--header-wrap-->
        <div class="site-banner">
            <div class="banner-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">			
                            <div class="colored">
                                <h1 class="page-title">About Us</h1>
                                <div class="breadcum-items">
                                    <span class="item"><a href="index.html">Home /</a></span>
                                    <span class="item colored">About Us</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--site-banner-->

        <section class="chief-detail padding-large">
            <div class="container">
                <div class="row">
                    <div class="single-image col-md-12">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus leo vel orci malesuada, id sodales em volutpat. Vivamus sagittis pulvinar dignissim. Mauris tempus a lacus eu aliquet. Mauris gravida at ectus quis venenatis. Aenean quis feugiat turpis. Etiam lacinia interdum nibh, non convallis magna lementum vel. Phasellus varius quam ligula, in lobortis risus porttitor ut. Praesent ipsum elit, lobortis n tincidunt a, dapibus et lorem. Praesent eget dui a est fringilla rutrum sit amet in eros. Vestibulum ut ros sed enim feugiat lobortis. Suspendisse fermentum nunc in est mattis molestie. Mauris ut placerat isus. Aenean mollis neque libero, ut pellentesque arcu dapibus vel.</p>
                        <p>Praesent nec nisl euismod, lacinia tellus eget, bibendum ex. Maecenas imperdiet gravida pulvinar. aecenas feugiat id tellus sed sodales. Praesent maximus ultricies elit eget accumsan. Proin tortor ante, ltrices a aliquet a, facilisis quis sapien. Donec eu turpis at velit scelerisque faucibus id eget dolor. tiam lobortis ante ipsum, sed venenatis ligula facilisis quis. Fusce blandit commodo mauris, sed fringilla isi congue et. Nunc eu eros ex.</p>

                    </div>
                </div>
            </div>
        </section>

        <section class="our-team bg-sand padding-large">
            <div class="container">
                <div class="row">

                    <div class="col-md-12">
                        <h2 class="section-title text-center mb-4">Our Team</h2>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-3">

                        <div class="team-member text-center">

                            <figure>
                                <a href="#"><img src="images/team-member2.jpg" alt="post" class="member-image"></a>
                            </figure>

                            <div class="member-details text-center">
                                <h4>Mrs. Nocole Sara</h4>
                                <div class="designation colored">CEO-Founder</div>
                                <div class="social-links color-primary ">
                                    <a href="#" class="icon icon-facebook pr-10"></a>
                                    <a href="#" class="icon icon-twitter pr-10"></a>
                                    <a href="#" class="icon icon-pinterest-p"></a>
                                </div>
                            </div>

                        </div>

                    </div><!--col-md-3-->

                    <div class="col-md-3 text-center">

                        <div class="team-member text-center">
                            <figure>
                                <img src="images/team-member5.jpg" alt="post" class="member-image">
                            </figure>
                            <div class="member-details text-center">
                                <h4>Ms Sienna Jolie</h4>
                                <div class="designation colored">General Manager</div>
                                <div class="social-links color-primary">
                                    <a href="#" class="icon icon-facebook pr-10"></a>
                                    <a href="#" class="icon icon-twitter pr-10"></a>
                                    <a href="#" class="icon icon-pinterest-p"></a>
                                </div>
                            </div><!--text-content-->
                        </div>

                    </div><!--col-md-3-->

                    <div class="col-md-3 text-center">

                        <div class="team-member text-center">
                            <figure>
                                <img src="images/team-member7.jpg" alt="post" class="member-image">
                            </figure>
                            <div class="member-details text-center">
                                <h4>Ms Jenny Blacksmith</h4>
                                <div class="designation colored">Assistant Manager</div>
                                <div class="social-links color-primary">
                                    <a href="#" class="icon icon-facebook pr-10"></a>
                                    <a href="#" class="icon icon-twitter pr-10"></a>
                                    <a href="#" class="icon icon-pinterest-p"></a>
                                </div>
                            </div><!--text-content-->
                        </div>

                    </div><!--col-md-3-->

                    <div class="col-md-3 text-center">

                        <div class="team-member text-center">
                            <figure>
                                <img src="images/team-member3.jpg" alt="post" class="member-image">
                            </figure>
                            <div class="member-details text-center">
                                <h4>Mrs Lora Inn</h4>
                                <div class="designation colored">Staff</div>
                                <div class="social-links color-primary">
                                    <a href="#" class="icon icon-facebook pr-10"></a>
                                    <a href="#" class="icon icon-twitter pr-10"></a>
                                    <a href="#" class="icon icon-pinterest-p"></a>
                                </div>
                            </div><!--text-content-->
                        </div>

                    </div><!--col-md-3-->

                </div>
            </div>
        </section>

        <section class="padding-large">
            <div class="container">
                <h2 class="section-title text-center mt-5">Our Mission</h2>
                <div class="row">
                    <div class="col-md-12">
                        <img src="images/post-img3.jpg" alt="book-authors" class="align-right">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste.
                        </p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste.
                        </p>

                    </div>

                </div>
            </div>
        </section>

        <footer id="footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4">

                        <div class="footer-item">
                            <div class="company-brand">
                                <img src="images/main-logo.png" alt="logo" class="footer-logo">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis sed ptibus liberolectus nonet psryroin. Amet sed lorem posuere sit iaculis amet, ac urna. Adipiscing fames semper erat ac in suspendisse iaculis.</p>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>About Us</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <a href="#">vision</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">articles </a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">careers</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">service terms</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">donate</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>Discover</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <a href="#">Home</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Books</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Authors</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Subjects</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Advanced Search</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>My account</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <a href="#">Sign In</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">View Cart</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">My Wishtlist</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Track My Order</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-2">

                        <div class="footer-menu">
                            <h5>Help</h5>
                            <ul class="menu-list">
                                <li class="menu-item">
                                    <a href="#">Help center</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Report a problem</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Suggesting edits</a>
                                </li>
                                <li class="menu-item">
                                    <a href="#">Contact us</a>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>
                <!-- / row -->

            </div>
        </footer>

        <div id="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="copyright">
                            <div class="row">

                                <div class="col-md-6">

                                </div>

                                <div class="col-md-6">
                                    <div class="social-links align-right">
                                        <ul>
                                            <li>
                                                <a href="#"><i class="icon icon-facebook"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="icon icon-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="icon icon-youtube-play"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="icon icon-behance-square"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div><!--grid-->

                    </div><!--footer-bottom-content-->
                </div>
            </div>
        </div>

        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/script.js"></script>

    </body>
</html>	
