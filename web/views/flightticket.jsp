<%-- 
    Document   : flightticket
    Created on : 23 May, 2022, 11:47:37 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <style>
        .reciept table{
                margin-top:20px; 
                border: 2px solid black; 
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 70px;
            }
             .reciept table td{
                background-color:white;
                text-align: left;
                padding-left: 70px;
                padding-bottom: 10px;
                padding-right: 50px;
                border-top: 1px solid black;
                border-left: 1px solid black;
                border-bottom:  1px solid black;
                border-right:  1px solid black;
            }
            .reciept table th{
                background-color:#cccccc;
                text-align: left;
                padding-left: 70px;
                padding-bottom: 10px;
                padding-right: 50px;
                border-top: 1px solid black;
                border-left: 1px solid black;
                border-bottom:  1px solid black;
                border-right:  1px solid black;
            }
            </style>
    </head>
    <body>
       <%@page import="model.*,java.sql.*"%>
       <%!  int transid,bookingid;%>
       <% 
                       bookingid=Integer.parseInt(session.getAttribute("bid").toString());
                       
                       try{
                           flightbooking fb= new flightbooking();
                           fb.setBookingid(bookingid);
                           ResultSet r= fb.SearchfBooking();
                           %>
                           <div class="reciept">
                           <table>
                               <tr>
                                   <td colspan="3"><h2>FLIGHT TICKET & PAYMENT RECEIPT</h2></td>
                                   <td><img src="logo.png" height="50" width="100"></td>
                               </tr>
                          
                           <%
                              while (r.next()) {
                           
                           %>
                         
                           <tr><td colspan="4"><h6>Booking ID : <% out.println(r.getString("bookingid"));%></h6></td></tr>
                           <tr>
                               <td><h6>Flight No</h6></td>
                               <td><% out.println(r.getString("flightno"));%></td>
                               <td><h6>Flight Name</h6></td>
                               <td><% out.println(r.getString("flightnm"));%></td>
                           </tr>   
                           <tr>
                               <td><h6>Departure Time</h6></td>
                               <td><% out.println(r.getString("deptime"));%></td>
                               <td><h6>Departure Date</h6></td>
                               <td><% out.println(r.getString("jrdate"));%></td>
                           </tr> 
                           <tr>
                               <td><h6>Source</h6></td>
                               <td><% out.println(r.getString("source"));%></td>
                               <td><h6>Destination</h6></td>
                               <td><% out.println(r.getString("destination"));%></td>
                           </tr> 
                            <tr>
                               <td><h6>Journey Class</h6></td>
                               <td>  <% out.println(r.getString("jrclass"));%></td>
                               <td><h6>Adults & Childs </h6></td>
                               <td>A:<% out.println(r.getString("person"));%>C:<% out.println(r.getString("child"));%></td>
                           </tr>             
                         <%
                            }
                         %>
                         
                         
                         <tr>
                             <td colspan="4"><h4>Passengers Details</h4></td>
                            </tr>
                            <tr>
                             <th><h6>Name</h6></th>
                             <th><h6>Age</h6></th>
                             <th><h6>Gender</h6></th>
                             <th><h6>Seat No</h6></th>
                            </tr>
                         <%
                             fpassenger passnger= new fpassenger();
                             passnger.setBookingid(bookingid);
                             ResultSet r2= passnger.Searchfpassenger();
                             
                             while (r2.next()){
                                 
                             %>
                             <tr>
                                 <td><% out.println(r2.getString("passname"));%></td>
                                 <td><% out.println(r2.getString("passage"));%></td>
                                 <td><% out.println(r2.getString("passgen"));%></td>
                                 <td><% out.println(r2.getString("seatno"));%></td>
                             </tr>
                             
                             <%
                             }
                           %>
                            <tr>
                             <td colspan="4"><h4>Payment Details</h4></td>
                            </tr>
                            <tr>
                             <th colspan="2"><h6>Transaction ID</h6></th>
                             <th><h6>Transaction Date</h6></th>
                             <th><h6>Amount</h6></th>
                            </tr>
                           <%
                               fpayment fpay= new fpayment();
                               fpay.setBookingid(bookingid);
                               ResultSet r3= fpay.Searchfpayment();
                               while (r3.next()){
                                %>
                                <tr>
                                        <td colspan="2"><% out.println(r3.getString("transid"));%></td>
                                        <td><% out.println(r3.getString("transdate"));%></td>
                                        <td><% out.println(r3.getString("amount"));%></td>
                                </tr>
                                <%
                               }
                        } catch (Exception ex) {
                            out.println(ex);
                        }
                    %>
                    <tr><td colspan="4"><center><input type="submit" value="Print Ticket" onclick="window.print()"></center></td></tr>
                           </table></div>

    </body>
</html>
