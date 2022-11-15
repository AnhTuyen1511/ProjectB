/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AdminDAO;
import entity.Admin;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phuon
 */
public class LoginServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String username = "";
        String password = "";
        ArrayList<Admin> list = new ArrayList<>();
        AdminDAO adminDao = new AdminDAO();
        list = adminDao.getAdmin();
        for (int i = 0; i < list.size(); i++) {
            username = list.get(i).getUsername();
            password = list.get(i).getPassword();

        }
        String userNameForm = request.getParameter("username");
        String passwordForm = request.getParameter("password");

        String mode = request.getParameter("mode");
        String target = "home.jsp";
        if (mode.equals("loginAdmin")) {
            if (userNameForm.equals(username) && passwordForm.equals(password)) {
                target = "home.jsp";
                session.setAttribute("adminLogin", username);
            } else {
                target = "adminLogin.jsp";
                String mess = "Username or password invalid";
                request.setAttribute("mess", mess);
            }
        }
        if (mode.equals("logoutAdmin")) {
            target = "adminLogin.jsp";
            session = request.getSession();
            session.removeAttribute("userLogin");
        }

        RequestDispatcher rd = request.getRequestDispatcher(target);
        rd.forward(request, response);

//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
//            Statement st = con.createStatement();
//            ResultSet rs = st.executeQuery(query1);
//
//            String userNameForm = request.getParameter("username");
//            String passwordForm = request.getParameter("password");
//            boolean check = false;
//
//            if ((userNameForm != "") && (passwordForm != "")) {
//                while (rs.next()) {
//                    if ((rs.getString("username").equals(userNameForm))
//                            & (rs.getString("password").equals(passwordForm))) {
//
//                        HttpSession mySession = ((HttpServletRequest) request).getSession(true);
//                        // set gia tri
//                        mySession.setAttribute("username", userNameForm);
//                        mySession.setAttribute("password", passwordForm);
//
//                        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
//                        rd.forward(request, response);
//
//                        check = true;
//                        break;
//                    } else {
//                        continue;
//                    }
//                }
//                if (!check) {
//                    RequestDispatcher rd = request.getRequestDispatcher("loginError.jsp");
//                    rd.forward(request, response);
//                }
//            } else if (!check) {
//                System.out.println("fail2");
//                RequestDispatcher rd = request.getRequestDispatcher("loginError.jsp");
//                rd.forward(request, response);
//            }
//
//            st.close();
//            con.close();
//
//        } catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//        
//        
//        
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
