/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;

public class bankdetail {
    private String cardno;
    private String cardtype;
    private String banknm;
    private int cvv;
    private String holder;
    private String validity;
    private int balance;

    public String getCardno() {
        return cardno;
    }

    public String getCardtype() {
        return cardtype;
    }

    public String getBanknm() {
        return banknm;
    }

    public int getCvv() {
        return cvv;
    }

    public String getHolder() {
        return holder;
    }

    public String getValidity() {
        return validity;
    }

    public int getBalance() {
        return balance;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public void setCardtype(String cardtype) {
        this.cardtype = cardtype;
    }

    public void setBanknm(String banknm) {
        this.banknm = banknm;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public void setHolder(String holder) {
        this.holder = holder;
    }

    public void setValidity(String validity) {
        this.validity = validity;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
    
    public  ResultSet Validate()
    {
        ResultSet r=null;
        try{
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from bankdetail where cardno="+"'"+this.getCardno()+"'"+" and cardtype="+"'"+this.getCardtype()+"'"+" and banknm="+"'"+this.getBanknm()+"'"+" and cvv="+"'"+this.getCvv()+"'"+" and holder="+"'"+this.getHolder()+"'"+" and validity="+"'"+this.getValidity()+"'";
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
