package com.islington.controller;

import com.islington.model.UserModel;
import com.islington.service.RegisterService;
import com.islington.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.UUID;

@WebServlet("/register")
@MultipartConfig
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final RegisterService registerService;
    private static final String UPLOAD_DIR = "uploads";

    public RegisterController() {
        this.registerService = new RegisterService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String retypePassword = request.getParameter("retypePassword");
        String dobString = request.getParameter("dob");
        String gender = request.getParameter("gender");
        Part imagePart = request.getPart("image");

        // Validate password match
        if (!password.equals(retypePassword)) {
            request.setAttribute("error", "Passwords do not match");
            repopulateForm(request, firstName, lastName, email, dobString, gender);
            doGet(request, response);
            return;
        }

        // Parse date of birth
        Date dob;
        try {
            dob = Date.valueOf(dobString); // Expects yyyy-MM-dd format from date input
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid date format");
            repopulateForm(request, firstName, lastName, email, dobString, gender);
            doGet(request, response);
            return;
        }

        // Handle file upload
        String imagePath = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            try {
                String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR;
                Files.createDirectories(Paths.get(uploadPath));
                
                String fileName = UUID.randomUUID().toString() + 
                                 getFileExtension(imagePart.getSubmittedFileName());
                imagePath = UPLOAD_DIR + "/" + fileName;
                
                try (InputStream input = imagePart.getInputStream()) {
                    Files.copy(input, Paths.get(uploadPath, fileName), StandardCopyOption.REPLACE_EXISTING);
                }
            } catch (IOException e) {
                request.setAttribute("error", "Failed to upload profile image");
                repopulateForm(request, firstName, lastName, email, dobString, gender);
                doGet(request, response);
                return;
            }
        }

        // Hash password
        String hashedPassword = PasswordUtil.hashPassword(email, password);
        if (hashedPassword == null) {
            request.setAttribute("error", "Password processing failed");
            repopulateForm(request, firstName, lastName, email, dobString, gender);
            doGet(request, response);
            return;
        }

        // Create user model
        UserModel user = new UserModel();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setDob(dob);
        user.setGender(gender);
        user.setProfileImagePath(imagePath);

        // Register user
        Boolean registrationStatus = registerService.registerUser(user);

        if (registrationStatus != null && registrationStatus) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("error",
                registrationStatus == null ? "Database error occurred" : "Email already exists");
            repopulateForm(request, firstName, lastName, email, dobString, gender);
            doGet(request, response);
        }
    }

    private void repopulateForm(HttpServletRequest request, String firstName, String lastName, 
                               String email, String dob, String gender) {
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("email", email);
        request.setAttribute("dob", dob);
        request.setAttribute("gender", gender);
    }

    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf('.');
        return (dotIndex == -1) ? "" : fileName.substring(dotIndex);
    }
}