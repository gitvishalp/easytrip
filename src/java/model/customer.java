/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;
import java.io.*;



public class customer {
    
    private int custid;
    private String custname;
    private Date custdob;
    private String email;
    private String mobno;
    private String addr;
    private String gender;
    private String passwd;

    public int getCustid() {
        return custid;
    }

    public String getCustname() {
        return custname;
    }

    public String getEmail() {
        return email;
    }

    public String getMobno() {
        return mobno;
    }

    public String getAddr() {
        return addr;
    }

    public String getGender() {
        return gender;
    }

    public String getPasswd() {
        return passwd;
    }
   

    public void setCustid(int custid) {
        this.custid = custid;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMobno(String mobno) {
        this.mobno = mobno;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPasswd(String password) {
        this.passwd = password;
    }
     
    
    
    
    public int CustomerRegistration()
    {
        try{
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="insert into customer values(?,?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1,this.getCustid());
            ps.setString(2,this.getCustname());
            ps.setString(3, this.getEmail());
            ps.setString(4,this.getAddr());
            ps.setString(5,this.getGender());
            ps.setString(6,this.getMobno());
            ps.setString(7,this.getPasswd());
           
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
    
    public ResultSet CustomerLogin()
            
    {
        ResultSet r=null;
        try{
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from customer where email="+"'"+this.getEmail()+"'"+" and passwd="+"'"+this.getPasswd()+"'";
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            if(r.next())
            {
                return r;
            }
            else
                return null;
        }catch(Exception ex){
            System.out.println(ex);
        }
       return r;
    }
    
    
    public int AutoGenId()
    {
        int cid=0;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select max(custid) from customer";
            PreparedStatement ps=con.prepareStatement(qry);

            ResultSet rs=ps.executeQuery();
            rs.next();
            cid=rs.getInt(1);
            cid++;  
        }catch(Exception ex){
            System.out.println(ex);
        }
       return cid;
    }
    
    public String forgetcode()
    {
        try{
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from customer where email="+"'"+this.getEmail()+"'";
            PreparedStatement ps=con.prepareStatement(qry);

            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                return rs.getString("passwd");
            }
            else
               return "Invalid Email ID";
        }catch(Exception ex){
            System.out.println(ex);
        }
      return passwd;
    }
    
    public int changepass()
    {
        try{
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="update customer set passwd=? where custid=?";
            PreparedStatement ps=con.prepareStatement(qry);

            ps.setString(1,this.getPasswd());
            ps.setInt(2,this.getCustid());
         
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
    
    
     public ResultSet CustomerSearch()
            
    {
        ResultSet r=null;
        try{
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from customer";
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            if(r.next())
            {
                return r;
            }
            else
                return null;
        }catch(Exception ex){
            System.out.println(ex);
        }
       return r;
    }
}
