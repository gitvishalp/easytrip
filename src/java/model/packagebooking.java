/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

public class packagebooking {
    
    private int pbookingid;
    private int custid;
    private int packageid;
    private String packname;
    private String duration;
    private String source;
    private String destination;
    private String departdate;
    private int person;
    private int price;
    private String custname;
    private String address;
    private String mobno;

    public int getPbookingid() {
        return pbookingid;
    }

    public int getCustid() {
        return custid;
    }

    public int getPackageid() {
        return packageid;
    }

    public String getPackname() {
        return packname;
    }

    public String getDuration() {
        return duration;
    }

    public String getSource() {
        return source;
    }

    public String getDestination() {
        return destination;
    }

    public String getDepartdate() {
        return departdate;
    }

    public int getPerson() {
        return person;
    }

    public int getPrice() {
        return price;
    }

    public String getCustname() {
        return custname;
    }

    public String getAddress() {
        return address;
    }

    public String getMobno() {
        return mobno;
    }

    public void setPbookingid(int pbookingid) {
        this.pbookingid = pbookingid;
    }

    public void setCustid(int custid) {
        this.custid = custid;
    }

    public void setPackageid(int packageid) {
        this.packageid = packageid;
    }

    public void setPackname(String packname) {
        this.packname = packname;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setDepartdate(String departdate) {
        this.departdate = departdate;
    }

    public void setPerson(int person) {
        this.person = person;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }
    
    
    public int packBooking()
    {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into packagebooking values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getPbookingid());
            ps.setInt(2,this.getCustid());
            ps.setInt(3,this.getPackageid());
            ps.setString(4,this.getPackname());
            ps.setString(5,this.getDuration());
            ps.setString(6,this.getSource());
            ps.setString(7,this.getDestination());
            ps.setString(8,this.getDepartdate());
            ps.setInt(9,this.getPerson());
            ps.setString(10,this.getCustname());
            ps.setString(11,this.getAddress());
            ps.setString(12,this.getMobno());
            ps.setInt(13,this.getPrice());
                           
            int r=ps.executeUpdate();
            if(r==1)
                return 1;
            else
                return 0;
        }catch(Exception ex){
            System.out.println(ex);
        }
       return 1;
    }
    
     public int AutoGenPbid()
    {
        int pbid=0;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select max(pbookingid) from packagebooking";
            PreparedStatement ps=con.prepareStatement(qry);

            ResultSet rs=ps.executeQuery();
            rs.next();
            pbid=rs.getInt(1);
            pbid++;  
        }catch(Exception ex){
            System.out.println(ex);
        }
       return pbid;
    }
    
     public ResultSet SearchPBooking()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from packagebooking where pbookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.pbookingid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
     
     public ResultSet custPBooking()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from packagebooking where custid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.custid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
     
     public ResultSet AllpackageBookings()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from packagebooking" ;
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
}
