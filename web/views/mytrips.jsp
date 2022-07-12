<%-- 
    Document   : mytrips
    Created on : 26 May, 2022, 7:06:19 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Trips</title>
        <meta name="viewport" content="width=device-width, iniial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">
        <style>
            .mytrips{
                display: flex; 
                 margin-left: 190px;
                 margin-right: 190px;
                 background-image: linear-gradient(to bottom right, #ffffcc, #99ffcc);
                 margin-bottom: 20px;
                 border-radius: 20px;
                   box-shadow: -15px -15px 15px rgba(255,255,255,0.2),
                  15px 15px 15px rgba(0,0,0,0.1),
                  inset -5px -5px 5px rgba(255,255,255,0.2),
                   inset 5px 5px 5px rgba(0,0,0,0.1);
            }
              .mytrips table{
                margin-top:10px;  
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 10px;
                font-size: 15px;
                border-radius: 20px;
            }
             .mytrips table td{
                text-align: center;
                width: 140px;
                padding-left: 10px;
                padding-right: 10px;
                font-size: 15px;
                border-top: 1px solid black;
               
            }
            .mytrips table th{
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
                color:green;
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
                                <a class="nav-link active" aria-current="page" href="home.jsp"><center><i class="bi bi-house-door-fill"></i><br></center>Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" style="border-bottom: 2px solid #ff8c00;" aria-current="page" href="mytrips.jsp"><center><i class="bi bi-briefcase-fill"></i><br></center>My Trips</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="offers.jsp"><center><i class="bi bi-tags-fill"></i><br></center>Offers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="aboutus.jsp"><center><i class="bi bi-info-circle-fill"></i><br></center>About us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="contactus.jsp"><center><i class="bi bi-telephone-fill"></i><br></center>Contact us</a>
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

      
        <hr height="100">

        <%----Content------%>
        <%@page import="java.io.*,java.util.*,java.sql.*,model.*"%>
        <div class="mytrips" style="margin-top:100px;">
            
            <%! int custid; %>

            <%
                  custid= Integer.parseInt(session.getAttribute("cid").toString());
                  
                 try{
                      flightbooking fp= new flightbooking();
                      fp.setCustid(custid);
                      ResultSet r= fp.custfBooking();
                      %>
                      <table>
                          <tr>
                              <th colspan="7" style="background-color:#00cc33; color:black"><h3>Flight Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Booking ID</th>
                              <th>Flight Number</th>
                              <th>Flight Name</th>
                              <th>Journey Date</th>
                              <th>Source</th>
                              <th>Destination</th>
                              <th>Persons</th>
                          </tr>
                      <%
                      while(r.next()){
                      %>    
                      <tr>
                      <td> <% out.println(r.getString("bookingid"));%></td>
                      <td> <% out.println(r.getString("flightno"));%></td>
                      <td> <% out.println(r.getString("flightnm"));%></td>
                      <td> <% out.println(r.getString("jrdate")); %></td>
                      <td> <% out.println(r.getString("source")); %></td>
                      <td> <% out.println(r.getString("destination")); %></td>
                      <td> <% out.println(r.getString("person")); %></td>
                      <%
                      }
                    %>
                     </tr> 
                      </table>
        </div>
                     <div class="mytrips" style="background-image: linear-gradient(to bottom right, #ffffcc, #ff9999);">
                    <%
                        trainbooking tb = new trainbooking();
                        tb.setCustid(custid);
                        ResultSet r2= tb.custtBooking();
                        %>
                        <table>
                          <tr>
                              <th colspan="7" style="background-color:#ff6666; color:black"><h3>Train Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Booking ID</th>
                              <th>Train Number</th>
                              <th>Train Name</th>
                              <th>Journey Date</th>
                              <th>Source</th>
                              <th>Destination</th>
                              <th>Person</th>
                          </tr>
                        <%
                        while(r2.next()){
                         %>
                         <tr>
                      <td> <% out.println(r2.getString("tbookingid"));%></td>
                      <td> <% out.println(r2.getString("trainno"));%></td>
                      <td> <% out.println(r2.getString("trainnm"));%></td>
                      <td> <% out.println(r2.getString("jrdate")); %></td>
                      <td> <% out.println(r2.getString("source")); %></td>
                      <td> <% out.println(r2.getString("destination")); %></td>
                       <td> <% out.println(r2.getString("person")); %></td>
                         <% } %>
                           </tr> 
                      </table> 
                       </div>
                           <div class="mytrips" style="background-image: linear-gradient(to bottom right, #ffffcc, #66ffff );">
                         <%
                             hotelbooking hb = new hotelbooking();
                             hb.setCustid(custid);
                             ResultSet r3= hb.custHBooking();
                             %>
                             <table>
                          <tr>
                              <th colspan="7" style="background-color:#00cccc; color:black"><h3>Hotel Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Booking ID</th>
                              <th>Hotel Number</th>
                              <th>Hotel Name</th>
                              <th>Hotel Address</th>
                              <th>Check in Date</th>
                              <th>Check out Date</th>
                              <th>Rooms Booked</th>
                          </tr>
                             <%
                                 while(r3.next()){
                               %>
                               <tr>
                      <td> <% out.println(r3.getString("hbookingid"));%></td>
                      <td> <% out.println(r3.getString("hotelid"));%></td>
                      <td> <% out.println(r3.getString("hotelnm"));%></td>
                      <td> <% out.println(r3.getString("hoteladdr"));%></td>
                      <td> <% out.println(r3.getString("checkin")); %></td>
                      <td> <% out.println(r3.getString("checkout")); %></td>
                      <td> <% out.println(r3.getString("rooms")); %></td>  
                         <%   
                        }
                     %>
                      </tr> 
                      </table>
                              </div>
                      <div class="mytrips" style="background-image: linear-gradient(to bottom right, #ffffcc, #ffff66);">
                      <%
                             packagebooking pb = new packagebooking();
                             pb.setCustid(custid);
                             ResultSet r4= pb.custPBooking();
                             %>
                             <table>
                          <tr>
                              <th colspan="7" style="background-color:gold; color:black"><h3>Package Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Booking ID</th>
                              <th>Package ID</th>
                              <th>Package Name</th>
                              <th>Duration</th>
                              <th>Destination</th>
                              <th>Departure Date</th>
                              <th>Persons</th>
                          </tr>
                             <%
                                 while(r4.next()){
                               %>
                               <tr>
                      <td> <% out.println(r4.getString("pbookingid"));%></td>
                      <td> <% out.println(r4.getString("packageid"));%></td>
                      <td> <% out.println(r4.getString("packname"));%></td>
                      <td> <% out.println(r4.getString("duration")); %></td>
                      <td> <% out.println(r4.getString("destination")); %></td>
                      <td> <% out.println(r4.getString("departdate")); %></td>
                      <td> <% out.println(r4.getString("person")); %></td>  
                         <%   
                        }
                     %>
                      </tr> 
                             </table></div>
                     <%
                         
                 }catch(Exception ex){
                     out.println(ex);
                 }
                %>
        </div>







        <br><br><br><br>
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
