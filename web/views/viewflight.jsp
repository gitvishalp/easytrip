<%-- 
    Document   : viewflight
    Created on : 20 May, 2022, 10:08:09 AM
    Author     : dell
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Flights</title>
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
                margin-bottom: 70px;
            }
             .search-table table td{
                background-color:white;
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
                border-top: 1px solid black;
                border-left: 1px solid black;
            }
            .search-table table th{
                background-color: #8a2be2;
                color: white;
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
                border-left: 1px solid black;
            }
           .search-table input[type="button"]{
                height: 40px;
                width: 100px;
                border:none;
                margin-top: 20px;
                margin-bottom: 20px;
                background-color: #8a2be2;
                color: white;
             }
             .search-table input[type="button"]:hover{
             background-color: #ff8c00;
             color: black;
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
                        <div class="user-detail me-2">
                            <center> Welcome:<i class="bi bi-person-fill"></i></center>
                            <div class="span" style="color:green;">
                                <b> <%

                                    if (session.getAttribute("unm") == null) {
                                        response.sendRedirect("login.jsp");
                                    } else {
                                        out.println(session.getAttribute("unm").toString());
                                    }
                                    %></b>
                            </div>
                        </div>
                                    
                        <%---Logout----------%>
                        <div class="user-detail me-2">
                            <script>
                                function showalert()
                                {
                                    alert("You are Logged Out Successfully!!")
                                }
                            </script>
                            <form action="logout.jsp">
                                <button class="btn btn-warning" onclick="showalert()"><center><i class="bi bi-box-arrow-right"></i></center>Logout</button>   
                            </form>
                        </div>
                    </div>
                </div>
            </nav></div>
       

        <%--Booking Card--%>

        <div class="booking" style="margin-top: 100px;">
            <table>
                <tr>
                <td><center><a href="searchflight.jsp" style="text-decoration: none; color: black;"><img src="flight.png" height="30" width="50"><br>Flight</a></center></td>
                <td><center><a href="searchtrain.jsp" style="text-decoration: none; color: black;"><img src="train.png" height="30" width="50"><br>Train</a></center></td>
                <td><center><a href="searchhotel.jsp" style="text-decoration: none; color: black;"><img src="hotel.png" height="30" width="50"><br>Hotel</a></center></td>
                <td><center><a href="searchpackage.jsp" style="text-decoration: none; color: black;"><img src="package.png" height="30" width="30"><br>Package</a></center></td>
                </tr>
            </table>
        </div>
        <hr height="100">
            
            <%--Searching Code ---%>
            
            <div class="search-table">
                <%@page import="model.*,java.sql.*"%>
                <% 
                   if(request.getParameter("txtsource")!=null)
                   {
                       try{
                           flight f=new flight();
                           
                           f.setSource(request.getParameter("txtsource"));
                           f.setDestination(request.getParameter("txtdestination"));
                           
                           ResultSet r= f.SearchFlight();
                           %>
                          
                           <table>
                                <tr><td colspan="8"><center><h5 style="color: green;">Your Search Result</h5></center></td></tr>
                               <tr>
                                   <th><h6>Flight No </h6></th>
                                   <th><h6>Flight Name</h6></th>
                                   <th><h6>Departure Time</h6></th>
                                   <th><h6>Arrival Time</h6></th>
                                   <th><h6>Source</h6></th>
                                   <th><h6>Destination</h6></th>
                                   <th><h6>Fare</h6></th>
                                   <th><h6>Book</h6></th>
                               </tr>
                               
                           <%
                           while(r.next())
                           {
                               %>
                              
                               <tr>
                                   <td><h6><% out.println(r.getString("flightno"));%></h6></td>
                                   <td><h6><% out.println(r.getString("flightnm"));%></h6></td>
                                   <td><h6><% out.println(r.getString("deptime")); %></h6></td>
                                   <td><h6><% out.println(r.getString("arrtime"));%></h6></td>
                                   <td><h6><% out.println(r.getString("source"));%></h6></td>
                                   <td><h6><% out.println(r.getString("destination"));%></h6></td>
                                   <td><h6>Rs.<% out.println(r.getString("fare")); %></h6></td>
                                   <td> <input type="button" value="Book Now" onclick="window.location.href='bookflight.jsp?fno=<%=r.getString("flightno")%>'"></td>
                               </tr>
                               <%
                           }
                       }catch(Exception ex){
                           out.println(ex);
                       }
                   }
                %>
                           </table></div><br><br><br>



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



