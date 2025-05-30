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
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;


/**
 *
 * @author MSI PC
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    
    public BookDAO bDAO = new BookDAO();
    
    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String txtSearchValue = request.getParameter("txtSearchValue");
        if(txtSearchValue == null) txtSearchValue ="";
        
        List<BookDTO> books = bDAO.searchByTitle(txtSearchValue);
        request.setAttribute("books", books);
        request.setAttribute("txtSeachValue", txtSearchValue);
    }
    
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
                        
                        search(request, response);
                    }else{
                        request.setAttribute("message","Incorrect UserID or PassWord");
                        url = "login.jsp";
                    }
                }else if(action.equals("logout")) {
                    request.getSession().invalidate();
                    url = "login.jsp";    
                }else if(action.equals("search")) {
                    url = "search.jsp";
                    
                    search(request, response);
                }else if(action.equals("delete")) {
                    String id = request.getParameter("id");
                    if (bDAO.updateQuantityToZero(id)) {
                        url = "search.jsp";
                        search(request, response);
                    }

                }else if(action.equals("add")) {
                    try {
                        boolean checkedError = false;
                        String bookID = request.getParameter("txtBookID");
                        String title = request.getParameter("txtTitle");
                        String author = request.getParameter("txtAuthor");
                        int publishYear = Integer.parseInt(request.getParameter("txtPublishYear"));
                        double price = Double.parseDouble(request.getParameter("txtPrice"));
                        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));

                        BookDTO book = new BookDTO(bookID, title, author, publishYear, price, quantity);
                       
                        if(bookID == null || bookID.trim().isEmpty()){
                            checkedError = true;
                            request.setAttribute("txtBookID_error", "BookID cannot empty");
                        }
                        
                        if(quantity < 0){
                            checkedError = true;
                            request.setAttribute("txtQuantity_error", "Quantity >= 0 ");
                        }
                        
                        if(title == null || title.trim().isEmpty()){
                            checkedError = true;
                            request.setAttribute("txtTitle_error", "Title cannot empty");
                        }
                        
                         if(author == null || author.trim().isEmpty()){
                            checkedError = true;
                            request.setAttribute("txtAuthor_error", "Author cannot empty");
                        }
                        
                        if(publishYear <= 0){
                            checkedError = true;
                            request.setAttribute("txtPublishYear_error", "Publish Year > 0 ");
                        }
                        
                        if(price <= 0){
                            checkedError = true;
                            request.setAttribute("txtPrice_error", "Price > 0 ");
                        }
                        
                        if (!checkedError) {
                            bDAO.create(book);
                            url = "search.jsp";
                            search(request, response);
                        }else {
                            request.setAttribute("book", book);
                            url = "bookForm.jsp";
                        }
                        
                    } catch (Exception e) {
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
