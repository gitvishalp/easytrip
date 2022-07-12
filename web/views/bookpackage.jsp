<%-- 
    Document   : bookpackage
    Created on : 26 May, 2022, 10:57:59 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Package</title>
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

        <%-- Booking Code ---%>                       

        <%@page import="java.io.*,java.util.*,java.sql.*,model.*"%>
        <%!  int bookid,custid;%>
        <%
              packagebooking autobid= new packagebooking();
              bookid= autobid.AutoGenPbid();
              session.setAttribute("pkbid", bookid);
              custid= Integer.parseInt(session.getAttribute("cid").toString());
            try {
                holidaypackage hp= new holidaypackage();
                hp.setPackageid(Integer.parseInt(request.getParameter("packid")));
                ResultSet r = hp.Searchpackbyno();
                while (r.next()) {
        %>
        <div class="booking-form" style="height: 570px;">
            <form action="../packbookingserv">
                <table>
                    <tr>
                        <td colspan="5"><h3>Package Booking Details</h3><hr></td>
                    </tr>
                    <tr>
                        <td><label>Booking ID</label></td>
                        <td><input type="text" name="pbid" value="<%= bookid%>" readonly="true"></td>
                    <td colspan="2" rowspan="3"><% out.println("<img width='320' height='150' src=../DisplayPackPhoto?id=" + r.getInt("packageid") + "></img></p>");%></td>
                    </tr>
                    <tr>
                        <td><label><font color="green">Customer ID</font></label></td>
                        <td><input type="text" name="custid" value="<%= custid %>" readonly="true"></td>
                    </tr>
                    <tr>
                        <td><label>Package ID: </label></td>
                        <td><input type="text" name="pid" value="<%= r.getString("packageid")%>" ></td>
                    </tr>
                    <tr>
                        <td><label>Package Name : </label></td>
                        <td><input type="text" name="pnm" value="<%= r.getString("packname")%>" ></td>
                        <td><label>Duration </label></td>
                        <td><input type="text" name="dur" value="<%= r.getString("duration")%>"></td>
                    </tr>
                    <tr>
                        <td><label>Source : </label></td>
                        <td><input type="text" name="src" value="<%= r.getString("source")%>"></td>
                        <td><label>Destination : </label></td>
                        <td><input type="text" name="dest" value="<%= r.getString("destination")%>"  ></td>
                    </tr>
                    <tr>
                        <td><label> Departure Date</label></td><td>
                            <input type="date" name="ddate" required="true" ></td>
                            <td><label> Persons: </label></td><td>
                                <input type="number" name="person" value="01" min="1" ></td>
                    </tr>
                    <tr>
                            <td><label>Customer Name </label></td><td>
                            <input type="text" name="cname" placeholder="Customer Name" ></td>
                            <td><label>Address </label></td>
                            <td><input type="text" name="addr" placeholder="Address"></td> 
                    </tr>
                    <tr>
                            <td><label>Mobile No </label></td><td>
                            <input type="text" name="mobno" placeholder="Mobile Number" ></td>
                            <td><label>Price</label></td>
                                <td><input type="text" name="price" value="<%= r.getString("price")%>"></td>
                            
                    </tr>
                     <%
                            }
                        } catch (Exception ex) {
                            out.println(ex);
                        }
                    %>
                    <tr>
                        <td colspan="4"><center><input type="submit" value="Make Payment"></center></td>
                    </tr>
                </table>
            </form></div>

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
