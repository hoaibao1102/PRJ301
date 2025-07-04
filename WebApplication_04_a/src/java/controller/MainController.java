/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI PC
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    
    public int GCD(int a, int b){
        int min = Math.min(a, b);
        for (int i =min ; i >= 0; i--) {
            if(a%i== 0 && b%i ==0){
                return i;
            } 
        }
        return 1;
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MainController</title>");
            out.println("</head>");
            out.println("<body>");
            String txtA = request.getParameter("txtA");
            String txtB = request.getParameter("txtB");
            if(txtA == null || txtA.trim().length()== 0){
                out.println("Pls enter 'a' value");
                return;
            }
            if(txtB == null || txtB.trim().length()== 0){
                out.println("Pls enter 'b' value");
                return;
            }
            
            int a = 0 ;
            int b = 0;
            try {
                a = Integer.parseInt(txtA);
                if(a<=0 ){
                    out.println("a must be integer number");
                    return;
                }
            } catch (Exception e) {
                out.println("a must be integer number");
                
            }
            
            try {
                b = Integer.parseInt(txtB);
                if(b<=0 ){
                    out.println("b must be integer number");
                    return;
                }
            } catch (Exception e) {
                out.println("b must be integer number");
                
            }
            
            int result = GCD(a, b);
            out.println("GCD("+a+","+b+") = "+ result);
            
            
            out.println("</body>");
            out.println("</html>");
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
