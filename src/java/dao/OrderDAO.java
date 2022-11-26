/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
    
    public ArrayList<Order> getListOrderByCustomerID(int customerID) {

        ArrayList<Order> listOrder = new ArrayList<>();

        try {
            Connection con = DBContext.getConnection();
            String query = "SELECT * FROM orders WHERE customer_id = "+customerID;
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
    
    
    
    public int saveOrders(Order order) {
        int newID=0;
        try {
            String sqlstm = "INSERT INTO orders(customer_id, order_date, total , shipping_status, order_status) VALUE(?,?,?,?,?)";

            Connection con = DBContext.getConnection();
            PreparedStatement pst = con.prepareStatement(sqlstm, PreparedStatement.RETURN_GENERATED_KEYS);

            pst.setInt(1, order.getCustomer_id());
            pst.setString(2, order.getOrder_date());
            pst.setInt(3, order.getTotal() );
           pst.setString(4, order.getShipping_status() );
           pst.setInt(5, order.getOrder_status() );

            pst.executeUpdate();

            ResultSet res = pst.getGeneratedKeys();
            
            while (res.next()) {
                newID=res.getInt(1);
                System.out.println("Generated key: ----------" +newID );
            }

            pst.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return newID;
    }
}
