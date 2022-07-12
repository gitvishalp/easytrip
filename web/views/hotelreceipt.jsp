<%-- 
    Document   : hotelreceipt
    Created on : 26 May, 2022, 10:32:56 AM
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
                       bookingid=Integer.parseInt(session.getAttribute("hbid").toString());
                       
                       try{
                           hotelbooking hb= new hotelbooking();
                           hb.setHbookingid(bookingid);
                           ResultSet r= hb.SearchhBooking();
                           %>
                           <div class="reciept">
                           <table>
                               <tr>
                                   <td colspan="3"><h2>HOTEL BOOKING & PAYMENT RECEIPT</h2></td>
                                   <td><img src="logo.png" height="50" width="100"></td>
                               </tr>
                           <%
                              while (r.next()) {
                           
                           %>
                         
                           <tr><td colspan="4"><h6>Booking ID : <% out.println(r.getString("hbookingid"));%></h6></td></tr>
                           <tr>
                               <td><h6>Hotel ID</h6></td>
                               <td><% out.println(r.getString("hotelid"));%></td>
                               <td><h6>Hotel Name</h6></td>
                               <td><% out.println(r.getString("hotelnm"));%></td>
                           </tr>   
                           <tr>
                               <td><h6>Hotel Address : </h6></td>
                               <td colspan="3"> <% out.println(r.getString("hoteladdr"));%></td>
                           </tr> 
                           <tr>
                               <td><h6>Check-in Date</h6></td>
                               <td><% out.println(r.getString("checkin"));%></td>
                               <td><h6>Check-Out Date</h6></td>
                               <td><% out.println(r.getString("checkout"));%></td>
                           </tr> 
                            <tr>
                               <td><h6>No of Rooms</h6></td>
                               <td>  <% out.println(r.getString("rooms"));%></td>
                               <td><h6>Adults & Childs </h6></td>
                               <td>A:<% out.println(r.getString("person"));%>C:<% out.println(r.getString("child"));%></td>
                           </tr>             
                         
                         <tr>
                             <td colspan="4"><h4>Customer Details</h4></td>
                            </tr>
                            <tr>
                             <th><h6>Name</h6></th>
                             <th><h6>Address</h6></th>
                             <th colspan="2"><h6>Mobile No</h6></th>
                            </tr>
                             <tr>
                                 <td><% out.println(r.getString("custnm"));%></td>
                                 <td><% out.println(r.getString("address"));%></td>
                                 <td colspan="2"><% out.println(r.getString("mobno"));%></td>
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
                               hpayment hpay= new hpayment();
                               hpay.setHbookingid(bookingid);
                               ResultSet r3= hpay.Searchhpayment();
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