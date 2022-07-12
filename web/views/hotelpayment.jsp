<%-- 
    Document   : hotelpayment
    Created on : 25 May, 2022, 4:19:32 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
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
       

            
            <%--Payment Code ---%>
            
        <%@page import="java.io.*,java.util.*,java.sql.*,model.*"%>
        <%!  int transid,bookingid, total;%>
        <%
              bookingid=Integer.parseInt(session.getAttribute("hbid").toString());
              
              hpayment hp= new hpayment();
              transid=hp.AutoHtransid();    
        %>
        <% try {
                hotelbooking hb = new hotelbooking();
                hb.setHbookingid(bookingid);
                ResultSet r = hb.SearchhBooking();

                ResultSet tprice = hb.TotalPrice();
                tprice.next(); 
                total = tprice.getInt(1);
                while (r.next()) {
        %>
        <div class="payment-form">
            <form action="../hotlpayserv">
                <table>
                    <tr>
                        <td colspan="2"><h3>Make Payment Through Credit/Debit Card</h3><hr></td>
                    </tr>
                    <tr>
                        <td><label>Booking ID</label></td>
                        <td><input type="text" name="bookid" value="<%= bookingid%>" readonly="true"></td>
                    </tr>
                    <tr>
                        <td><label>Transaction ID</label></td>
                        <td><input type="text" name="transid" value="<%= transid%>" readonly="true"></td>
                    </tr>
                    <tr>
                        <td><label>Amount </label></td>
                        <td><input type="text" name="hbill" value="<%= total %>" readonly="true"></td>
                    </tr>
                    
                    <tr>
                        <td><label>Card Number</label></td>
                        <td><input type="text" name="cardno" placeholder="XXXX-XXXX-XXXX" required="true"></td>
                    </tr>
                     <tr>
                        <td><label>Card Type</label></td>
                        <td><select name="ctype" required="true">
                                <option value="debit">DEBIT CARD</option>
                                <option value="credit">CREDIT CARD</option>
                            </select></td>
                     </tr>
                     <tr>
                        <td><label>Bank Name</label></td>
                        <td><select name="bname" required="true">
                                <option value="sbi">SBI</option>
                                <option value="boi">BANK OF INDIA</option>
                                <option value="hdfc">HDFC BANK</option>
                                <option value="icici">ICICI BANK</option>
                            </select></td>
                     </tr>
                    <tr>
                            <td><label>CVV </label></td>
                            <td><input type="password" name="cvv" placeholder="XXX" required="true"></td>
                    </tr>
                    <tr>
                            <td><label>Card Holder Name</label></td>
                            <td><input type="text" name="cardholder" placeholder="Card Holder" required="true"></td>
                    </tr>
                    <tr>
                            <td><label>Valid Upto</label></td>
                            <td><input type="text" name="valid" placeholder="00/0000" required="true"></td>
                    </tr>
                    <tr>
                        <td><input type="reset" value="Reset"></td>
                        <td><input type="submit" value="Pay"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr></td>
                    </tr>
                    <tr>
                        <td><h5>We Accepting Various Cards</h5></td>
                        <td><img src="mcard.png" height="50" width="50"><img src="visa.png" height="50" width="50"><img src="Rupay.png" height="50" width="70"></td>
                    </tr>
                </table>
                    <%
                            }
                        } catch (Exception ex) {
                            out.println(ex);
                        }
                    %>
            </form></div><br><br><br>



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
