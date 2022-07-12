/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;


public class fpassenger {
    
    private int bookingid;
    private String passname;
    private int passage;
    private String passgen;
    private int seatno;

    public int getBookingid() {
        return bookingid;
    }

    public String getPassname() {
        return passname;
    }

    public int getPassage() {
        return passage;
    }

    public String getPassgen() {
        return passgen;
    }

    public int getSeatno() {
        return seatno;
    }

    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }

    public void setPassname(String passname) {
        this.passname = passname;
    }

    public void setPassage(int passage) {
        this.passage = passage;
    }

    public void setPassgen(String passgen) {
        this.passgen = passgen;
    }

    public void setSeatno(int seatno) {
        this.seatno = seatno;
    }

 
    
    
    public int FpassengerAdd()
    {
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into fpassenger values(?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getBookingid());
            ps.setString(2,this.getPassname());
            ps.setInt(3,this.getPassage());
            ps.setString(4,this.getPassgen());
            ps.setInt(5,this.getSeatno());
                       
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
    
    public int Autoseatno()
    {
        int sno=0;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select max(seatno) from fpassenger";
            PreparedStatement ps=con.prepareStatement(qry);

            ResultSet rs=ps.executeQuery();
            rs.next();
            sno=rs.getInt(1);
            sno++;  
        }catch(Exception ex){
            System.out.println(ex);
        }
       return sno;
    }
    
    
    public ResultSet Searchfpassenger()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from fpassenger where bookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.bookingid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
}
