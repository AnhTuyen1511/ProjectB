/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author BLC
 */
public class OrderDAO {

    public ArrayList<Order> getListOrder() {

        ArrayList<Order> listOrder = new ArrayList<>();

        try {
            Connection con = DBContext.getConnection();
            String query = "SELECT * FROM orders;";
            Statement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                Order order = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
                listOrder.add(order);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listOrder;
    }
}
