
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



public class forgetserv extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
           String email= request.getParameter("txtemail");
           customer s=new customer();
           s.setEmail(email);
           String res=s.forgetcode();
           
           final String messg= "Your Password is"+res;
           final String from="vpknj643@gmail.com";
           final String pass="Vpanju@5545";
           String host="smtp.gmail.com";
           String to=email;
           String subject="EasyTrip- Password Recovery";
           
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
           out.println("Your Password Sent to mail");
           
           
           
           
                   
        }catch(Exception ex)
        {
            out.println(ex);
        }
    }

}
