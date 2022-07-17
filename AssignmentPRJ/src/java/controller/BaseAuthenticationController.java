/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author minh huong
 */
public abstract class BaseAuthenticationController extends HttpServlet {

    private int isAuthenticated(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null) {
            return -1; // chua dang nhap
        } else {
            String visitingUrl = request.getServletPath();
            Role role = account.getRole();
            for (Feature feature : role.getFeatures()) {
                if (feature.getUrl().equals(visitingUrl)) {
                    return 1;
                }

            }
            return 0; // khong co quyen
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
        if (isAuthenticated(request, response) == 1) {
            //do something
            processGet(request, response);
        } else if (isAuthenticated(request, response) == 0) {
            response.getWriter().print("Access denied!");
        } else {
            response.sendRedirect("../login.jsp");
        }
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

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
        if (isAuthenticated(request, response)==1) {
            //do something
            processPost(request, response);
        } else if (isAuthenticated(request, response) == 0) {
            response.getWriter().print("Access denied!");
        } else {
            response.sendRedirect("../login.jsp");
        }
    }

}
