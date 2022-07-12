<%-- 
    Document   : addpackcode
    Created on : 9 May, 2022, 9:41:39 PM
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
        <%@page import="java.sql.*,java.io.*, java.util.*,org.apache.commons.fileupload.disk.DiskFileItemFactory, org.apache.commons.fileupload.servlet.ServletFileUpload, org.apache.commons.fileupload.FileItem"%>
        
        <%! String nm,desc,src,dest,dur,pkg; int pid,price;     %>
        
        <%
         try{
             DiskFileItemFactory factory = new DiskFileItemFactory();
             ServletFileUpload sfu= new ServletFileUpload(factory);
             if(! ServletFileUpload.isMultipartContent(request)){
                out.println("Sorry No File Selected");
                return;
            }
             
             List items = sfu.parseRequest(request);
            
            FileItem id= (FileItem) items.get(0);
            String pkgid= id.getString();
            pid= (Integer.parseInt(pkgid));
            
            FileItem pnm= (FileItem) items.get(1);
            nm= pnm.getString();
            
            FileItem pdesc= (FileItem) items.get(2);
            desc= pdesc.getString();
            
            FileItem psrc= (FileItem) items.get(3);
            src= psrc.getString();
            
            FileItem pdest= (FileItem) items.get(4);
            dest= pdest.getString();
            
            FileItem pdur= (FileItem) items.get(5);
            dur= pdur.getString();
            
            FileItem pkgin= (FileItem) items.get(6);
            pkg = pkgin.getString();
            
            
            FileItem file= (FileItem) items.get(7);
            
            FileItem pprice= (FileItem) items.get(8);
            String pkgprice= pprice.getString();
            price= (Integer.parseInt(pkgprice));
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into holidaypackage values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, pid);
            ps.setString(2, nm);
            ps.setString(3, desc);
            ps.setString(4, src);
            ps.setString(5, dest);
            ps.setString(6, dur);
            ps.setString(7, pkg);
            ps.setBinaryStream(8, file.getInputStream(), (int)file.getSize());
            ps.setInt(9, price);
             
            ps.executeUpdate(); 
            out.println("Record Saved");
            
         }catch(Exception ex){
             out.println(ex);
         }            
             

            %>
    </body>
</html>
