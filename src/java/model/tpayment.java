/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

public class tpayment {
   private int transid;
   private int tbookingid;
   private int amount;
   private String transdate;

    public int getTransid() {
        return transid;
    }

    public int getTbookingid() {
        return tbookingid;
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

    public void setTbookingid(int tbookingid) {
        this.tbookingid = tbookingid;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void setTransdate(String transdate) {
        this.transdate = transdate;
    }
   
    public int TrainPay()
    {
        try{
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into tpayment values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getTransid());
            ps.setInt(2,this.getTbookingid());
            ps.setInt(3,this.getAmount());
            ps.setString(4,this.getTransdate());
            
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
    
    public ResultSet Searchtpayment()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from tpayment where tbookingid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.tbookingid);
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    public int Autotransid()
    {
        int tid=0;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select max(transid) from tpayment";
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
    
}
