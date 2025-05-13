/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dao.UserDAO;
import dto.BookDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI PC
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private static final String LOGIN_PAGE= "login.jsp" ;
    
    public UserDTO getUser(String id){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readbyID(id);
        
        return user;
    }
    
    public boolean isValidLogin(String strUserID, String strPassword){
        UserDTO user = getUser(strUserID);
        
        return user != null && user.getPassword().equals(strPassword);
            
    }
    
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
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    String txtUsername = request.getParameter("txtUsername");
                    String txtPassword = request.getParameter("txtPassword");
                    
                    if(isValidLogin(txtUsername, txtPassword)){
                        url = "search.jsp";
                        UserDTO user = getUser(txtUsername);
                        request.getSession().setAttribute("nameUser", user);
                    }else{
                        request.setAttribute("message","Incorrect UserID or PassWord");
                        url = "login.jsp";
                    }
                }else if(action.equals("logout")) {
                    request.getSession().invalidate();
                    url = "login.jsp";    
                }else if(action.equals("search")) {
                    url = "search.jsp";
                    BookDAO bdao = new BookDAO();
                    String txtSearchValue = request.getParameter("txtSearchValue");
                    List<BookDTO> books = bdao.searchByTitle(txtSearchValue);
                    request.setAttribute("books", books);
                    request.setAttribute("txtSeachValue", txtSearchValue);
                }else if(action.equals("delete")) {
                    BookDAO bdao = new BookDAO();
                    String id = request.getParameter("id");
                    if (bdao.updateQuantityToZero(id)) {
                        url = "search.jsp";
                        String txtSearchValue = request.getParameter("txtSearchValue");
                        List<BookDTO> books = bdao.searchByTitle(txtSearchValue);
                        request.setAttribute("books", books);
                        request.setAttribute("txtSeachValue", txtSearchValue);
                    }

                }
            }

        } catch (Exception e) {
            log("Error in MainController: " +e.toString());
        }finally{
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
