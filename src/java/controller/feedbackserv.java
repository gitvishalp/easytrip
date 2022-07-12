/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


public class feedbackserv extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
            
           final String to="vpknj643@gmail.com";
           final String subject="New Feedback From User";
           final String messg= request.getParameter("txtmsg");
           final String from= request.getParameter("txtemail");
           final String pass="Vpanju@5545";
           String host="smtp.gmail.com";
           
           
           Properties props= new Properties();
           props.put("mail.smtp.host", host);
           props.put("mail.transport.protocol","smtp");
           props.put("mail.smtp.auth", "true");
           props.put("mail.smtp.starttls.enable","true");
           props.put("mail.user", from);
           props.put("mail.password", pass);
           props.put("mail.port","587");
           
           
           
           Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);    
            }    
            });
           
           MimeMessage message = new MimeMessage(mailSession);
           message.setFrom(new InternetAddress(from));
           message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
           message.setSubject(subject);
           message.setText(messg);

           Transport transport= mailSession.getTransport();
           transport.connect();
           transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
           transport.close();
           out.println("<script type=\"text/javascript\">");
                out.println("alert('Thank You For Your Valuable Feedback!!');");
                out.println("location='views/feedback.jsp';");
                out.println("</script>");
           
            
        }catch(Exception ex){
            out.println("<script type=\"text/javascript\">");
                out.println("alert('Thank You For Your Valuable Feedback!!');");
                out.println("location='views/feedback.jsp';");
                out.println("</script>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
