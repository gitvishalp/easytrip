/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

public class ppayment {
    
    private int transid;
    private int pbookingid;
    private int amount;
    private String transdate;

    public int getTransid() {
        return transid;
    }

    public int getPbookingid() {
        return pbookingid;
    }

    public int getAmount() {
        return amount;
    }

    public String getTransdate() {
        return transdate;
    }

    public void setTransid(int transid) {
        this.transid = transid;
    }

    public void setPbookingid(int pbookingid) {
        this.pbookingid = pbookingid;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void setTransdate(String transdate) {
        this.transdate = transdate;
    }
    
    public int packagePay()
    {
        try{
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into ppayment values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getTransid());
            ps.setInt(2,this.getPbookingid());
            ps.setString(3,this.getTransdate());
            ps.setInt(4,this.getAmount());
            
            int rs2=ps.executeUpdate();
            if(rs2==1)
                return 1;
            else
                return 0;
        }catch(Exception ex){
            System.out.println(ex);
        }
       return 1;
    }
    
    public int AutoPtransid()
    {
        int tid=0;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select max(transid) from ppayment";
            PreparedStatement ps=con.prepareStatement(qry);
            ResultSet rs=ps.executeQuery();
            rs.next();
            tid=rs.getInt(1);
            tid++;  
        }catch(Exception ex){
            System.out.println(ex);
        }
       return tid;
    }
    
    public ResultSet Searchppayment()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from ppayment where pbookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.pbookingid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
}
