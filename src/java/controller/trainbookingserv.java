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

public class trainbookingserv extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            trainbooking tb=new trainbooking();
            
            tb.setTbookingid(Integer.parseInt(request.getParameter("bookid")));
            tb.setCustid(Integer.parseInt(request.getParameter("custid")));
            tb.setTrainno(Integer.parseInt(request.getParameter("txttrainno")));
            tb.setTrainnm(request.getParameter("txttrainnm"));
            tb.setDepttime(request.getParameter("deptime"));
            tb.setJrdate(request.getParameter("jdate"));
            tb.setSource(request.getParameter("source"));
            tb.setDestination(request.getParameter("destination"));
            tb.setJrclass(request.getParameter("jrclass"));
            tb.setPerson(Integer.parseInt(request.getParameter("tperson")));
            tb.setChild(Integer.parseInt(request.getParameter("tchild")));
            tb.setFare(Integer.parseInt(request.getParameter("tfare")));
            
            int res=tb.TrainBooking();
            if(res==1)
            {
                out.println("Record Saved Successfully");
                response.sendRedirect("views/tpassenger.jsp");
            }
            else
                out.println("record not saved");
           
        }catch(Exception ex)
        {
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
