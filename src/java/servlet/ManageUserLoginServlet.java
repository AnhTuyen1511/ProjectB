/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.CustomerDAO;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manager.CustomerManager;

/**
 *
 * @author phuon
 */
public class ManageUserLoginServlet extends HttpServlet {

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
            CustomerDAO myCustomerDAO = new dao.CustomerDAO();
            manager.CustomerManager myCustomerManager = new CustomerManager();
            String mode = request.getParameter("mode");
            String target = "UserLogin.jsp";
            HttpSession mySession = request.getSession();

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String mess = "";

            System.out.println(username + password + "");

            ArrayList<Customer> listCustomer = new ArrayList<>();
            listCustomer = myCustomerDAO.getListCustomer();

            System.out.println(listCustomer.get(1).getUsername() + listCustomer.get(1).getPassword());
            if (mode.equals("userLogin")) {
                for (int i = 0; i < listCustomer.size(); i++) {
                    String user = listCustomer.get(i).getUsername().toString();
                    String pass = listCustomer.get(i).getPassword().toString();
                    if (user.equals(username) && pass.equals(password)) {
                        target = "index.jsp";
                        mySession.setAttribute("UserLogin", listCustomer.get(i).getName());
                        mySession.setAttribute("CustomerID", listCustomer.get(i).getCustomer_id());
                        break;
                    } else {
                        mess = "Invalid username or password";
                        target = "UserLogin.jsp";
                        request.setAttribute("mess", mess);
                    }

                }
            }
            if (mode.equals("userProfile")) {
//                String id = request.getParameter();
                
                target = "UserProfile.jsp";
                mySession = request.getSession();
                
            }
            
            if (mode.equals("userLogout")) {
                target = "index.jsp";
                mySession = request.getSession();
                mySession.removeAttribute("UserLogin");

            }
            if(mode.equals("forgetPass")){
                
            }

            if (mode.equals("userRegister")) {
                String customerName = request.getParameter("name");
                String R_username = request.getParameter("R_username");
                password = request.getParameter("R_password");
                String address = request.getParameter("address");
                String email = request.getParameter("email");
                int phoneNumber = Integer.parseInt(request.getParameter("phone_number"));
                int status = 1;

                Customer newCustomer = new Customer(R_username, password, customerName, phoneNumber, address, email, status);

                listCustomer = myCustomerDAO.getListCustomer();
                for (int i = 0; i < listCustomer.size(); i++) {
                    if (listCustomer.get(i).getUsername().equals(R_username)) {
                        target = "UserRegister";
                        mess = ("Username is already exist");
                        request.setAttribute("registerMess", mess);
                        break;
                    } else {
                         myCustomerManager.addCustomer(newCustomer);
                        target = "UserLogin.jsp";
                        break;
                    }

                }
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
