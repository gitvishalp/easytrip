/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import model.*;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class packbookingserv extends HttpServlet {

  
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            packagebooking pb=new packagebooking();
            pb.setPbookingid(Integer.parseInt(request.getParameter("pbid")));
            pb.setCustid(Integer.parseInt(request.getParameter("custid")));
            pb.setPackageid(Integer.parseInt(request.getParameter("pid")));
            pb.setPackname(request.getParameter("pnm"));
            pb.setDuration(request.getParameter("dur"));
            pb.setSource(request.getParameter("src"));
            pb.setDestination(request.getParameter("dest"));
            pb.setDepartdate(request.getParameter("ddate"));
            pb.setPerson(Integer.parseInt(request.getParameter("person")));
            pb.setCustname(request.getParameter("cname")); 
            pb.setAddress(request.getParameter("addr")); 
            pb.setMobno(request.getParameter("mobno"));
            pb.setPrice(Integer.parseInt(request.getParameter("price")));
                    
            int res= pb.packBooking();
            if(res==1)
            {
                out.println("Record Saved Successfully");
                response.sendRedirect("views/packagepayment.jsp");
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
