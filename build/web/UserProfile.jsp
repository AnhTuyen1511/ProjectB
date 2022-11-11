<%-- 
    Document   : UserProfile
    Created on : Nov 10, 2022, 2:09:00 PM
    Author     : BLC
--%>

<%@page import="entity.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

        <style type="text/css">
            * {
                margin: 0;
                padding: 0
            }

            body {
                background-image: linear-gradient(-225deg, #FFE6FA 0%, #F3F2EC 100%);
                background-image: linear-gradient(to top, #F3F2EC 0%, #F3F2EC 100%);
                background-attachment: fixed;
                background-repeat: no-repeat;
            }

            .card {
                width: 350px;
                background-image: white;
                border: none;
                cursor: pointer;
                transition: all 0.5s;
            }

            .image img {
                transition: all 0.5s
            }

            .card:hover .image img {
                transform: scale(1.5)
            }

            .btn {
                height: 140px;
                width: 140px;
                border-radius: 50%
            }


            .name {
                font-size: 22px;
                font-weight: bold
            }

            .idd {
                font-size: 14px;
                font-weight: 600
            }

            .idd1 {
                font-size: 12px
            }

            .number {
                font-size: 22px;
                font-weight: bold
            }

            .follow {
                font-size: 12px;
                font-weight: 500;
                color: #444444
            }

            .btn1 {
                height: 40px;
                width: 150px;
                border: none;
                background-color: #000;
                color: #aeaeae;
                font-size: 15px
            }
            .btn1 .logout {
                background-color: #000;
                color: #aeaeae;
                text-decoration: none;
            }
            .btn1 a {
                height: 40px;
                width: 150px;
                border: none;
            }

            .text span {
                font-size: 13px;
                color: #545454;
                font-weight: 500
            }

            .icons i {
                font-size: 19px
            }

            hr .new1 {
                border: 1px solid
            }

            .join {
                font-size: 14px;
                color: #a0a0a0;
                font-weight: bold
            }

            .date {
                background-color: #ccc
            }
        </style>

    </head>
    <body>
        <% Customer tempCustomer = (Customer) request.getAttribute("tempCustomer");  %>
        
        <div class="container mt-4 mb-4 p-3 d-flex justify-content-center"> 
            <div class="card p-4"> 
                <div class=" image d-flex flex-column justify-content-center align-items-center"> 
                    <button class="btn btn-secondary"> <img src="https://i.imgur.com/wvxPV9S.png" height="100" width="100" />
                    </button> <span class="name mt-3"></span> <span class="idd">@eleanorpena</span> 
                    <div class="d-flex flex-row justify-content-center align-items-center gap-2"> 
                        <!--<span class="idd1">Oxc4c16a645_b21a</span> <span><i class="fa fa-copy"></i></span>--> 
                    </div> 
                    <div class="d-flex flex-row justify-content-center align-items-center mt-3"> 
                        <span class="number">1069 <span class="follow">Followers</span></span> 
                    </div> 
                    <div class=" d-flex mt-2"> 
                        <a href="EditUserProfile.jsp" class="logout"><button class="btn1 btn-dark">Edit Profile</button></a>
                    </div>
                    <div class="text mt-3"> 
                        <span>
                            Eleanor Pena is a creator of minimalistic x bold graphics and digital artwork.<br>
                            <br> Artist/ Creative Director by Day #NFT minting@ with FND night. 
                        </span> 
                    </div> 
                    <div class="gap-3 mt-3 icons d-flex flex-row justify-content-center align-items-center"> 
                        <span><i class="fa fa-twitter"></i></span> 
                        <span><i class="fa fa-facebook-f"></i></span> 
                        <span><i class="fa fa-instagram"></i></span> 
                        <span><i class="fa fa-linkedin"></i></span> </div>
                    <a href="ManageUserLoginServlet?mode=userLogout" class="logout"><button class="btn1 btn-dark">Logout</button></a>
                    <div class=" px-2 rounded mt-4 date "> <span class="join">Joined May,2021</span> 
                    </div> 
                </div>
            </div>
        </div>

    </body>
</html>
