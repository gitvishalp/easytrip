/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;


public class admin {
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public int AdminLogin()
    {
        try{
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from admin where username="+"'"+this.getUsername()+"'"+" and password="+"'"+this.getPassword()+"'";
            PreparedStatement ps=con.prepareStatement(qry);
        
            ResultSet r=ps.executeQuery();
            if(r.next())
                return 1;
            else
                return 0;
        }catch(Exception ex){
            System.out.println(ex);
        }
       return 1;
    }
}
