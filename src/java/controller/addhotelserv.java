/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import model.*;

import java.io.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Decoder;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItem;


public class addhotelserv extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            hotel h= new hotel();
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu= new ServletFileUpload(factory);
            
            if(! ServletFileUpload.isMultipartContent(request)){
                out.println("Sorry No File Selected");
            }
            
            List items = sfu.parseRequest(request);
            
            FileItem hid= (FileItem) items.get(0);
            String hotid= hid.getString();
            h.setHotelid(Integer.parseInt(hotid));
            
            FileItem nm= (FileItem) items.get(1);
            String hnm= nm.getString();
            h.setHotelnm(hnm);
            
            FileItem addr= (FileItem) items.get(2);
            String hadr= addr.getString();
            h.setHoteladdr(hadr);
            
            FileItem city= (FileItem) items.get(3);
            String hcity= city.getString();
            h.setCity(hcity);
            
            FileItem cont= (FileItem) items.get(4);
            String hcont= cont.getString();
            h.setContact(hcont);
            
            FileItem str= (FileItem) items.get(5);
            String hstar= str.getString();
            h.setStars(hstar);
            
            FileItem amen= (FileItem) items.get(6);
            String hamen= amen.getString();
            h.setAmen(hamen);
            
            FileItem meal= (FileItem) items.get(7);
            String hmeal= meal.getString();
            h.setMeal(hmeal);
            
            FileItem feat= (FileItem) items.get(8);
            String hfeat= feat.getString();
            h.setFeat(hfeat);
            
            FileItem file= (FileItem) items.get(9);
            
            
            FileItem price= (FileItem) items.get(10);
            String hprice= price.getString();
            h.setPrice(Integer.parseInt(hprice));
            
            int res=1;
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
