/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;




public class hotel {
    private int hotelid;
    private String hotelnm;
    private String hoteladdr;
    private String city;
    private String contact;
    private String stars;
    private String amen;
    private String meal;
    private String feat;
    private Blob image;
    private int price;

    public int getHotelid() {
        return hotelid;
    }

    public String getHotelnm() {
        return hotelnm;
    }

    public String getHoteladdr() {
        return hoteladdr;
    }

    public String getCity() {
        return city;
    }

    public String getContact() {
        return contact;
    }

    public String getStars() {
        return stars;
    }

    public String getAmen() {
        return amen;
    }

    public String getMeal() {
        return meal;
    }

    public String getFeat() {
        return feat;
    }

    public Blob getImage() {
        return image;
    }

    public int getPrice() {
        return price;
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

    public void setCity(String city) {
        this.city = city;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public void setAmen(String amen) {
        this.amen = amen;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }

    public void setFeat(String feat) {
        this.feat = feat;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public ResultSet SearchHotel()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from hotel where city="+"'"+this.city+"'";
            PreparedStatement ps=con.prepareStatement(qry);
            r=ps.executeQuery();
            
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    public ResultSet SearchHotelbyno()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from hotel where hotelid=?" ;
            PreparedStatement ps=con.prepareStatement(qry);
            ps.setInt(1, this.hotelid);
            r=ps.executeQuery();
            
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }
    
    
    public ResultSet SearchAllHotel()
    {
        
        ResultSet r=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","easytrip","easytrip");
            String qry="select * from hotel";
            PreparedStatement ps=con.prepareStatement(qry);
          
            r=ps.executeQuery();
            
        }catch(Exception ex){
           System.out.println(ex); 
        }
        return r;
    }

  

    
}
