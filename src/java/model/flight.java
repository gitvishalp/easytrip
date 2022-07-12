/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
public class flight {
    private int flightno;
    private String flightnm;
    private String depttime;
    private String arrtime;
    private String source;
    private String destination;
    private int fare;

    public int getFlightno() {
        return flightno;
    }

    public String getFlightnm() {
        return flightnm;
    }

    public String getDepttime() {
        return depttime;
    }

    public String getArrtime() {
        return arrtime;
    }

    public String getSource() {
        return source;
    }

    public String getDestination() {
        return destination;
    }

    public int getFare() {
        return fare;
    }

    public void setFlightno(int flightno) {
        this.flightno = flightno;
    }

    public void setFlightnm(String flightnm) {
        this.flightnm = flightnm;
    }

    public void setDepttime(String depttime) {
        this.depttime = depttime;
    }

    public void setArrtime(String arrtime) {
        this.arrtime = arrtime;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setFare(int fare) {
        this.fare = fare;
    }
    
    public int AddFlight(){
        
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into flight values(?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getFlightno());
            ps.setString(2,this.getFlightnm());
            ps.setString(3, this.getDepttime());
            ps.setString(4,this.getArrtime());
            ps.setString(5,this.getSource());
            ps.setString(6,this.getDestination());
            ps.setInt(7,this.getFare());
           
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
    
    public ResultSet SearchFlightNo()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from flight where flightno=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.flightno);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
     public ResultSet SearchFlight()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from flight where source="+"'"+this.source+"'"+" and destination="+"'"+this.destination+"'";
            PreparedStatement ps=con.prepareStatement(qry);
          
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
     
     public ResultSet SearchAllFlight()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from flight";
            PreparedStatement ps=con.prepareStatement(qry);
          
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    
    
    
    
    
}
