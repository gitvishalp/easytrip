/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.*;
import java.sql.*;


import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class flightpayserv extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            bankdetail b=new bankdetail();
            b.setCardno(request.getParameter("cardno"));
            b.setCardtype(request.getParameter("ctype"));
            b.setBanknm(request.getParameter("bname"));
            b.setCvv(Integer.parseInt(request.getParameter("cvv")));
            b.setHolder(request.getParameter("cardholder"));
            b.setValidity(request.getParameter("valid"));
            
            ResultSet r=b.Validate();
            if(r==null)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Card Details!!');");
                out.println("location='views/flightpayment.jsp';");
                out.println("</script>");
            }
            else
                {
                java.util.Date today= new java.util.Date();
                Date currentDate = new java.sql.Date(today.getTime());
                fpayment fp= new fpayment();
                fp.setBookingid(Integer.parseInt(request.getParameter("bookid")));
                fp.setTransid(Integer.parseInt(request.getParameter("transid")));
                fp.setTransdate(currentDate.toString());
                fp.setAmount(Integer.parseInt(request.getParameter("fbill")));
                int rs2=fp.FlightPay();
                if(rs2==1){
                       response.sendRedirect("views/flightticket.jsp"); 
                }
                else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Something Went Wrong!!');");
                out.println("location='views/flightpayment.jsp';");
                out.println("</script>");
                }
            }
                
        }catch(Exception ex){
            out.println(ex);
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
