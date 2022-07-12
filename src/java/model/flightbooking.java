/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

public class flightbooking {
    private int bookingid;
    private int custid;
    private int flightno;
    private String flightnm;
    private String deptime;
    private String jrdate;
    private String source;
    private String destination;
    private String jrclass;
    private int person;
    private int child;
    private int fare;

    public int getBookingid() {
        return bookingid;
    }

    public int getCustid() {
        return custid;
    }

    public int getFlightno() {
        return flightno;
    }

    public String getFlightnm() {
        return flightnm;
    }

    public String getDeptime() {
        return deptime;
    }

    public String getJrdate() {
        return jrdate;
    }

    public String getSource() {
        return source;
    }

    public String getDestination() {
        return destination;
    }

    public String getJrclass() {
        return jrclass;
    }

    public int getPerson() {
        return person;
    }
    public int getChild() {
        return child;
    }

    public int getFare() {
        return fare;
    }

    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }

    public void setCustid(int custid) {
        this.custid = custid;
    }

    public void setFlightno(int flightno) {
        this.flightno = flightno;
    }

    public void setFlightnm(String flightnm) {
        this.flightnm = flightnm;
    }

    public void setDeptime(String deptime) {
        this.deptime = deptime;
    }

    public void setJrdate(String jrdate) {
        this.jrdate = jrdate;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setJrclass(String jrclass) {
        this.jrclass = jrclass;
    }

    public void setPerson(int person) {
        this.person = person;
    }
    public void setChild(int child) {
        this.child = child;
    }

    public void setFare(int fare) {
        this.fare = fare;
    }

   
    public int FlightBooking()
    {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into flightbooking values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getBookingid());
            ps.setInt(2,this.getCustid());
            ps.setInt(3,this.getFlightno());
            ps.setString(4,this.getFlightnm());
            ps.setString(5,this.getDeptime());
            ps.setString(6,this.getJrdate());
            ps.setString(7,this.getSource());
            ps.setString(8,this.getDestination());
            ps.setString(9,this.getJrclass());
            ps.setInt(10,this.getPerson());
            ps.setInt(11,this.getChild());
            ps.setInt(12,this.getFare());
                           
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
    
       public int AutoGenBid()
    {
        int bid=0;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select max(bookingid) from flightbooking";
            PreparedStatement ps=con.prepareStatement(qry);

            ResultSet rs=ps.executeQuery();
            rs.next();
            bid=rs.getInt(1);
            bid++;  
        }catch(Exception ex){
            System.out.println(ex);
        }
       return bid;
    }
       
       public ResultSet SearchfBooking()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from flightbooking where bookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.bookingid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
       
       public ResultSet TotalFare()
    {
        
        ResultSet fare=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select sum(person*fare) from flightbooking where bookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.bookingid);
            fare=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return fare;
    }
       
        public ResultSet custfBooking()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from flightbooking where custid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.custid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
      public ResultSet AllFlightBookings()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from flightbooking" ;
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
}
