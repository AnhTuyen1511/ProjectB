/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.BookDAO;
import dao.CustomerDAO;
import dao.OrderDAO;
import dao.StaffDAO;
import entity.Book;
import entity.Customer;
import entity.Order;
import entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phuon
 */
public class StaffManageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String mode = request.getParameter("mode");
            BookDAO bookDAO = new BookDAO();
            String target = "";
            if(mode.equals("StaffViewBook")){
                ArrayList<Book>listBook = new ArrayList<>();
                listBook= bookDAO.getListBook();
                
                target = "StaffViewBook.jsp";
                request.setAttribute("listBook", listBook);
            }
            if(mode.equals("StaffViewOrder")){
                OrderDAO myOrderDAO = new OrderDAO();
                ArrayList<Order> listOrder = new ArrayList<>();
                listOrder = myOrderDAO.getListOrder();
                
                target = "StaffViewOrder.jsp";
                request.setAttribute("listOrder", listOrder);
            }
            if (mode.equals("StaffViewCustomer")) {
                List<Customer> listCustomer = new ArrayList<>();
                CustomerDAO myCustomerDAO = new CustomerDAO();
                listCustomer = myCustomerDAO.getListCustomer();

                target = "StaffViewCustomer.jsp";
                request.setAttribute("listCustomer", listCustomer);
            }
            RequestDispatcher rd = request.getRequestDispatcher(target);
            rd.forward(request, response);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
