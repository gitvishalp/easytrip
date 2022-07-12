<%-- 
    Document   : addtrain
    Created on : 8 May, 2022, 10:20:20 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin- Add Train</title>
        <meta name="viewport" content="width=device-width, iniial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">
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
                                    <a class="dropdown-item" href="#">Manage Customers</a>
                                    <a class="dropdown-item" href="#">Manage Flights</a>
                                    <a class="dropdown-item" href="#">Manage Trains</a>
                                    <a class="dropdown-item" href="#">Manage Hotels</a>
                                    <a class="dropdown-item" href="#">Manage Packages</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
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
                        </div
                    </div>
                    </div>
                </div>
            </nav></div>


        <%----Add items Form------%>

        <div class="container" style=" margin-top: 100px; margin-bottom:20px;">

            <div class="additems" style="height:800px;">
                <form action="../addtrainserv">
                    <table>
                        <tr>
                            <td colspan="2">
                        <center><h2> <b>ADD NEW TRAIN</b></h2><hr></center>
                        </td>
                        </tr>
                        <tr>
                            <td>Train Number</td><td><input type="text" name="txttrainno" placeholder="Train Number" required="true"></td>
                        </tr>
                        <tr>
                            <td>Train Name</td><td><input type="text" name="txttrainnm" placeholder="Train Name" required="true"></td>
                        </tr>
                        <tr>
                            <td>Depart Time</td><td><input type="time" name="txtdepttime" required="true"></td>
                        </tr>
                        <tr>
                            <td>Arrival Time</td><td><input type="time" name="txtarrtime" required="true"></td>
                        </tr>
                        <tr>
                            <td>Duration</td><td><input type="time" name="txtduration" required="true"></td>
                        </tr>
                        <tr>
                            <td>Source</td><td><input type="text" name="txtsource" placeholder="Source" required="true"></td>
                        </tr>
                        <tr>
                            <td>Destination</td><td><input type="text" name="txtdestination" placeholder="Destination" required="true"></td>
                        </tr>
                        <tr>
                            <td>Running Days</td><td><input type="text" name="txtdays" placeholder="Running Days" required="true"></td>
                        </tr>
                        <tr>
                            <td>Fare</td><td><input type="text" name="txtfare" placeholder="Fare" required="true"></td>
                        </tr>
                        <tr>
                            <td colspan="3"><center> <input type="Submit" value="Add Train"></center></td> 
                        </tr>
                    </table>
                </form>                      
            </div>                 
        </div><br><br><br><br><br><br>



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
                            <li><a href="#">Manage Flights</a></li>
                            <li><a href="#">Manage Trains </a></li>
                            <li><a href="#">Manage Hotels</a></li>
                            <li><a href="#">Manage Packages</a></li>
                            <li><a href="#">Manage Hotels</a></li>
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