/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

public class hotelbooking {
    private int hbookingid;
    private int custid;
    private int hotelid;
    private String hotelnm;
    private String hoteladdr;
    private String checkin;
    private String checkout;
     private int person;
     private int child;
     private int rooms;
     private int price;
     private String custnm;
     private String address;
     private String mobno;

    public int getHbookingid() {
        return hbookingid;
    }

    public int getCustid() {
        return custid;
    }

    public int getHotelid() {
        return hotelid;
    }

    public String getHotelnm() {
        return hotelnm;
    }

    public String getHoteladdr() {
        return hoteladdr;
    }

    public String getCheckin() {
        return checkin;
    }

    public String getCheckout() {
        return checkout;
    }

    public int getPerson() {
        return person;
    }

    public int getChild() {
        return child;
    }

    public int getRooms() {
        return rooms;
    }

    public int getPrice() {
        return price;
    }

    public String getCustnm() {
        return custnm;
    }

    public String getAddress() {
        return address;
    }

    public String getMobno() {
        return mobno;
    }

    public void setHbookingid(int hbookingid) {
        this.hbookingid = hbookingid;
    }

    public void setCustid(int custid) {
        this.custid = custid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    public void setHotelnm(String hotelnm) {
        this.hotelnm = hotelnm;
    }

    public void setHoteladdr(String hoteladdr) {
        this.hoteladdr = hoteladdr;
    }

    public void setCheckin(String checkin) {
        this.checkin = checkin;
    }

    public void setCheckout(String checkout) {
        this.checkout = checkout;
    }

    public void setPerson(int person) {
        this.person = person;
    }

    public void setChild(int child) {
        this.child = child;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setCustnm(String custnm) {
        this.custnm = custnm;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }
     
    
     public int HoteBooking()
    {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into hotelbooking values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getHbookingid());
            ps.setInt(2,this.getCustid());
            ps.setInt(3,this.getHotelid());
            ps.setString(4,this.getHotelnm());
            ps.setString(5,this.getHoteladdr());
            ps.setString(6,this.getCheckin());
            ps.setString(7,this.getCheckout());
            ps.setInt(8,this.getPerson());
            ps.setInt(9,this.getChild());
            ps.setInt(10,this.getRooms());
            ps.setInt(11,this.getPrice());
            ps.setString(12,this.getCustnm());
            ps.setString(13,this.getAddress());
            ps.setString(14,this.getMobno());
                           
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
     
     public int AutoGenhbid()
    {
        int hbid=0;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select max(hbookingid) from hotelbooking";
            PreparedStatement ps=con.prepareStatement(qry);

            ResultSet rs=ps.executeQuery();
            rs.next();
            hbid=rs.getInt(1);
            hbid++;  
        }catch(Exception ex){
            System.out.println(ex);
        }
       return hbid;
    }
     
     public ResultSet SearchhBooking()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from hotelbooking where hbookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.hbookingid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
     
      public ResultSet TotalPrice()
    {
        
        ResultSet fare=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select sum(rooms*price) from hotelbooking where hbookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.hbookingid);
            fare=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return fare;
    }
      
      public ResultSet custHBooking()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from hotelbooking where custid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.custid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
      
      public ResultSet AllHotelBookings()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from hotelbooking" ;
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
}
