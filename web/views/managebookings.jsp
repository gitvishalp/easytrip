<%-- 
    Document   : managebookings
    Created on : 27 May, 2022, 3:08:26 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin- Manage Bookings</title>
        <meta name="viewport" content="width=device-width, iniial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">
              <style>
            .search-table table{
                margin-top:20px; 
                border: 2px solid black; 
                margin-left: auto;
                width: 180px;
                margin-right: auto;
                margin-bottom: 30px;
            }
             .search-table table td{
                background-color:white;
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
                border-top: 1px solid black;
                border-left: 1px solid black;
                font-size: 15px;
            }
            .search-table table th{
                background-color: #8a2be2;
                color: white;
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
                border-left: 1px solid black;
                font-size: 15px;
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



        <%-- Navigation bar---%>
        <div class="fixed-top">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="navlogo.png" alt="Easy Trip" width="100" height="40" class="d-inline-block align-text-top"> 
                        Easy<font color="#ff8c00">Trip</font></a>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <font color="GREEN">Administration</font>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="adminhome.jsp"><center><i class="bi bi-house-door-fill"></i><br></center>Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link active dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <center><i class="bi bi-kanban-fill"></i><br></center>Management
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="manageflights.jsp">Manage Flights</a>
                                    <a class="dropdown-item" href="managetrains.jsp">Manage Trains</a>
                                    <a class="dropdown-item" href="managehotels.jsp">Manage Hotels</a>
                                    <a class="dropdown-item" href="managepackages.jsp">Manage Packages</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="managecustomers.jsp">Manage Customers</a>
                                    <a class="dropdown-item" href="managebookings.jsp">Manage Bookings</a>
                                </div>
                            </li>
                        </ul>
                        <div class="user-detail me-2">
                            <center> Welcome:<i class="bi bi-person-fill"></i></center>
                            <div class="span" style="color:green;">
                                <b> <%

                                    if (session.getAttribute("adm") == null) {
                                        response.sendRedirect("adminlogin.jsp");
                                    } else {
                                        out.println(session.getAttribute("adm").toString());
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


        <%---Content---%>
       <div class="container" style="margin-top:100px; margin-bottom: 30px;">
           <div class="search-table">
           
           <%@page import="model.*,java.sql.*,java.util.*" %>
           <%
                 try{
                      flightbooking fp= new flightbooking();
                      ResultSet r= fp.AllFlightBookings();
                      %>
                      <table>
                          <tr>
                              <th colspan="9" style="background-color:#00cc33; color:black"><h3>Flight Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Customer ID</th>
                              <th>Booking ID</th>
                              <th>Flight Number</th>
                              <th>Flight Name</th>
                              <th>Journey Date</th>
                              <th>Source</th>
                              <th>Destination</th>
                              <th>Persons</th>
                              <th>Edit</th>
                          </tr>
                      <%
                      while(r.next()){
                      %>    
                      <tr>
                      <td> <% out.println(r.getString("custid"));%></td>
                      <td> <% out.println(r.getString("bookingid"));%></td>
                      <td> <% out.println(r.getString("flightno"));%></td>
                      <td> <% out.println(r.getString("flightnm"));%></td>
                      <td> <% out.println(r.getString("jrdate")); %></td>
                      <td> <% out.println(r.getString("source")); %></td>
                      <td> <% out.println(r.getString("destination")); %></td>
                      <td> <% out.println(r.getString("person")); %></td>
                       <td> <input type="button" value="Edit" ></td>
                      <%
                      }
                    %>
                     </tr> 
                      </table>
       
                     
                    <%
                        trainbooking tb = new trainbooking();
                        ResultSet r2= tb.AlltrainBookings();
                        %>
                        <table>
                          <tr>
                              <th colspan="9" style="background-color:#ff6666; color:black"><h3>Train Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Customer ID</th>
                              <th>Booking ID</th>
                              <th>Train Number</th>
                              <th>Train Name</th>
                              <th>Journey Date</th>
                              <th>Source</th>
                              <th>Destination</th>
                              <th>Person</th>
                              <th>Edit</th>
                          </tr>
                        <%
                        while(r2.next()){
                         %>
                         <tr>
                        <td> <% out.println(r2.getString("custid"));%></td>
                      <td> <% out.println(r2.getString("tbookingid"));%></td>
                      <td> <% out.println(r2.getString("trainno"));%></td>
                      <td> <% out.println(r2.getString("trainnm"));%></td>
                      <td> <% out.println(r2.getString("jrdate")); %></td>
                      <td> <% out.println(r2.getString("source")); %></td>
                      <td> <% out.println(r2.getString("destination")); %></td>
                       <td> <% out.println(r2.getString("person")); %></td>
                        <td> <input type="button" value="Edit" ></td>
                         <% } %>
                           </tr> 
                      </table> 
                
                          
                         <%
                             hotelbooking hb = new hotelbooking();
                             ResultSet r3= hb.AllHotelBookings();
                             %>
                             <table>
                          <tr>
                              <th colspan="9" style="background-color:#00cccc; color:black"><h3>Hotel Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Customer ID</th>
                              <th>Booking ID</th>
                              <th>Hotel Number</th>
                              <th>Hotel Name</th>
                              <th>Hotel Address</th>
                              <th>Check in Date</th>
                              <th>Check out Date</th>
                              <th>Rooms Booked</th>
                              <th>Edit</th>
                          </tr>
                             <%
                                 while(r3.next()){
                               %>
                               <tr>
                        <td> <% out.println(r3.getString("custid"));%></td>
                      <td> <% out.println(r3.getString("hbookingid"));%></td>
                      <td> <% out.println(r3.getString("hotelid"));%></td>
                      <td> <% out.println(r3.getString("hotelnm"));%></td>
                      <td> <% out.println(r3.getString("hoteladdr"));%></td>
                      <td> <% out.println(r3.getString("checkin")); %></td>
                      <td> <% out.println(r3.getString("checkout")); %></td>
                      <td> <% out.println(r3.getString("rooms")); %></td>  
                        <td> <input type="button" value="Edit" ></td>
                         <%   
                        }
                     %>
                      </tr> 
                      </table>
                      
                      <%
                             packagebooking pb = new packagebooking();
                             ResultSet r4= pb.AllpackageBookings();
                             %>
                             
                             <table>
                          <tr>
                              <th colspan="9" style="background-color:gold; color:black"><h3>Package Bookings</h3></th>
                          </tr>
                          <tr>
                              <th>Customer ID</th>
                              <th>Booking ID</th>
                              <th>Package ID</th>
                              <th>Package Name</th>
                              <th>Duration</th>
                              <th>Destination</th>
                              <th>Departure Date</th>
                              <th>Persons</th>
                              <th>Edit</th>
                          </tr>
                             <%
                                 while(r4.next()){
                               %>
                               <tr>
                      <td> <% out.println(r4.getString("custid"));%></td>
                      <td> <% out.println(r4.getString("pbookingid"));%></td>
                      <td> <% out.println(r4.getString("packageid"));%></td>
                      <td> <% out.println(r4.getString("packname"));%></td>
                      <td> <% out.println(r4.getString("duration")); %></td>
                      <td> <% out.println(r4.getString("destination")); %></td>
                      <td> <% out.println(r4.getString("departdate")); %></td>
                      <td> <% out.println(r4.getString("person")); %></td>  
                      <td> <input type="button" value="Edit" ></td>
                         <%   
                        }
                     %>
                      </tr> 
                             </table>
                     <%
                         
                 }catch(Exception ex){
                     out.println(ex);
                 }
                %>
              
           </div> </div>


        <%----Footer---%>

        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6>EasyTrip</h6>
                        <p class="text-justify"> Administration Access Only</p>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <h6>Management</h6>
                        <ul class="footer-links">
                            <li><a href="manageflights.jsp">Manage Flights</a></li>
                            <li><a href="managetrains.jsp">Manage Trains </a></li>
                            <li><a href="managehotels.jsp">Manage Hotels</a></li>
                            <li><a href="managepackages.jsp">Manage Packages</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <h6>Quick Links</h6>
                        <ul class="footer-links">
                            <li><a href="addflight.jsp">Add New Flight</a></li>
                            <li><a href="addtrain.jsp">Add New Train</a></li>
                            <li><a href="addhotel.jsp">Add New Hotel</a></li>
                            <li><a href="addpackage.jsp">Add New Package</a></li>
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
