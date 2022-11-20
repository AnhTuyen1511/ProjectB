<%-- 
    Document   : ViewBookDetail
    Created on : Nov 18, 2022, 6:16:06 PM
    Author     : BLC
--%>

<%@page import="entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Customer"%>
<%@page import="dao.GenreDAO"%>
<%@page import="dao.AuthorDAO"%>
<%@page import="entity.Author"%>
<%@page import="entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Book Store</title>
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
        <link rel="stylesheet" type="text/css" href="css/cart.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- script
        ================================================== -->
        <script src="js/modernizr.js"></script>

    </head>
    <% ArrayList<Cart> listCart = (ArrayList<Cart>) session.getAttribute("listCart"); %>
    <body style="background-color: var(--light-color);">



        <div id="header-wrap">

            <div class="top-content">
                <div class="container-fluid" style="margin:0px 46.667px">
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
                                <a href="#" class="cart for-buy"><i class="icon icon-clipboard"></i><span>Cart:(0 $)</span></a>

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
                <div class="container-fluid" style="margin:0px 46.667px">
                    <div class="row">

                        <div class="col-md-2">
                            <div class="main-logo">
                                <a href="UserActivityServlet?mode=userViewBook"><img src="images/main-logo.png" alt="logo" style="width: 300px;"></a>
                            </div>

                        </div>

                        <div class="col-md-10">

                            <nav id="navbar">
                                <div class="main-menu stellarnav">
                                    <ul class="menu-list" style="text-align: center">
                                        <li class="menu-item active"><a href="#home" data-effect="Home">Home</a></li>
                                        <li class="menu-item"><a href="About.jsp" class="nav-link" data-effect="About">About</a></li>
                                        <li class="menu-item has-sub">
                                            <a href="#pages" class="nav-link" data-effect="Pages">Pages</a>

                                            <ul>
                                                <li class="active"><a href="index.html">Home</a></li>
                                                <li><a href="About.jsp">About</a></li>
                                                <li><a href="styles.html">Styles</a></li>
                                                <li><a href="blog.html">Blog</a></li>
                                                <li><a href="single-post.html">Post Single</a></li>
                                                <li><a href="Shop.jsp">Our Store</a></li>
                                                <li><a href="single-product.html">Product Single</a></li>
                                                <li><a href="Contact.jsp">Contact</a></li>
                                                <li><a href="thank-you.html">Thank You</a></li>
                                            </ul>

                                        </li>
                                        <li class="menu-item"><a href="Shop.jsp" class="nav-link" data-effect="Shop">Shop</a></li>
                                        <li class="menu-item"><a href="#latest-blog" class="nav-link" data-effect="Articles">Articles</a></li>
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

        <section class="cartcss">
            <div class="container">
                <div class="card">
                    <div class="row">
                        <div class="col-md-8 cart" >
                            <div class="title">
                                <div class="row">
                                    <div class="col"><h4><b>Shopping Cart</b></h4></div>
                                    <div class="col align-self-center text-right text-muted"><%=listCart.size()%> items</div>
                                </div>
                            </div> 
                            <div>
                                <div class="row border-top border-bottom" >
                                    <% for (int i = 0; i < listCart.size(); i++) {%>

                                    <div class="row main align-items-center">
                                        <div class="col-2"><img class="img-fluid" src="bookImages/<%=listCart.get(i).getBookID()%>.jpg"></div>
                                        <div class="col">
                                            <div class="row text-muted"><%=listCart.get(i).getTitle()%></div>
                                            <div class="row"></div>
                                        </div>
                                        <div class="col">
                                            <a href="#">-</a><a href="#" class="border"><%=listCart.get(i).getQuantity()%></a><a href="#">+</a>
                                        </div>
                                        <div class="col"><%=listCart.get(i).getPrice()%><span class="close">&#10005;</span></div>
                                    </div>
                                    <%}%>
                                </div>
                            </div> 
                        </div>


                        <div class="col-md-4 summary">
                            <div><h5><b>Summary</b></h5></div>
                            <hr>
                            <div class="row">
                                <div class="col" style="padding-left:0;">ITEMS <%=listCart.size()%></div>
                                <div class="col text-right"> VND</div>
                            </div>
                            <form>
                                <p>SHIPPING</p>
                                <select><option class="text-muted">Standard-Delivery- VND</option></select>
                                <p>GIVE CODE</p>
                                <input id="code" placeholder="Enter your code">
                            </form>
                            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                                <div class="col">TOTAL PRICE</div>
                                <div class="col text-right">VNĐ</div>
                            </div>
                            <a href="CartServlet?mode=checkout"><button class="btn">CHECKOUT</button> </a>
                        </div>

                    </div>
                    </section>
                </div>


                <footer id="footer">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-4">

                                <div class="footer-item">
                                    <div class="company-brand">
                                        <img src="images/main-logo.png" alt="logo" class="footer-logo" style="width: 300px">
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