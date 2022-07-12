/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet(name = "CustRegServ", urlPatterns = {"/CustRegServ"})
public class CustRegServ extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            customer s=new customer();
            s.setCustid(Integer.parseInt(request.getParameter("txtcid")));
            s.setCustname(request.getParameter("txtcnm"));
            s.setEmail(request.getParameter("txtemail"));
            s.setMobno(request.getParameter("txtmobno"));
            s.setAddr(request.getParameter("txtaddr"));
            s.setGender(request.getParameter("txtgen"));
            s.setPasswd(request.getParameter("txtpswd"));
            
            int res=s.CustomerRegistration();
            if(res==1)
            {
                   out.println("<script type=\"text/javascript\">");
                   out.println("alert('You Are Registered Successfully!!!');");
                   out.println("location='views/login.jsp';");
                   out.println("</script>");
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Something Went Wrong!!!');");
                out.println("location='views/CustomerRegistration.jsp';");
                out.println("</script>");
            }
        }catch(Exception ex)
        {
            out.println(ex);
        }
    }

   
}
