<%-- 
    Document   : searchcode
    Created on : 18 May, 2022, 11:26:50 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Packages</title>
        <meta name="viewport" content="width=device-width, iniial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">
        <style>
            .search-table table{
                margin-top:20px; 
                border: 2px solid black; 
                margin-left: auto;
                margin-right: auto;
            }
             .search-table table td{
                background-color:white;
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
                border-left: 1px solid black;
            }
            .search-table table th{
                background-color: #8a2be2;
                color: white;
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
                border-top: 1px solid black;
                border-left: 1px solid black;
            }
        </style>
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
                                <a class="nav-link active" style="border-bottom: 2px solid #ff8c00;" aria-current="page" href="home.jsp"><center><i class="bi bi-house-door-fill"></i><br></center>Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="mytrips.jsp"><center><i class="bi bi-briefcase-fill"></i><br></center>My Trips</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="offers.jsp"><center><i class="bi bi-tags-fill"></i><br></center>Offers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="aboutus.jsp"><center><i class="bi bi-info-circle-fill"></i><br></center>About us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="contactus.jsp"><center><i class="bi bi-telephone-fill"></i><br></center>Contact us</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav></div>
    

        <hr height="100">

        <%----Content------%>
        <div class="container" style="margin-top:150px;">
          
        <%--Searching Code ---%>
        <div class="search-table">
            <%@page import="model.*,java.sql.*"%>
            <%
                if (request.getParameter("destination") != null) {
                    try {
                        holidaypackage p= new holidaypackage();

                        p.setDestination(request.getParameter("destination"));
                        ResultSet r = p.SearchPackage();
            %>
            <table>
                <tr><td colspan="11"><center><h5 style="color: green;">Your Search Result</h5></center></td></tr> 
            <tr>
                    <th><h6>Package ID </h6></th>
                    <th><h6>Package Name </h6></th>
                    <th><h6>Description </h6></th>
                    <th><h6>Source </h6></th>
                    <th><h6>Destination </h6></th>
                    <th><h6>Duration </h6></th>
                    <th><h6>Package Includes</h6></th>
                    <th><h6>Price</h6></th>
                    <th><h6>Image</h6></th>
                </tr>
                <%
                    while (r.next()) {
                %>
                <tr style="background-color:white">
                    <td><h6><% out.println(r.getString("packageid"));%></h6></td>
                    <td><h6><% out.println(r.getString("packname"));%></h6></td>
                    <td><h6><% out.println(r.getString("description"));%></h6></td>
                    <td><h6><% out.println(r.getString("source"));%></h6></td>
                    <td><h6><% out.println(r.getString("destination"));%></h6></td>
                    <td><h6><% out.println(r.getString("duration"));%></h6></td>
                    <td><h6><% out.println(r.getString("packinc"));%></h6></td>
                    <td><h6><% out.println(r.getString("price"));%></h6></td>
                     <td><% out.println("<img width='100' height='100' src=../DisplayPackPhoto?id=" + r.getInt("packageid") + "></img></p>");%></td>
                </tr>

                <%
                            }
                        } catch (Exception ex) {
                            out.println("No Result Found");
                        }
                    }
                %>
            </table></div><br><br><br><br>

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

