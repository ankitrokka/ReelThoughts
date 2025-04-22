package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.islington.util.SessionUtil;

@WebServlet("/admin/dashboard")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check if the user is logged in and is an admin
        String userRole = (String) SessionUtil.getAttribute(request, "userRole");
        
        if (userRole == null) {
            // Redirect to login if not logged in
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        } 
        
        if (!"admin".equals(userRole)) {
            // Redirect non-admin users to home
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        
        // If admin, forward to admin dashboard
        request.getRequestDispatcher("/WEB-INF/admin/adminDashboard.jsp").forward(request, response);
    }
}