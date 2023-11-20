/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Discount;
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
public class DiscountDAO {
     public ArrayList<Discount> getListDiscount() {

        ArrayList<Discount> listDiscount = new ArrayList<>();

        try {
            Connection con = DBContext.getConnection();
            String query = "SELECT * FROM discount;";
            Statement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                Discount discount = new Discount(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)
                );
                listDiscount.add(discount);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listDiscount;
    }

    public void insertDiscount(Discount discount) {
        try {
            Connection con = DBContext.getConnection();
            PreparedStatement pst = con.prepareStatement("INSERT INTO discount(code, percent,start_date, end_date, status) VALUE(?,?,?,?,?)");
            
            pst.setString(1, discount.getCode().toString());
            pst.setInt(2, discount.getPercent());
            pst.setString(3, discount.getStartDate().toString());
            pst.setString(4, discount.getEndDate().toString());
            pst.setInt(5, discount.getStatus());

            pst.executeUpdate();

            pst.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void updateDiscount(Discount discount) {

        try {
            Connection con = DBContext.getConnection();

            String query = "UPDATE discount SET percent = ?, start_end = ?, end_start = ?, status = ? WHERE code = ?";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(5, discount.getCode().toString());
            pst.setInt(1, discount.getPercent());
            pst.setString(2, discount.getStartDate().toString());
            pst.setString(3, discount.getEndDate().toString());
            pst.setInt(4, discount.getStatus());

            pst.executeUpdate();

            pst.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    public Discount getDiscountByCode(String code) {
        Discount discount = null;
        try {
            Connection con = DBContext.getConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM discount WHERE code = ?");
            pst.setString(1, code);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                discount = new Discount(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)
                );
            }
            con.close();
            pst.close();
            rs.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return discount;
    }

    
}
