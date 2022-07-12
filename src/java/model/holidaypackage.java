/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

/**
 *
 * @author dell
 */
public class holidaypackage {
    private int packageid;
    private String packname;
    private String description;
    private String source;
    private String destination;
    private String duration;
    private String packinc;
    private Blob packimg;
    private int price;

    public int getPackageid() {
        return packageid;
    }

    public String getPackname() {
        return packname;
    }

    public String getDescription() {
        return description;
    }

    public String getSource() {
        return source;
    }

    public String getDestination() {
        return destination;
    }

    public String getDuration() {
        return duration;
    }

    public String getPackinc() {
        return packinc;
    }

    public Blob getPackimg() {
        return packimg;
    }

    public int getPrice() {
        return price;
    }

    public void setPackageid(int packageid) {
        this.packageid = packageid;
    }

    public void setPackname(String packname) {
        this.packname = packname;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setPackinc(String packinc) {
        this.packinc = packinc;
    }

    public void setPackimg(Blob packimg) {
        this.packimg = packimg;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public ResultSet SearchPackage()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from holidaypackage where destination="+"'"+this.destination+"'";
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    public ResultSet Searchpackbyno()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from holidaypackage where packageid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.packageid);
            r=ps.executeQuery();
            
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    
    public ResultSet SearchAllpackage()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from holidaypackage";
            PreparedStatement ps=con.prepareStatement(qry);
          
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    
}
