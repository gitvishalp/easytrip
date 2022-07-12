<%-- 
    Document   : logout
    Created on : 5 May, 2022, 10:56:21 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           
        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
            %>
    </body>
</html>
