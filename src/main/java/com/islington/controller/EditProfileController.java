package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.islington.model.UserModel;
import com.islington.service.UserService;

@WebServlet("/edit-profile")
public class EditProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("user");
        UserModel user = new UserService().getUserByEmail(email);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/pages/userprofile-edit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("user");
        String newName = request.getParameter("name");
        
        if (new UserService().updateUserName(email, newName)) {
            request.getSession().setAttribute("successMessage", "Profile updated!");
        } else {
            request.getSession().setAttribute("errorMessage", "Update failed");
        }
        response.sendRedirect(request.getContextPath() + "/profile");
    }
}