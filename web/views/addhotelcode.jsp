<%-- 
    Document   : addhotelcode
    Created on : 9 May, 2022, 3:35:04 PM
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
        
        <%! String nm,addr,city,cont,str,amn,meal,feat; int hid,price;     %>
        
        <%
         try{
             DiskFileItemFactory factory = new DiskFileItemFactory();
             ServletFileUpload sfu= new ServletFileUpload(factory);
             if(! ServletFileUpload.isMultipartContent(request)){
                out.println("Sorry No File Selected");
                return;
            }
             
             List items = sfu.parseRequest(request);
            
            FileItem hoid= (FileItem) items.get(0);
            String hotid= hoid.getString();
            hid= (Integer.parseInt(hotid));
            
            FileItem hnm= (FileItem) items.get(1);
            nm= hnm.getString();
            
            FileItem haddr= (FileItem) items.get(2);
            addr= haddr.getString();
            
            FileItem hcity= (FileItem) items.get(3);
            city= hcity.getString();
            
            FileItem hcont= (FileItem) items.get(4);
            cont= hcont.getString();
            
            FileItem hstr= (FileItem) items.get(5);
            str= hstr.getString();
            
            FileItem amen= (FileItem) items.get(6);
            amn= amen.getString();
            
            FileItem hmeal= (FileItem) items.get(7);
            meal= hmeal.getString();
            
            FileItem hfeat= (FileItem) items.get(8);
            feat= hfeat.getString();
            
            FileItem file= (FileItem) items.get(9);
            
            FileItem hprice= (FileItem) items.get(10);
            String hotprice= hprice.getString();
            price= (Integer.parseInt(hotprice));
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into hotel values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, hid);
            ps.setString(2, nm);
            ps.setString(3, addr);
            ps.setString(4, city);
            ps.setString(5, cont);
            ps.setString(6, str);
            ps.setString(7, amn);
            ps.setString(8, meal);
            ps.setString(9, feat);
            ps.setBinaryStream(10, file.getInputStream(), (int)file.getSize());
            ps.setInt(11, price);
             
            ps.executeUpdate(); 
            out.println("Record Saved");
            
         }catch(Exception ex){
             out.println(ex);
         }            
             

            %>
    </body>
</html>
