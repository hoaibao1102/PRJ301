/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import DTO.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.rmi.server.LogStream.log;


/**
 *
 * @author MSI PC
 */
@WebServlet(name = "regisController", urlPatterns = {"/regisController"})
public class regisController extends HttpServlet {

    private static final String REGIS_PAGE = "RegisForm.jsp";
    private static final String LOGIN_PAGE= "LoginForm.jsp" ;
    
    public UserDAO uDAO = new UserDAO();

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
        String url = REGIS_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = REGIS_PAGE;
            } else {
                if (action.equals("regis")) {
                    if ("regis".equals(action)) {
                        boolean checkedError = false;
                        // Lấy dữ liệu từ form đăng ký
                        String fullName = request.getParameter("txtFullname");
                        String email = request.getParameter("txtEmail");
                        String phone = request.getParameter("txtPhone");
                        String password = request.getParameter("txtPassword");
                        String confirmPassword = request.getParameter("txtConfirmPassword");
                        
                        UserDTO newUser = new UserDTO(fullName, email, phone, password,"customer");
                        if(fullName == null || fullName.trim().isEmpty()){
                            checkedError = true;
                            request.setAttribute("txtFullname_error", "Your name cannot empty");
                        }
                        
                        if(email == null || email.trim().isEmpty()){
                            checkedError = true;
                            request.setAttribute("txtEmail_error", "Email cannot empty");
                        }
                        
                        
                        if(phone == null || phone.trim().isEmpty() || phone.length() != 10){
                            checkedError = true;
                            request.setAttribute("txtPhone_error", "phone cannot empty and length longer than 9 number");
                        }
                        
                        if(password == null || password.trim().isEmpty()){
                            checkedError = true;
                            request.setAttribute("txtPassword_error", "password cannot empty");
                        }
                        
                        if(confirmPassword == null || confirmPassword.trim().isEmpty() || !confirmPassword.equals(password)){
                            checkedError = true;
                            request.setAttribute("txtConfirmPassword_error", "confirm sai ");
                        }

                        if (!checkedError) {
                            uDAO.create(newUser);
                            url = LOGIN_PAGE;
                        }else {
                            request.setAttribute("newUser", newUser);
                            url = LOGIN_PAGE;
                        }

                }

                }
            }

        } catch (Exception e) {
            log("Error in MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
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
