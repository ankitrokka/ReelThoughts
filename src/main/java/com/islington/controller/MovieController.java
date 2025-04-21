package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author
 * Servlet implementation class MovieController
 */
@WebServlet(
    name = "MovieController",
    urlPatterns = {"/Movies"}
)
public class MovieController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MovieController() {
        super();
    }

    /**
     * Handles GET requests to display movies page
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/movie.jsp").forward(request, response);
    }

    /**
     * Handles POST requests similarly
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
