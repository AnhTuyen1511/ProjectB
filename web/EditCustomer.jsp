<%-- 
    Document   : EditCustomer
    Created on : Nov 1, 2022, 7:42:59 AM
    Author     : phuon
--%>

<head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Page - Admin HTML Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="home.jsp">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="ManageAuthorServlet?mode=viewAuthor">
                                <i class="fas fa-user-tie"></i> AUTHORS
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ManageBookServlet?mode=viewBook">
                                <i class="fas fa-book"></i> BOOKS
                            </a>
                        </li>
                        

                        <li class="nav-item">
                            <a class="nav-link" href="ManageGenreServlet?mode=viewGenre">
                                <i class="fas fa-money-bill-wave"></i> GENRE
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ManageOrderServlet?mode=viewOrder">
                                 <i class="far fa-file-alt"></i> ORDER
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="ManageCustomerServlet?mode=viewCustomer">
                                <i class="fas fa-user"></i> CUSTOMER
                            </a>
                        </li>
<!--                        <li class="nav-item">
                            <a class="nav-link" href="Billing.jsp">
                                <i class="fas fa-money-bill-wave"></i> 
                            </a>
                        </li>-->

                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href='LoginServlet?mode=logout'>
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <form action="EditCustomerServlet" method="post">
        Customer ID:
        <input name="bookID" type="text"value="" readonly=""><br>
        Username:
        <input name="title" type="text"value=" " readonly=""> <br>
        Password:
        <input name="authorID" type="text"value="" required=""><br>
        Name:
        <input name="genreID" type="text"value="" required=""><br>
        Phone Number:
        <input name="quantity" type="text"value="" required=""><br>
        Address:
        <input name="price" type="text"value="" required=""><br>
        Email:
        <input name="YOR" type="text" value="" required=""><br>
        Status:
        <input value="" type="text">
        </form>
    </body>
</html>
