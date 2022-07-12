<%-- 
    Document   : aboutus
    Created on : 18 Feb, 2022, 3:26:48 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
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
                                <a class="nav-link active" style="border-bottom: 2px solid #ff8c00 ;" aria-current="page" href="aboutus.jsp"><center><i class="bi bi-info-circle-fill"></i><br></center>About us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="contactus.jsp"><center><i class="bi bi-telephone-fill"></i><br></center>Contact us</a>
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

        <hr height="100">

        <%----Content------%>
        <div class="container" style="margin-top: 100px">

            <h2><b>About Easy Trip</b></h2><hr>
            <p class="about"><b><i>Easy Trip</i></b> is Online travel booking brand providing range of choices for hotels, flights, trains and 
             attractive package offers for travelers. Our core value differentiator is the most trusted user experience, be in term of quickest search and booking,
             fastest payments, settlement or refund processes. Through EasyTrip, our customers enjoy standardised stay experience at certified hotel.
             On EasyTrip, you can tailor your trip from end-to-end by scouring suitable flights and making your flight booking before proceeding with your hotel bookings. 
             EasyTrip’s vast hotel repository will see you through this process seamlessly. Any intervening journey can be conveniently planned by searching up relevant train 
             connectivity and making an IRCTC ticket booking. Look up well-researched holiday packages, sift through cruise packages and finalise your entire trip on just one platform.
             EasyTrip is based in Delhi, India and one of India's leading online travel companies and operates the website. The company provides information, pricing, availability, and booking facility for domestic and international air travel.
            </p>
            <h4><b>Our Vision</b></h4>
            <p class="about">At EasyTrip, our vision is to make travel simple and fun for all, and our core values guide us in making this possible. These core values can be seen in the projects that we undertake, and the way in which we solve problems
                for our customers. They are a representation of Our Being & Our Doing. Each member of the EasyTrip family is guided by them each and every day..</p>
            
                      <h4><b>Our Products & Services</b></h4>
            <p class="about">We offer a comprehensive range of travel-related products and services catering to the needs of passengers traveling domestically, as well as traveling to and from international destinations. We provide the customers with various
                tools and information that they need to research, plan, book and purchase travel products and services in India as well as outside India.</p>
           
            <div class="serv" style="margin-bottom: 30px;">
                
                <center> <h2><b>Our Services</b></h2> <table>
                <tr>
                    <td><center><span style="text-decoration: none; color: black;"><img src="flight.png" height="30" width="50"><br>Airline Booking</span></center></td>
                <td><center><span style="text-decoration: none; color: black;"><img src="train.png" height="30" width="50"><br>Train Booking</span></center></td>
                <td><center><span style="text-decoration: none; color: black;"><img src="hotel.png" height="30" width="50"><br>Hotel Booking</span></center></td>
                <td><center><span style="text-decoration: none; color: black;"><img src="package.png" height="30" width="30"><br> Holiday Packages</span></center></td>
                 <td><center><span style="text-decoration: none; color: black;"><img src="service.png" height="30" width="30"><br>24X7 Customer Service</span></center></td>
                </tr>
                    </table></center>
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



