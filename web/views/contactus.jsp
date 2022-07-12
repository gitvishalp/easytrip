<%-- 
    Document   : contactus
    Created on : 19 Feb, 2022, 7:49:20 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <meta name="viewport" content="width=device-width, iniial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">
        
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>      

        <%-- Navigation bar---%>
<div class="fixed-top">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="navlogo.png" alt="Easy Trip" width="100" height="40" class="d-inline-block align-text-top"> 
                    Easy<font color="#ff8c00">Trip</font></a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp"><center><i class="bi bi-house-door-fill"></i><br></center>Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="mytrips.jsp"><center><i class="bi bi-briefcase-fill"></i><br></center>My Trips</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="offers.jsp"><center><i class="bi bi-tags-fill"></i><br></center>Offers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="aboutus.jsp"><center><i class="bi bi-info-circle-fill"></i><br></center>About us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" style="border-bottom: 2px solid #ff8c00 ;" aria-current="page" href="contactus.jsp"><center><i class="bi bi-telephone-fill"></i><br></center>Contact us</a>
                            </li>
                        </ul>
                    <div class="btn-group me-2">
                        <a class="btn btn-warning" href="login.jsp" role="button">Login</a>
                    </div>
                    <div class="btn-group me-2">
                        <a class="btn btn-success" href="CustomerRegistration.jsp" role="button">Signup</a>
                    </div>
                </div>
            </div>
        </nav></div>


        <%----Login Form------%>

        <div class="container px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
    <div class="card card0 border-0">
        <div class="row d-flex">
            <div class="col-lg-6">
                <div class="card1 pb-5">
                    <div class="row"> <img src="logo.png" class="logo"> </div>
                    <div class="row px-3 justify-content-center mt-4 mb-5 border-line"> <img src="contactus.png" class="image">
                        <table>
                            <tr>
                                <td><i class="bi bi-geo-alt-fill"></i></td><td>Laxmi Nagar, New Delhi</td>
                            </tr>
                            <tr>
                                <td><i class="bi bi-telephone-fill"></i></td><td>+91 8090902094</td>
                            </tr>
                            <tr>
                                <td><i class="bi bi-envelope-fill"></i></td><td>vpknj643@gmail.com</td>
                            </tr>
                            <tr>
                                <td colspan="2"><b>Follow us On:</b>
                                    &nbsp; &nbsp;&nbsp;&nbsp; <font color="#8a2be2"><i class="bi bi-facebook"></i> &nbsp;&nbsp;&nbsp;<i class="bi bi-twitter"></i> &nbsp;&nbsp;&nbsp;<i class="bi bi-instagram"></i></font></td>
                            </tr>
                            
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card2 card border-0 px-4 py-5">
                   
                    <div class="row px-3 mb-4">
                        <center><span><font size="7px" color="green">Contact Us</font></span></center>
                        <hr>
                    </div>
                    <form action="../contactserv">
                    <div class="row px-3"> 
                        <label class="mb-1"><h6 class="mb-0">From</h6></label>
                         <input class="mb-4" type="text" name="txtemail" placeholder="Email Address">
                    </div>
                    <div class="row px-3">
                    <label class="mb-1"><h6 class="mb-0">Subject</h6></label>
                         <input type="text" name="txtsubject" placeholder="Subject"> 
                    </div>
                        <div class="row px-3"> 
                        <label class="mb-1 mt-2"><h6 class="mb-0">Query</h6></label>
                        <textarea rows="4" cols="50" name="txtmsg" placeholder="Your Query"></textarea>
                    </div>
                    <div class="row mb-3 mt-4 px-3"> <button type="submit" class="btn btn-blue text-center">Send</button> </div>
                    </form>
                </div>
            </div>
        </div>
       
    </div>
</div>



        <%----Footer---%>

       <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6>About</h6>
                        <p class="text-justify">At <i><b>EasyTrip</b></i> you can find the best of deals and cheap air, train, and hotel tickets to any place you want by booking your tickets on our website. Our website for hotel, flight, train and holiday bookings, <i><b>EasyTrip</b></i> helps you book flight tickets that are affordable and customized to your convenience. With customer satisfaction being our ultimate goal, we also have a 24/7 dedicated help line to cater to our customer’s queries and concerns.</p>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Services</h6>
                        <ul class="footer-links">
                            <li><a href="home.jsp">Holiday Packages</a></li>
                            <li><a href="searchtrain.jsp">Train Booking</a></li>
                            <li><a href="searchflight.jsp">Flight Booking</a></li>
                            <li><a href="searchhotel.jsp">Hotel Booking</a></li>
                            <li><a href="offers.jsp">Offers</a></li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Quick Links</h6>
                        <ul class="footer-links">
                            <li><a href="aboutus.jsp">About Us</a></li>
                            <li><a href="contactus.jsp">Contact Us</a></li>
                            <li><a href="faq.jsp">FAQ</a></li>
                            <li><a href="feedback.jsp">Feedback</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-6 col-xs-12">
                        <p class="copyright-text">Copyright &copy; 2022 All Rights Reserved by 
                            <a href="#">Easy Trip</a>.
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <ul class="social-icons">
                            <li><a class="facebook" href="#"><i class="bi bi-facebook"></i></a></li>
                            <li><a class="instagram" href="#"><i class="bi bi-instagram"></i></a></li>
                            <li><a class="linkedin" href="#"><i class="bi bi-linkedin"></i></a></li>
                            <li><a class="twitter" href="#"><i class="bi bi-twitter"></i></a></li>   
                        </ul>
                    </div>
                </div>
            </div>
        </footer>                
    </body>
</html>



