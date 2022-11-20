/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author BLC
 */
public class OrderDetailDAO {

    public ArrayList<OrderDetail> getListOrderDetail() {

        ArrayList<OrderDetail> listOrder = new ArrayList<>();

        try {
            Connection con = DBContext.getConnection();
            String query = "SELECT * FROM orderdetail;";
            Statement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                );
                listOrder.add(orderDetail);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listOrder;
    }
    
    public void insertOrderDetail(OrderDetail orderDetail) {
        try {
            Connection con = DBContext.getConnection();
            PreparedStatement pst = con.prepareStatement("INSERT INTO orderdetail (order_id, book_id,quantity, price) VALUE(?,?,?,?)");

            pst.setInt(1, orderDetail.getOrder_id());
            pst.setInt(2, orderDetail.getBook_id());
            pst.setInt(3, orderDetail.getQuantity());
            pst.setInt(4, orderDetail.getPrice());

            pst.executeUpdate();

            pst.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
    }
}
