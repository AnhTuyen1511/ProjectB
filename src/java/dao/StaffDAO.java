/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Staff;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author phuon
 */
public class StaffDAO {
    public ArrayList<Staff> getStaff() {
        try {

            Connection con = DBContext.getConnection();
            String query = "select * from staff;";
            Statement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);
            ArrayList<Staff> listStaff = new ArrayList<>();
            while (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                String staff_name = rs.getString("staff_name");
                String uName = rs.getString("username");
                String pass = rs.getString("password");
                String email = rs.getString("email");
                int staff_status = rs.getInt("staff_status");
        
                Staff staff = new Staff(staff_id, staff_name, uName, pass, email, staff_status);
                listStaff.add(staff);
            }
            return listStaff;
        } catch (Exception e) {
        }
        return null;
    }
      public void insertStaff(Staff staff) {
        try {
            Connection con = DBContext.getConnection();
            PreparedStatement pst = con.prepareStatement("INSERT INTO staff( staff_name, username, password, email, staff_status) VALUE(?,?,?,?,?)");
            pst.setString(1, staff.getStaff_name());
            pst.setString(2, staff.getUsername());
            pst.setString(3, staff.getPassword());
            pst.setString(4, staff.getEmail());
            pst.setInt(5, staff.getStaff_status());
            pst.executeUpdate();
            pst.close();
            con.close();
            System.out.println();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    
    
}
