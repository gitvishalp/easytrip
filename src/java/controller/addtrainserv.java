

package controller;
import model.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class addtrainserv extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            train t=new train();
            t.setTrainno(Integer.parseInt(request.getParameter("txttrainno")));
            t.setTrainnm(request.getParameter("txttrainnm"));
            t.setDepttime(request.getParameter("txtdepttime"));
            t.setArrtime(request.getParameter("txtarrtime"));
            t.setDuration(request.getParameter("txtduration"));
            t.setSource(request.getParameter("txtsource"));
            t.setDestination(request.getParameter("txtdestination"));
            t.setRundays(request.getParameter("txtdays"));
            t.setFare(Integer.parseInt(request.getParameter("txtfare")));
            
            int res=t.AddTrain();
            if(res==1)
                out.println("Record Saved Successfully");
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
