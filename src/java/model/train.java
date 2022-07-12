/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;



public class train {
    private int trainno;
    private String trainnm;
    private String depttime;
    private String arrtime;
    private String duration;
    private String source;
    private String destination;
    private String rundays;
    private int fare;

    public int getTrainno() {
        return trainno;
    }

    public String getTrainnm() {
        return trainnm;
    }

    public String getDepttime() {
        return depttime;
    }

    public String getArrtime() {
        return arrtime;
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

    public String getRundays() {
        return rundays;
    }

    public int getFare() {
        return fare;
    }

    public void setTrainno(int trainno) {
        this.trainno = trainno;
    }

    public void setTrainnm(String trainnm) {
        this.trainnm = trainnm;
    }

    public void setDepttime(String depttime) {
        this.depttime = depttime;
    }

    public void setArrtime(String arrtime) {
        this.arrtime = arrtime;
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

    public void setRundays(String rundays) {
        this.rundays = rundays;
    }

    public void setFare(int fare) {
        this.fare = fare;
    }
    
    public int AddTrain(){
        
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into train values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getTrainno());
            ps.setString(2,this.getTrainnm());
            ps.setString(3, this.getDepttime());
            ps.setString(4,this.getArrtime());
            ps.setString(5,this.getDuration());
            ps.setString(6,this.getSource());
            ps.setString(7,this.getDestination());
            ps.setString(8,this.getRundays());
            ps.setInt(9,this.getFare());
           
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
    
    public ResultSet SearchTrainbyNo()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from train where trainno=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.trainno);
            r=ps.executeQuery();
            
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    public ResultSet SearchTrain()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from train where source="+"'"+this.source+"'"+" and destination="+"'"+this.destination+"'";
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    public ResultSet SearchTrainbynm()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from train where trainnm="+"'"+this.trainnm+"'";
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    
    public ResultSet SearchAllTrains()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from train";
            PreparedStatement ps=con.prepareStatement(qry);
          
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }

    
}
