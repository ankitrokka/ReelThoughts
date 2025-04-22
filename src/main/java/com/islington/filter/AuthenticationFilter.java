package com.islington.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import com.islington.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/login";
    private static final String HOME = "/home";
    private static final String REGISTER = "/register";
    private static final String ADMIN_DASHBOARD = "/admin/admindashboard.jsp";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic, if required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        System.out.println("Filtering URI: " + uri); // Debugging line

        // Allow access to login, register, home, and static resources
        if (uri.contains(LOGIN) || uri.contains(HOME) || uri.contains(REGISTER) ||
            uri.contains("/css/") || uri.contains("/js/") || uri.contains("/images/")) {
            chain.doFilter(request, response);
            return;
        }

        // Check if the user is logged in
        String userRole = (String) SessionUtil.getAttribute(req, "userRole");

        if (userRole == null) {
            // Redirect to login if not logged in
            res.sendRedirect(req.getContextPath() + LOGIN);
            return;
        }

        // Prevent normal users from accessing admin dashboard
        if (uri.contains(ADMIN_DASHBOARD) && !"admin".equals(userRole)) {
            res.sendRedirect(req.getContextPath() + HOME);
            return;
        }

        // Continue with request if authorized
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup logic, if required
    }
}






/*
 * package com.islington.filter;
 * 
 * import jakarta.servlet.Filter; import jakarta.servlet.FilterChain; import
 * jakarta.servlet.FilterConfig; import jakarta.servlet.ServletException; import
 * jakarta.servlet.ServletRequest; import jakarta.servlet.ServletResponse;
 * import jakarta.servlet.annotation.WebFilter; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse;
 * 
 * import java.io.IOException;
 * 
 * import com.islington.util.SessionUtil;
 * 
 * @WebFilter(asyncSupported = true, urlPatterns = "/*") public class
 * AuthenticationFilter implements Filter {
 * 
 * private static final String LOGIN = "/login"; private static final String
 * HOME = "/home"; private static final String ADMIN_DASHBOARD =
 * "/admin/admindashboard.jsp";
 * 
 * @Override public void init(FilterConfig filterConfig) throws ServletException
 * { // Initialization logic, if required }
 * 
 * @Override public void doFilter(ServletRequest request, ServletResponse
 * response, FilterChain chain) throws IOException, ServletException {
 * 
 * HttpServletRequest req = (HttpServletRequest) request; HttpServletResponse
 * res = (HttpServletResponse) response;
 * 
 * String uri = req.getRequestURI();
 * 
 * // Allow access to login, register, and home pages if (uri.endsWith(LOGIN) ||
 * uri.endsWith(HOME)) { chain.doFilter(request, response); return; }
 * 
 * // Check if the user is logged in and has a role set in the session String
 * userRole = (String) SessionUtil.getAttribute(req, "userRole");
 * 
 * if (userRole == null) { // Redirect to login if the user is not logged in
 * res.sendRedirect(req.getContextPath() + LOGIN); return; }
 * 
 * if (uri.endsWith(ADMIN_DASHBOARD) && !"admin".equals(userRole)) { // Redirect
 * non-admin users trying to access admin dashboard
 * res.sendRedirect(req.getContextPath() + HOME); return; }
 * 
 * chain.doFilter(request, response); // Continue with the request if the user
 * is authorized }
 * 
 * @Override public void destroy() { // Cleanup logic, if required } }
 */